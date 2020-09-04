# Uploading new data files to ExperimentHub and updating the GenomicDIstributionsData package

The following [link](https://bioconductor.org/packages/devel/bioc/vignettes/ExperimentHub/inst/doc/CreateAnExperimentHubPackage.html) details
the steps to upload data files to Experiment Hub and create an ExperimentHub package. New or updated files would have to be added in new 
releases of GenomicDistributionsData. For added clarity, the steps can be summarized as follows:

## Step 1: Upload data to the BioConductor AWS S3 buckets

The first step requires uploading the data to AWS. To do this, you should email Lori Shepperd at **lori.shepherd@roswellpark.org** and ask for 
the respective access credentials. Steps on how to install the `AWS CLI` are detailed in **section 6.2** of the link provided above. Once you have requested access and received the proper keys, you will use them to set your `.aws/config`. Once the configuration is set, you should be able to upload 
the data files in the following manner:


```
# To upload a full directory use recursive:

aws --profile AnnotationContributor s3 cp test_dir s3://annotation-contributor/test_dir --recursive --acl public-read

# To upload a single file

aws --profile AnnotationContributor s3 cp test_file.txt s3://annotation-contributor/test_file.txt --acl public-read
```

## Step 2: Update metadata file

Before or after the data has been uploaded, update the `make-metadata.R` script under `inst/scripts/` to include the changed/new files. Once the 
dataframe has been edited, write to a `.csv` file to update the `metadata.csv` file under `inst/extdata`:

```r
write.csv(meta, file="inst/extdata/metadata.csv", row.names=FALSE)
```

## Step 3: Validate metadata and update vignette, man, NEWS, etc.

Once the metadata file has been properly updated, email Lori Shepperd at **lori.shepherd@roswellpark.org** to proceed with metadata validation and to
officially add the data files to the Bioconductor S3 bucket. You can now adjust the vignette, DESCRIPTION and other files required to pass `R CMD CHECK` and `R CMD BiocCheck`. 

If changes are to be merged into the master branch for Bioconductor submission, make sure to include the proper version bump from `0.99.z`. This will trigger a new build in the GenomicDistributions submission issue (since the webhook has already been added).  


