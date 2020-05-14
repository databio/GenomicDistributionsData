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

Does not include `.rda` data files. Need to build them locally. From command line:

```bash
git clone https://github.com/databio/GenomicDistributionsData.git
cd GenomicDistributionsData
R CMD INSTALL .
for file in data-raw/*
do
  Rscript "$file"
done
R CMD INSTALL .
```

## Usage

```r
library("GenomicDistributionsData")
data(TSS_hg38)
```
