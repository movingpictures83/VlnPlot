library(dplyr)
library(Seurat)
library(patchwork)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
    pdf(outputfile)
    pbmc <- readRDS(paste(pfix, parameters["rdsfile", 2], sep="/"))
    feat <- readSequential(paste(pfix, parameters["features", 2], sep="/"))
    write.csv(pbmc@assays$RNA@data@i, paste(outputfile, "csv", sep="."))
    VlnPlot(pbmc, features=feat, ncol=length(feat))
}


