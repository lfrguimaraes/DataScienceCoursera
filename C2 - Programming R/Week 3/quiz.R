#quiz

sapply(split(mtcars$mpg, mtcars$cyl), mean)
sapply(splitIris, function(x) colMeans(x[, c("Sepal.Length", "Sepal.Width")], na.rm=TRUE))

ou 

round(mean(iris[which(iris$Species == "virginica"),]$Sepal.Length))
avg<-sapply(split(mtcars$hp, mtcars$cyl), mean)
round(abs(avg[3]-avg[1]),0)

