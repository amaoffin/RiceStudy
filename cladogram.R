if (!require("ape")) {
  install.packages("ape", dependencies = TRUE)
  library(ape)
}

#data loading
phenotypic_data <- read.csv("phenotypes.csv", row.names = 1)
species_names <- phenotypic_data[,1]
phenotypic_matrix <- phenotypic_data[,-1]

#hierarchical clustering and dendrogram+cladogram making
hclust_result <- hclust(dist(phenotypic_matrix, method = "complete"))
dendrogram <- as.dendrogram(hclust_result)
cladogram <- as.cladogram(dendrogram)

#plotting
plot(
  cladogram,
  main = "Phenotypic Cladogram",
  cex = 0.8,
  edge.width = 1.5,
  tip.color = "darkblue"
)
