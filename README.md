**Due to GitHub file size restrictions the actual `.rda` files are not included in this repository.**
See "Installation" section for data building instructions

# GenomicDistributionsData

R package that provides full data for GenomicDistributions package that provides functions for calculating and plotting the distribution of query features (*e.g.* genomic ranges) across the genome.

## Installation

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("GenomicDistributions")
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
