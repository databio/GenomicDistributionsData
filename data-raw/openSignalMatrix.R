library(GenomicDistributionsData)
library(usethis)
assemblyList=c("hg19","hg38", "mm10")
for(assembly in assemblyList){
    cellMatrix = buildOpenSignalMatrix(assembly)
    storedObjectName = paste0("openSignalMatrix_", assembly)
    message("saving ", storedObjectName)
    assign(storedObjectName, cellMatrix)
    do.call("use_data", list(as.name(storedObjectName), overwrite = TRUE))
    rm(cellMatrix, storedObjectName)
}
