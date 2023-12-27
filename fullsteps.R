#Import data into R and show it.

mydata <- read.csv("Data/finance.csv", header=TRUE)
mydata

#Demonstrate how to apply Descriptive Statistics in R.
summary (mydata)

#Show the name of variables in the dataset.
mydata <- read.csv("Data/finance.csv", header=TRUE) 
names(mydata)



#Show the number of rows and columns in the dataset.
mydata <- read.csv("Data/finance.csv", header=TRUE) 
nrow(mydata)   
ncol(mydata)



#Show the structure of the dataset.
mydata <- read.csv("Data/finance.csv", header=TRUE) 
str(mydata)



#Select the first 5 rows and last 5 rows in the dataset.
mydata <- read.csv("Data/finance.csv")

# Select the first 5 rows
first_5_rows <- head(mydata, 5)
first_5_rows

# Select the last 5 rows
last_5_rows <- tail(mydata, 5)
last_5_rows

mydata <- read.csv("C:/data/finance.csv", header=TRUE)
head(mydata, n=5)  
tail(mydata, n=5)

# Visualisation
  

#Plot boxplot for “Revenue” and “Totals.Expenditure”
mydata <- read.csv("Data/finance.csv", header=TRUE) 
boxplot(mydata$Totals.Revenue, mydata$Totals.Expenditure, main="finance", names=c("Totals.Revenue","Totals.Expenditure"))


#Plot histogram for the Totals.Expenditure /
mydata <- read.csv("Data/finance.csv", header=TRUE) 
hist(mydata$Totals.Expenditure)


#improve the dataset’s quality by removing outliers from the “Totals.Revenue”.

# Create a new dataset called outliers
mydata <- read.csv("Data/finance.csv", header=TRUE) 
outliers <- boxplot(mydata$Totals.Revenue, main="finance", names=c("Totals.Revenue"))$out


#summarise the "outliers" dataframe:
summary(outliers)

x<-mydata 
x<- x[-which(x$Totals.Revenue %in% outliers),] 
boxplot(x$Totals.Revenue)