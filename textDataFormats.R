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