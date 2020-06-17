### =====================================================
### GenomicDistributionsData

## Build helper functions to build the R objects later on. 
#' Checks to make sure a package object is installed,
#' and if so, returns it. If the library is not installed, it issues a warning
#' and returns NULL.
.requireAndReturn = function(BSgenomeString) {
  if (requireNamespace(BSgenomeString))
    return(utils::getAnywhere(BSgenomeString)$objs[[1]])
  else
    warning(BSgenomeString, " is not installed")
  return(NULL)
}


#' Load selected EnsDb library
loadEnsDb = function(genomeBuild) {
  databasePkgString = switch (genomeBuild,
                              grch38 = "EnsDb.Hsapiens.v86",
                              hg38 = "EnsDb.Hsapiens.v86",
                              hg19 = "EnsDb.Hsapiens.v75",
                              mm10 = "EnsDb.Mmusculus.v79",
                              bogus = "bogus" # a bogus (uninstalled) db for unit tests
  )
  
  if (is.null(databasePkgString)) {
    stop("I don't know how to map the string ", genomeBuild,
         " to a EnsDb")
  }
  return(.requireAndReturn(databasePkgString))
}


#' Load selected TxDb library
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

## Detail the steps to build the R objects







