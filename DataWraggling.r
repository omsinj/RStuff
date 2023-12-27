Name <- c("Adrian", "Rob", "Daniel", NA)
Sex <- c("men", "men","men", "women")
Age <- c(45, 40, 53, NA)
dt <- data.frame(Name, Sex, Age)
dt

to detect missing values, use

is.na(dt)

To find the sum and percentages of the missing values in your dataset, copy and run this code:
  
  
sum(is.na(dt))
mean(is.na(dt))

First, you will use the function called "omit" to remove the missing data.

na.omit(dt)

Replace Missing Values by Column Mean
First, create this Dataset in script and run it: 
  
  
# Create data frame
data <- data.frame(x1 = c(NA, 2:10),                       
                     x2 = c(rep(6, 8), NA, NA),
                     x3 = c(3, NA, 2, 7, 8, 9, NA, 4, 10, 0))
# Print data frame
data

Replacing Missing Data in One Specific Column
For this process, you will substitute the NA values in one specific column by its average, using the “is.na ” and “mean ” functions.

Copy this data set into script and run it:
  
  
# Duplicate data frame
data1 <- data    
# Replace NA in one column
data1$x1[is.na(data1$x1)] <- mean(data1$x1, na.rm = TRUE) 
# Print updated data frame
data1  

# Duplicate data frame
data2 <- data
# Replace NA in all columns using for loop
for(i in 1:ncol(data)) {                                   
  data2[ , i][is.na(data2[ , i])] <- mean(data2[ , i], na.rm = TRUE)
}
# Print updated data frame
data2

Replacing Missing Data in All Columns Using the “na.aggregate()” function
You will now use the ”na.aggregate()” function to replace all missing data in all columns. This requires installing and loading the zoo Package.

Write the following code into script and run it:
  
install.packages("zoo")

Now load the Library Zoo:
  
library("zoo")
Now install and load the library call “zoo”. Then, copy and run this bit of code:
  
# Replace NA in all columns
data3 <- na.aggregate(data) 
# Print updated data frame
data3 
To demonstrate this process of removing values, copy and paste this bit of code and run it:
  
df <- data.frame(var1=c(1, 3, 3, 4, 5),
                 var2=c(7, 7, 8, 3, 2),
                 var3=c(3, 3, 3, 3, 3),
                 var4=c(14, 16, 22, 19, 18))
#view data frame
df

Next, you need to remove variable three, which has a cardinality of 1.

#remove columns var3
new_df <- subset(df, select = -c(var3))

#view updated data frame
new_df

Managing outliers

airlines<-read.csv("Data/airlines.csv", head=TRUE)
boxplot(airlines$Delays.Security)

outliers <- boxplot(airlines$Delays.Security, plot=FALSE)$out
outliers

summary(outliers)

To remove outliers, you can use the  “-”  function, which indicates the removal of the values included in the outliers variable.

x<-airlines
x<- x[-which(x$Delays.Security %in% outliers),]
boxplot(x$Delays.Security)

Managing Noise
x = seq(1,400,1)
gaus_signal = 1250 * dnorm(x, mean = 200, sd = 10)
noise = rnorm(400, mean = 0, sd = 10)
noisy_signal = gaus_signal + noise
plot(x = x, y = noisy_signal, type = "l", lwd = 2, col = "blue", xlab = "x", ylab = "signal")
lines(x = x, y = gaus_signal, lwd = 2)

To “clean up” noise within the data, add the following code to the original code and run it:
  
  
mov_avg_7 = rep(1/7, 7)
noisy_signal_movavg = filter(noisy_signal, mov_avg_7)
plot(x = x, y = noisy_signal_movavg, type = "l", lwd = 2, col = "blue", xlab = "x", ylab = "signal")
lines(x = x, y = gaus_signal, lwd = 2)

Managing skew/imbalanced target features

install.packages("ggpubr")
install.packages("moments")

library(ggpubr)
library(moments)

data("USJudgeRatings")
df <- USJudgeRatings
head(df)

To plot the CONT variable distribution.
  
ggdensity(df, x = "CONT", fill = "lightgray", title = "CONT") +
scale_x_continuous(limits = c(3, 12)) +
stat_overlay_normal_density(color = "red", linetype = "dashed")

To plot the PHYS variable distribution,

ggdensity(df, x = "PHYS", fill = "lightgray", title = "PHYS") +
scale_x_continuous(limits = c(3, 12)) +
stat_overlay_normal_density(color = "red", linetype = "dashed")

To plot computed skewness numerically:
  
skewness(df$CONT, na.rm = TRUE)
skewness(df$PHYS, na.rm = TRUE)

To fix the skewness within the dataset
  
df$CONT <- log10(df$CONT)
df$PHYS <- log10(max(df$CONT+1) - df$CONT)

To plot the fixed skewness of the CONT variable.
  
ggdensity(df, x = "CONT", fill = "lightgray", title = "CONT") +
stat_overlay_normal_density(color = "red", linetype = "dashed")

To plot the fixed skewness of the PHYS variable
  
  
ggdensity(df, x = "PHYS", fill = "lightgray", title = "PHYS") +
stat_overlay_normal_density(color = "red", linetype = "dashed")

Finally, to calculate the skewness values that have been reduced after fixing the data.
  
skewness(df$CONT, na.rm = TRUE)
skewness(df$PHYS, na.rm = TRUE)