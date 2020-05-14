library(GenomicDistributionsData)
library(usethis)
assemblyList=c("hg19","hg38","mm9","mm10")
for(assembly in assemblyList){
    storedObjectName = paste0("TSS_", assembly)
    message(paste0("Building: ", storedObjectName))
    TSS = buildTSS(assembly)
    assign(storedObjectName, TSS)
    do.call("use_data", list(as.name(storedObjectName), overwrite = TRUE))
    rm(TSS, storedObjectName)
}