% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{chromSizes_hg38}
\alias{chromSizes_hg38}
\title{hg38 chromosome sizes}
\format{
A named vectors of lengths with one item per chromosome
}
\source{
BSgenome.Hsapiens.UCSC.hg38 package
}
\usage{
chromSizes_hg38(metadata=FALSE)
}
\arguments{
\item{metadata}{\code{logical} value indicating whether only
metadata should be returned or if the resource
should be loaded}
}
\value{
A vector of lengths
}
\description{
A dataset containing chromosome sizes for Homo sapiens hg38 genome assembly
}
\examples{
hg38c = chromSizes_hg38()

}
\keyword{datasets}
