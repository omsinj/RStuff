install.packages("ggplot2") #this is used to create graphics declaratively

install.packages("readxl") #this is used import Excel files into R

install.packages("readr") #this is used import a textfile into R

install.packages("openxlsx") #this is used to import excel file into R

install.packages("dplyr"): #this is used for data wrangling and data analysis
  
  install.packages("tidyr"): # this helps to make the data ‘tidy’
  
  install.packages("data.table"): #this is used to handle big data during data manipulation
  
  install.packages("mlr3") #this is used for machine learning

library (ggplot2)

library (readxl)

library(readr)

library(openxlsx)

library (dplyr)

library (tidyr)

library (data.table)

library (mlr3)

(bs <- read.csv("data/bs.csv"))

(BikeSharing <- readRDS("Data/BikeSharing.RDS"))
