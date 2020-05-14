assemblyList=c("hg19","hg38","mm9","mm10")
for(assembly in assemblyList){
    storedObjectName = paste0("chromSizes_", assembly)
    message(paste0("Building: ", storedObjectName))
    chromSizes = buildChromSizes(assembly)
    assign(storedObjectName, chromSizes)
    do.call("use_data", list(as.name(storedObjectName), overwrite = TRUE))
    rm(chromSizes, storedObjectName)
}
