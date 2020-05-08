#split

x<-1:10
f<-c(1,1,2,3,4,5,5,5,a,a)
split(x,f)

$`1`
[1] 1 2
$`2`
[1] 3
$`3`
[1] 4
$`4`
[1] 5
$`5`
[1] 6 7 8
$a
[1]  9 10


ozoneData <- read.csv("/Users/Reis/Desktop/datasciencecoursera/C2 - Programming R/hw1_data.csv")
library(datasets)
head(ozoneData)


s<- split(ozoneData, ozoneData$Month)

lapply(s, function(x) colMeans(x[, c("Ozone","Wind", "Month")], na.rm=TRUE))
sapply(s, function(x) colMeans(x[, c("Ozone","Wind", "Month")], na.rm=TRUE))

sapply(split(mtcars$mpg, mtcars$cyl), mean)
sapply(splitIris, function(x) colMeans(x[, c("Sepal.Length", "Sepal.Width")], na.rm=TRUE))

ou 

round(mean(iris[which(iris$Species == "virginica"),]$Sepal.Length))
