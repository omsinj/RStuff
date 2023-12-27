install.packages("ggplot2")
install.packages("dbscan")
install.packages("rgl")
install.packages("NbClust")
install.packages("fmsb")
install.packages("caret")
install.packages("lattice") 

library (ggplot2)
library(dbscan)
library(rgl)
library(NbClust)
library(fmsb)
library(caret)
library(lattice) 

# you have to set seed every time you want to get a reproducible random result.
set.seed(2) 
# set the number of the data points
n <- 400 
# Generate the 3d dataset
x <- cbind(x = runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1))
true_clusters <- rep(1:4, time = 100)
plot3d(x, col = true_clusters, pch = true_clusters)# visualize the dataset

#initial value of total distortion
td <- 0   
# set a max clusters
max_i <- 10 
for (i in 2:max_i) {
  km.model <- kmeans(x, centers = i)
  td[i-1] <- km.model$tot.withinss
}
plot(2:max_i, td, type = "b",pch = 19, col = "red",xlab = "Number of Clusters",ylab = "total distortion")
Now, look for the Elbow of the curve. What is the best value of K?
  
#The curve shows that the best value of k is four, as this is where we can see the “elbow” of the curve.
  
# the following command also returns the clustering solution as well
res<-NbClust(x, distance = "euclidean", min.nc=2, max.nc=max_i, method = "kmeans", index = "silhouette")
plot(2:max_i,res[["All.index"]], type = "b", pch = 19, col = "red", xlab = "Number of Clusters", ylab = "Silhouette score")

#kmeans clustering
# From the figure above, it is clear from the silhouette score k=4
set.seed(2)  
# set the number of the data points 
n <- 400  
# Generate the 3d dataset 
x <- cbind(x = runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1)) 
true_clusters <- rep(1:4, time = 100)
solution=kmeans(x, 4) 
# visualize the clustering solution
plot3d(x,col=solution[["cluster"]], pch = true_clusters)



# set the number of the data points

n <- 400

x <- cbind(x = 5*runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1))

true_clusters <- rep(1:4, time = 100)

# visualize the dataset

plot3d(x, col = true_clusters, pch = true_clusters)

#initial value of total distortion
td <- 0   
# set a max clusters
max_i <- 10 
for (i in 2:max_i) {
  km.model <- kmeans(x, centers = i)
  td[i-1] <- km.model$tot.withinss
}
plot(2:max_i, td, type = "b",pch = 19, col = "red",xlab = "Number of Clusters",ylab = "total distortion")
Now, look for the Elbow of the curve. What is the best value of K?
  
  #set the seed of the random generator
  set.seed(2)
# set the number of the data points
n <- 400
x <- cbind(x = 5*runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1))
true_clusters <- rep(1:4, time = 100)
#Normalization
#-------------------------------------------------
preproc1 <- preProcess(x, method=c("center", "scale"))
norm1 <- predict(preproc1,x)
#--------------------------------------------------
# visualize the dataset
plot3d(norm1, col = true_clusters, pch = true_clusters)

#Estimating k using the Elbow method
td <- 0
# set the max clusters
max_i <- 10
for (i in 2:max_i) {
  km.model <- kmeans(norm1, centers = i)
  td[i-1] <- km.model$tot.withinss
}
par()
plot(2:max_i, td, type = "b",pch = 19, col = "red",xlab = "Number of Clusters",ylab = "total distortion")

# Estimating using the Silhouette-score method
res<-NbClust(norm1, distance = "euclidean", min.nc=2, max.nc=max_i, method = "kmeans", index = "silhouette")# this command also returns the clustering solution as well
par()
plot(2:max_i,res[["All.index"]], type = "b", pch = 19, col = "red", xlab = "Number of Clusters", ylab = "Silhouette score")

# K-means clustering
solution=kmeans(norm1, 3)# it is clear from the silhouette score k=4
plot3d(x,col=solution[["cluster"]], pch = true_clusters)# visualize the clustering solution
solution=kmeans(norm1, 4)# it is clear from the silhouette score k=4
plot3d(x,col=solution[["cluster"]], pch = true_clusters)# visualize the clustering solution
