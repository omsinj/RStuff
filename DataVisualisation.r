airlines <- read.csv("Data/airlines.csv")
hist(airlines$Delays.Security)

airlines <- read.csv("Data/airlines.csv")
plot(airlines$Delays.Security, type="h")

airlines <- read.csv("Data/airlines.csv")
barplot(
  airlines$Delays.Security, 
  main="Number of Delays based on Security", 
  xlab='Delays.Security', 
  horiz=TRUE)

airlines <- read.csv("Data/airlines.csv")
plot(
  airlines$Delays.Security, 
  xlab='Index',
  ylab='No of Instances', 
  main='Number of Delays based on Security',
  col='red')

airlines <- read.csv("Data/airlines.csv")
boxplot(airlines[,7:10],main="Flights dylays")