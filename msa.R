if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

#if (!require("msa", quietly = TRUE))
#  BiocManager::install("msa")

if (!require("Biostrings", quietly = TRUE))
  BiocManager::install("Biostrings")

if (!require("DECIPHER", quietly = TRUE))
  BiocManager::install("DECIPHER")

# --

#library(msa)
library(Biostrings)
library(DECIPHER)

sequences <- readDNAStringSet("Sequences_RAW.fasta")
alignment <- AlignSeqs(sequences, verbose = TRUE)
print(alignment, show=c("Complete"))
set_alignment <- as(alignment, "DNAStringSet")
writeXStringSet(set_alignment, file = "Master_Alignment.fas")

# --

consensus <- ConsensusSequence(alignment, ambiguity = FALSE)
names(consensus) <- "Capsicum Consensus"
writeXStringSet(
  consensus,
  format = "fasta",
  file = "Consensus.fas")
