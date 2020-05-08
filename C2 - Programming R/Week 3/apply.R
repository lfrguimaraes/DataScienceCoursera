#apply

#str(apply)
#function(X, MARGIN, FUN, ...)

x<-matrix(rnorm(200), 20, 10)

rowsums = apply(x, 1, sum)
colsums = apply(x, 2, sum)