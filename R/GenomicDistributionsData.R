#' GenomicDIstributionsData
#'
#' Data (hg19, hg38, mm9, mm10) for the GenomicDistributions package.
#'
#' @name GenomicDistributionsData
#'
#' @details The vignette details how to
#'         access the data from ExperimentHub: 
#'         browseVignettes("GenomicDistributionsData")
#'         Details on how the data files were created can be 
#'         found under the R directory in utils.R and build.R
#'         
#'@import ExperimentHub
#'@importFrom utils  read.csv 
#'@importFrom AnnotationHub  query
#'        
#' @examples
#' \dontrun{ 
#' library(ExperimentHub)
#' hub = ExperimentHub()
#' q = query(hub, "GenomicDistributionsData")
#' q[[1]]
#' q[["EH3472"]]
#' 
#' }
#' @source UCSC hg19, hg38, mm9, mm10 genome packages and ensembldb
NULL

