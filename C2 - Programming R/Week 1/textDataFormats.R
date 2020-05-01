#Text data formats

#Using dput
y <- data.frame(a=3:4, b=c("z","k"))
dput(y, file="objectY.R")
objectCreated <- dget("objectY.R")

#Using dump
a1 <- "foo"
a2 <- data.frame(col1=1, col2= "a")

dump(c("a1", "a2"), file="objectA1A2.R")
source("objectA1A2.R")



temp <- url("https://www.data.gouv.fr/fr/datasets/r/63352e38-d353-4b54-bfd1-f1b3ee1cabd7", "r")
dataCovid <- read.csv(temp)

week1 <- read.csv("hw1_data.csv")
Ozone <- week1[!is.na(week1[, "Ozone"]),]
meanTemp <- mean(Ozone[,"Temp"])