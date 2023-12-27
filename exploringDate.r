(mydata <- read.csv("Data/business_dynamics.csv", header=TRUE))
summary(mydata)
summary(mydata[4])
names(mydata)

nrow(mydata) 
ncol(mydata) 

str(mydata)

head(mydata, n=10) 

tail(mydata, n=10)

library(dplyr)
sample_n(mydata, 5)