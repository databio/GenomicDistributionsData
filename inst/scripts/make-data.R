### =====================================================
### GenomicDistributionsData


### Step 0 - We'll use a few helper functions to load libraries from which we'll extract the data ### 
# This step is only for reference, as the main building functions already incorporate these loading scripts.  

# To load a specific TxDb library
TxDb = loadTxDb("hg38")

# To load a specific Ensdb library
Ensdb = loadEnsDb("hg38")

# We can also load a BSgenome object by simply passing a string 
BSgenome = loadBSgenome("hg38")

### Step 1 -  Use the main functions to process and build datasets from those libraries ###

# Build chomosome sizes
chrom = buildChromSizes("hg38")

# Build Transcription Start Sites
TSS = buildTSS("hg38")

# Build gene models
geneModels = buildGeneModels("hg38")

# Build Open chromatin signal matrices
openSignal = buildOpenSignalMatrix("hg38")








