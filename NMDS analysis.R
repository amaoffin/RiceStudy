if (!require("vegan")) {
  install.packages("vegan")
  library(vegan)
}

#data loading
data <- read.csv("NMDS.csv", row.names = 1)

#NMDS and initial plot
nmds_result <- metaMDS(data)
plot(nmds_result, type = "n")

#k-means
num_clusters <- 3
clusters <- kmeans(nmds_result$points, centers = num_clusters)

#adding to plot
points(nmds_result, col = clusters$cluster, pch = 19)
text(nmds_result, pos = 3, cex = 0.7)
legend("topright",
       legend = paste("Cluster", unique(clusters$cluster)),
       col = unique(clusters$cluster),
       pch = 19,
       title = "Clusters")
