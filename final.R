# Elina Turunen  
# elina.turunen@helsinki.fi 
# 1.3.2017
# Introduction to open data science course, spring 2017 
# Final assignment: Data Wrangling


# read data
happiness <- read.table("world-happiness 2016.csv", sep = ",", header=TRUE)
str(happiness)
dim(happiness)
summary(happiness)

# look at the column names
colnames(happiness)

# rename the variables with shorter names
colnames(happiness)[1] <- "country"
colnames(happiness)[2] <- "region"
colnames(happiness)[3] <- "happ.rank"
colnames(happiness)[4] <- "happ.score"
colnames(happiness)[5] <- "lower.confint"
colnames(happiness)[6] <- "upper.confint"
colnames(happiness)[7] <- "gdpcapita"
colnames(happiness)[8] <- "socialsupport"
colnames(happiness)[9] <- "hlifeexp"
colnames(happiness)[10] <- "freedom"
colnames(happiness)[11] <- "corruption" 
colnames(happiness)[12] <- "generosity" 
colnames(happiness)[13] <- "dystopia" 

library(dplyr)

# select columns to keep 
keep <- c("country", "happ.score", "gdpcapita", "socialsupport", "hlifeexp", "freedom", "corruption", "generosity")
# select the 'keep' columns
happiness2 <- dplyr::select(happiness, one_of(keep))

# look at the rownames
rownames(happiness2)
# define the row names of the data by the country names 
rownames(happiness2) <- happiness2$country
# look at the rownames
rownames(happiness2)

# remove the country name column 
happiness2 <- dplyr::select(happiness2, -country)

# look at the structure of the data
str(happiness2)

# and summary
summary(happiness2)

# save data to data folder
write.csv(happiness2, file = "happiness2.csv", row.names=TRUE)

# read data 
read.table("happiness2.csv", sep = ",", header=TRUE)

