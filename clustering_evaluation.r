# Sum of Squared Errors (SSE)

set.seed(2)   
# set the number of the data points  
n <- 400   
# Generate the 3d dataset  
x <- cbind(x = runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1))
solution=kmeans(x, 4) 
solution[["tot.withinss"]]

# Scatter Criteria
set.seed(2)   
# set the number of the data points  
n <- 400   
# Generate the 3d dataset  
x <- cbind(x = runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1))
solution=kmeans(x, 4) 
distmat=dist(rbind(colMeans(solution[["centers"]]),solution[["centers"]]))
between_cluster=sum(solution[["size"]]*distmat[1:4])
total_scatter_metric=between_cluster+solution[["tot.withinss"]]
total_scatter_metric

External Accuracy Measures
External Accuracy Measures assume that we are given the ground truth classification of instances in the data.  

#The Rand Index is a well-known external accuracy measure that compares clustering solution with the ground truth classification. The Rand Index lies between 0 and 1. The higher the Rand Index the better the clustering solution (i.e. the closer to the ground truth classification).

#RAND SCORE = a + b / (a + b + c + d) Eq(2)

where

#a = observations which are available in the same cluster in the clustering solution and the ground truth classification.
#b = observations which are available in different clusters in the clustering solution and the ground truth
#c = observations which are available in the same cluster in the clustering solution but not in the ground truth
#d = observations which are available in the same cluster in the ground truth and not in the clustering solution.
#Now, copy and paste the following code into R script to calculate the Rand Index. Remember to take notes to help you with your assessment preparation.

library(fossil)
set.seed(2)   
# set the number of the data points  
n <- 400   
# Generate the 3d dataset  
x <- cbind(x = runif(4, 0, 1) + rnorm(n, sd = 0.1), y = runif(4, 0, 1) + rnorm(n, sd = 0.1),z = runif(4, 0, 1) + rnorm(n, sd = 0.1))
solution=kmeans(x, 4)
rand.index(solution[["cluster"]], true_clusters)
#You should now see the following results in your console. Note that the Rand Index is 0.987619.