#' hg19 chromosome sizes
#'
#' A dataset containing chromosome sizes for Homo Sapiens hg19 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source BSgenome.Hsapiens.UCSC.hg19 package
#' @name chromSizes_hg19
#' @docType data
#' @keywords datasets
#' @usage data(chromSizes_hg19)
NULL

#' hg38 chromosome sizes
#'
#' A dataset containing chromosome sizes for Homo Sapiens hg38 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source BSgenome.Hsapiens.UCSC.hg38 package
#' @name chromSizes_hg38
#' @docType data
#' @keywords datasets
#' @usage data(chromSizes_hg38)
NULL

#' mm9 chromosome sizes
#'
#' A dataset containing chromosome sizes for Mus Musculus mm9 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source BSgenome.MMusculus.UCSC.mm9 package
#' @name chromSizes_mm9
#' @docType data
#' @keywords datasets
#' @usage data(chromSizes_mm9)
NULL

#' mm10 chromosome sizes
#'
#' A dataset containing chromosome sizes for Mus Musculus mm10 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source BSgenome.MMusculus.UCSC.mm10 package
#' @name chromSizes_mm10
#' @docType data
#' @keywords datasets
#' @usage data(chromSizes_mm10) 
NULL


#' hg19 TSS locations
#'
#' A dataset containing chromosome sizes for for Homo Sapiens hg19 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source EnsDb.Hsapiens.v75 package
#' @name TSS_hg19
#' @docType data
#' @keywords datasets
#' @usage data(TSS_hg19)
NULL

#' hg38 TSS locations
#'
#' A dataset containing chromosome sizes for Homo Sapiens hg38 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source EnsDb.Hsapiens.v86 package
#' @name TSS_hg38
#' @docType data
#' @keywords datasets
#' @usage data(TSS_hg38)
NULL

#' mm10 TSS locations
#'
#' A dataset containing chromosome sizes for Mus Musculus mm10 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source EnsDb.Mmusculus.v79 package
#' @name TSS_mm10
#' @docType data
#' @keywords datasets
#' @usage data(TSS_mm10)
NULL

#' mm9 TSS locations
#'
#' A dataset containing chromosome sizes for Mus Musculus mm9 genome assembly
#'
#' @format A named vectors of lengths with one item per chromosome
#' @source TxDb.Mmusculus.UCSC.mm9.knownGene package
#' @name TSS_mm9
#' @docType data
#' @keywords datasets
#' @usage data(TSS_mm9)
NULL


#' hg19 gene models
#'
#' A dataset containing gene models for Homo Sapiens hg19 genome assembly
#'
#' @format A list of two GRanges objects, with genes and exons locations
#' @source EnsDb.Hsapiens.v75 package
#' @name geneModels_hg19
#' @docType data
#' @keywords datasets
#' @usage data(geneModels_hg19)
NULL

#' hg38 gene models
#'
#' A dataset containing gene models for Homo Sapiens hg38 genome assembly
#'
#' @format A list of two GRanges objects, with genes and exons locations
#' @source EnsDb.Hsapiens.v86 package
#' @name geneModels_hg38
#' @docType data
#' @keywords datasets
#' @usage data(geneModels_hg38)
NULL

#' mm10 gene models
#'
#' A dataset containing gene models for Mus Musculus mm10 genome assembly
#'
#' @format A list of two GRanges objects, with genes and exons locations
#' @source EnsDb.Mmusculus.v79 package
#' @name geneModels_mm10
#' @docType data
#' @keywords datasets
#' @usage data(geneModels_mm10) 
NULL

#' mm9 gene models
#'
#' A dataset containing gene models for Mus Musculus mm9 genome assembly
#'
#' @format A list of two GRanges objects, with genes and exons locations
#' @source TxDb.Mmusculus.UCSC.mm9.knownGene package
#' @name geneModels_mm9
#' @docType data
#' @keywords datasets
#' @usage data(geneModels_mm9)
NULL


#’ Cell type metadata matrix
#' 
#' Table the maps cell types to tissues and groups
#'
#' @format data.table with 3 columns (cellType, tissue and group) and 74 rows (one per cellType)
#' @source self-curated dataset
#' @name cellTypeMetadata
#' @docType data
#' @keywords datasets
#' @usage data(cellTypeMetadata)
NULL


#’ hg38 open signal matrix 
#' 
#' A dataset containing open chromatin regions across all cell types defined by ENCODE for Homo Sapiens hg38
#'
#' Preparation steps:
#' \enumerate{
#'    \item{made a universe of regions by merging regions across cell types defined as opened in ENCODE}
#'    \item{took bigwig files from ENCODE for individual cell types, merged replicates, filtered out blacklisted sites}
#'    \item{evaluated the signal above regions defined by previous step}
#'    \item{performed quantile normalization}
#' }
#'
#' @format data.frame, rows represent whole selection of open 
#' chromatin regions across all cell types defined by ENCODE, columns are 
#' individual cell types and values are normalized open chromatin signal values.
#' @source \url{http://big.databio.org/open_chromatin_matrix/openSignalMatrix_hg38_quantileNormalized_round4.txt.gz}
#' @name openSignalMatrix_hg38
#' @docType data
#' @keywords datasets
#' @usage data(openSignalMatrix_hg38)
NULL


#’ hg19 open signal matrix
#' 
#' A dataset containing open chromatin regions across all cell types defined by ENCODE for Homo Sapiens hg19
#' 
#' Preparation steps:
#' \enumerate{
#'    \item{made a universe of regions by merging regions across cell types defined as opened in ENCODE}
#'    \item{took bigwig files from ENCODE for individual cell types, merged replicates, filtered out blacklisted sites}
#'    \item{evaluated the signal above regions defined by previous step}
#'    \item{performed quantile normalization}
#' }
#'
#' @format data.frame, rows represent whole selection of open 
#' chromatin regions across all cell types defined by ENCODE, columns are 
#' individual cell types and values are normalized open chromatin signal values.
#' @source \url{http://big.databio.org/open_chromatin_matrix/openSignalMatrix_hg319_quantileNormalized_round4.txt.gz}
#' @name openSignalMatrix_hg19
#' @docType data
#' @keywords datasets
#' @usage data(openSignalMatrix_hg19)
NULL
