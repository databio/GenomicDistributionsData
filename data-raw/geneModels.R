
assemblyList=c("hg19","hg38","mm9","mm10")
for(assembly in assemblyList){
    storedObjectName = paste0("geneModels_", assembly)
    message(paste0("Building: ", storedObjectName))
    geneModels = buildGeneModels(assembly)
    assign(storedObjectName, geneModels)
    do.call("use_data", list(as.name(storedObjectName), overwrite = TRUE))
    rm(geneModels, storedObjectName)
}

