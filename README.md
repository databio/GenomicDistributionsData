**Due to GitHub file size restrictions the actual `.rda` files are not included in this repository.**
See "Installation" section for data building instructions

# GenomicDistributionsData

R package that provides full data for GenomicDistributions package that provides functions for calculating and plotting the distribution of query features (*e.g.* genomic ranges) across the genome.

## Installation

### From remote tarball

Includes `.rda` data files in `data/` subdirectory

```r
install.packages("http://big.databio.org/GenomicDistributionsData/GenomicDistributionsData_0.0.1.tar.gz", repos=NULL)
```

### Locally from this repository

Does not include `.rda` data files. These can be accessed using ExperimentHub or with named functions 
as detailed in the package vignette.

```bash
git clone https://github.com/databio/GenomicDistributionsData.git
cd GenomicDistributionsData
R CMD INSTALL .
```

## Usage

```r
library("GenomicDistributionsData")
TSS_hg38()
```
Alternatively:

```r
hub = ExperimentHub()
TSShg38 = hub[["EH3477"]]
```
