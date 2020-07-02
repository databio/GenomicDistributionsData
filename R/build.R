#' Build chromosome sizes object 
#'
#' @param assembly string, reference assembly identifier to chromosome sizes for
#'
#' @return named int, sizes of chromosome with respective names
#' 
#' @importFrom GenomeInfoDb seqlengths
#' 
#'
#' @examples
#' \dontrun{
#' buildChromSizes("hg19")
#' }
buildChromSizes <- function(assembly) {
    BSG = loadBSgenome(assembly)
    chromSizesGenome = GenomeInfoDb::seqlengths(BSG)
    return(chromSizesGenome)
}

#' Build gene models
#' 
#' 
#'
#' @param refAssembly string, reference assembly identifier to build gene
#'  model for
#'
#' @return a list of four GRanges objects: genesGR, exonsGR, threeUTRGR, 
#' fiveUTRGR
#' 
#' @import ensembldb
#' @import GenomicRanges
#' @import GenomicFeatures
#' @import GenomeInfoDb
#'
#' @examples
#' \dontrun{
#' hg19models = buildGeneModels("hg19")
#' }
buildGeneModels <- function(refAssembly) {
    if (!requireNamespace("ensembldb", quietly=TRUE)) 
        message("ensembldb package is not installed.")
    geneModels = tryCatch({ 
        message("building using Ensembl")
        EnsDb = loadEnsDb(refAssembly)
        codingFilter = AnnotationFilter::AnnotationFilter(~ gene_biotype == "protein_coding")
        geneFeats = ensembldb::genes(EnsDb, filter = codingFilter, columns=NULL)
        exonFeats = ensembldb::exons(EnsDb, filter = codingFilter, columns=NULL)
        UTR5Feats = ensembldb::fiveUTRsByTranscript(EnsDb, 
                                                    filter = codingFilter,
                                                    columns = NULL)
        UTR3Feats = ensembldb::threeUTRsByTranscript(EnsDb, 
                                                    filter = codingFilter, 
                                                    columns = NULL)
        UTR5Feats = unlist(UTR5Feats)
        UTR3Feats = unlist(UTR3Feats)
        # Smash 
        geneFeats = reduce(geneFeats)
        exonFeats = reduce(exonFeats)
        UTR5Feats = reduce(UTR5Feats)
        UTR3Feats = reduce(UTR3Feats)
        # Keep only standard chromosomes
        geneFeats= keepStandardChromosomes(geneFeats, pruning.mode = "coarse")
        exonFeats = keepStandardChromosomes(exonFeats, pruning.mode = "coarse")
        UTR5Feats = keepStandardChromosomes(UTR5Feats, pruning.mode = "coarse")
        UTR3Feats = keepStandardChromosomes(UTR3Feats, pruning.mode = "coarse")
        # Since we're storing this data, we want it to be small.
        elementMetadata(geneFeats) = NULL
        elementMetadata(exonFeats) = NULL
        elementMetadata(UTR5Feats) = NULL
        elementMetadata(UTR3Feats) = NULL
        # Change from ensembl-style chrom annotation to UCSC_style
        seqlevels(geneFeats) = paste0("chr", seqlevels(geneFeats))
        seqlevels(exonFeats) = paste0("chr", seqlevels(exonFeats))
        seqlevels(UTR5Feats) = paste0("chr", seqlevels(UTR5Feats))
        seqlevels(UTR3Feats) = paste0("chr", seqlevels(UTR3Feats))
        list(genesGR=geneFeats, exonsGR=exonFeats, threeUTRGR=UTR3Feats, 
            fiveUTRGR=UTR5Feats)
    }, error=function(err){
        # Try a TxDb instead
        message("Failed, trying a UCSC TxDb instead")
        message("Here's the original error message:")
        message(err)
        txdb = loadTxDb(refAssembly)
        exonFeats = GenomicFeatures::exons(txdb)
        geneFeats = GenomicFeatures::transcripts(txdb)
        UTR3Feats = GenomicFeatures::threeUTRsByTranscript(txdb)
        UTR5Feats = GenomicFeatures::fiveUTRsByTranscript(txdb) 
        geneFeats = reduce(geneFeats)
        exonFeats = reduce(exonFeats)
        list(genesGR=geneFeats, exonsGR=exonFeats,  threeUTRGR=UTR3Feats, 
            fiveUTRGR=UTR5Feats)
    })
    return(geneModels)
}

#' Build TSS
#'
#' @param assembly string, reference assembly identifier to TSS for
#'
#' @return GRanges object that consists of transcription start sites locations
#' 
#' @import ensembldb
#' @import GenomicRanges
#' @import GenomicFeatures
#'
#' @examples
#' \dontrun{
#' tss = buildTSS("hg19")
#' }
buildTSS <- function(assembly) {
    if (!requireNamespace("ensembldb", quietly=TRUE))
        message("ensembldb package is not installed.")
    # Using EnsDb
    EnsDb = NULL
    feats = tryCatch({
        message("building using Ensembl")
        EnsDb = loadEnsDb(assembly)
        codingFilter = AnnotationFilter::AnnotationFilter(
            ~ gene_biotype == "protein_coding")
        featsWide = ensembldb::genes(EnsDb, filter=codingFilter)
        # Grab just a single base pair at the TSS
        feats = promoters(featsWide, 1, 1)
        # Change from ensembl-style chrom annotation to UCSC_style
        seqlevels(feats) = paste0("chr", seqlevels(feats))
        feats
    }, error=function(err){
        message("failed, trying a UCSC TxDb instead")
        message("Here's the original error message:")
        message(err)
        # Using TxDb
        txdb = loadTxDb(assembly)
        # Grab just a single base pair at the TSS
        GenomicFeatures::promoters(txdb, 1, 1)
    })
    return(feats)
}


#' Build open signal matrix
#'
#' @param assembly string, reference assembly identifier to build gene
#'  model for 
#'
#' @return data.frame, rows represent whole selection of open 
#' chromatin regions across all cell types defined by ENCODE, columns are 
#' individual cell types and values are normalized open chromatin signal values
#' 
#'
#' @examples
#' \dontrun{
#' buildOpenSignalMatrix("hg19")
#' }
buildOpenSignalMatrix <- function(assembly) {
    storedObjectName = paste0("openSignalMatrix_", assembly)
    message("building ", storedObjectName)
    f = tempfile(pattern=storedObjectName, fileext=".txt.gz")
    url=paste0("http://big.databio.org/open_chromatin_matrix/openSignalMatrix_", 
                assembly, "_quantileNormalized_round4.txt.gz")
    utils::download.file(url=url, destfile=f)
    message("reading ", f)
    cellMatrix = data.table::fread(f)
    return(cellMatrix)
}