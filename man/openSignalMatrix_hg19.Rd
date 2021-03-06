% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{openSignalMatrix_hg19}
\alias{openSignalMatrix_hg19}
\title{A dataset containing open chromatin regions across all cell types defined by ENCODE for Homo Sapiens hg19}
\format{
data.frame, rows represent whole selection of open
chromatin regions across all cell types defined by ENCODE, columns are
individual cell types and values are normalized open chromatin signal values.
}
\source{
\url{http://big.databio.org/open_chromatin_matrix/openSignalMatrix_hg19_percentile99_01_quantNormalized_round4d.txt.gz}
}
\usage{
openSignalMatrix_hg19(metadata=FALSE)
}
\arguments{
\item{metadata}{\code{logical} value indicating whether only
metadata should be returned or if the resource
should be loaded}
}
\value{
A data.frame with hg19 open chromatin regions.
}
\description{
Preparation steps:
\enumerate{
\item{made a universe of regions by merging regions across cell types defined as opened in ENCODE}
\item{took bigwig files from ENCODE for individual cell types, merged replicates, filtered out blacklisted sites}
\item{evaluated the signal above regions defined by previous step}
\item{performed quantile normalization}
}
}
\examples{
\dontrun{
hg19OpenSignal = openSignalMatrix_hg19()
}

}
\keyword{datasets}
