library (ggplot2)
library(dbscan)
library(rgl)
library(NbClust)
library(fmsb)
library(caret)
library(lattice) 

#load the Iris data(iris)
# show the first 6 lines
head(iris, 6)

#Apply PCA
data <- iris[, 1:4]
iris.species <- iris[, 5]
ir.pca <- prcomp(data, center = TRUE, scale. = TRUE)
Ir.pca

plot(ir.pca, type = "l")

summary(ir.pca)

To visualise the 4-D dataset, using the first two PCs, copy this code and run it:
  
  
iris.species <- iris[, 5]
plot(ir.pca[["x"]][,1:2], col = iris.species)

library(dbscan)
data(DS3)
plot(DS3, pch = 20, cex = 0.25)

td <- 0
max_i <- 10 # max clusters
for (i in 2:max_i) {
  km.model <- kmeans(DS3, centers = i)
  td[i-1] <- km.model$tot.withinss
}
par()
plot(2:max_i, td, type = "b",pch = 19, col = "red",xlab = "Number of Clusters",ylab = "total distortion")
plot(2:max_i, td, type = "b",pch = 19, col = "red",xlab = "Number of Clusters",ylab = "total distortion")

res<-NbClust(DS3, distance = "uclidean", min.nc=2, max.nc=max_i, method = "kmeans", index = "silhouette")# this command also returns the clustering solution as well
par()
plot(2:max_i,res[["All.index"]], type = "b", pch = 19, col = "red", xlab = "Number of Clusters", ylab = "Silhouette score")


solution=kmeans(DS3, 8)# it is clear from the silhouette score k=8
plot(DS3,col=solution[["cluster"]])# visualise the clustering solution

solution=kmeans(DS3, 8)# it is clear from the silhouette score k=2
plot(DS3,col=solution[["cluster"]])# visualise the clustering solution
