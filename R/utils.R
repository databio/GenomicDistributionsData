#' Checks to make sure a package object is installed,
#' and if so, returns it. If the library is not installed, it issues a warning
#' and returns NULL.
#
#' @param BSgenomeString A BSgenome compatible genome string.
#' @return A BSgenome object if installed.
.requireAndReturn = function(BSgenomeString) {
    if (requireNamespace(BSgenomeString))
        return(utils::getAnywhere(BSgenomeString)$objs[[1]])
    else
        warning(BSgenomeString, " is not installed")
    return(NULL)
}


#' Load selected EnsDb library
#'
#' @param genomeBuild string, genome identifier
#'
#' @return loaded library
#' 
#'
#' @examples
#' \dontrun{
#' loadEnsDb("hg19")
#' }
loadEnsDb = function(genomeBuild) {
    databasePkgString = switch (genomeBuild,
                                grch38 = "EnsDb.Hsapiens.v86",
                                hg38 = "EnsDb.Hsapiens.v86",
                                hg19 = "EnsDb.Hsapiens.v75",
                                mm10 = "EnsDb.Mmusculus.v79",
                                bogus = "bogus" # a bogus db for unit tests
    )
    
    if (is.null(databasePkgString)) {
        stop("I don't know how to map the string ", genomeBuild,
                " to a EnsDb")
    }
    return(.requireAndReturn(databasePkgString))
}


#' Load selected TxDb library
#'
#' @param genomeBuild string, genome identifier
#'
#' @return loaded library
#' 
#'
#' @examples
#' \dontrun{
#' loadTxDb("hg19")
#' }
loadTxDb = function(genomeBuild) {
    databasePkgString = switch (genomeBuild,
                                grch38 = "TxDb.Hsapiens.UCSC.hg38.knownGene",
                                hg38 = "TxDb.Hsapiens.UCSC.hg38.knownGene",
                                hg19 = "TxDb.Hsapiens.UCSC.hg19.knownGene",
                                mm10 = "TxDb.Mmusculus.UCSC.mm10.knownGene",
                                mm9 = "TxDb.Mmusculus.UCSC.mm9.knownGene",
                                bogus = "bogus" # a bogus (uninstalled) db for unit tests
    )
    if (is.null(databasePkgString))
        stop("I don't know how to map the string ", genomeBuild, " to a TxDb")
    return(.requireAndReturn(databasePkgString))
}

#' Loads BSgenome objects from UCSC-style character vectors.
#'
#' This function will let you use a simple character vector (e.g. 'hg19') to
#' load and then return BSgenome objects. This lets you avoid having to use the
#' more complex annotation for a complete BSgenome object (e.g.
#' BSgenome.Hsapiens.UCSC.hg38.masked)
#' 
#' @param genomeBuild One of 'hg19', 'hg38', 'mm10', 'mm9', or 'grch38'
#' @param masked Should we used the masked version? Default:TRUE
#' @return a BSgenome object according to the specified genome assembly
#' 
#' @import BSgenome
#' @import GenomicRanges
#' 
#' @examples
#' \dontrun{
#' bsg = loadBSgenome('hg19')
#' }
loadBSgenome = function(genomeBuild, masked=TRUE) {
    # Convert the given string into the BSgenome notation
    if (!requireNamespace("BSgenome", quietly=TRUE)) {
        message("BSgenome package is not installed.")
    }
    databasePkgString = switch (genomeBuild,
                                grch38 = "BSgenome.Hsapiens.UCSC.hg38",
                                hg38 = "BSgenome.Hsapiens.UCSC.hg38",
                                hg19 = "BSgenome.Hsapiens.UCSC.hg19",
                                mm10 = "BSgenome.Mmusculus.UCSC.mm10",
                                mm9 = "BSgenome.Mmusculus.UCSC.mm9",
                                bogus = "bogus" # a bogus (uninstalled) genome for unit tests
    )
    if (masked) {
        databasePkgString = paste0(databasePkgString, ".masked")
    }
    
    if (is.null(databasePkgString)) {
        stop("I don't know how to map the string ", genomeBuild,
                " to a BSgenome")
    }
    return(.requireAndReturn(databasePkgString))
}
