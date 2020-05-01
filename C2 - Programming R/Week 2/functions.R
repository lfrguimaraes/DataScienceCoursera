## add two numbers passed as parameter

add2 <- function(x, y){
  x+y
}


## return the numbers above 10 in a vector
above10 <- function(x){
  
  use <- x > 10
  x[use]
  
}

## return the numbers above n; se usuario nao informar, usa n=10 como default
above <- function(x, n=10){
  
  use1 <- x > n
  x[use1]
  
}

## standard parameter value

columnMean <- function(y, removeNA = TRUE){
  
  nc <- ncol(y)
  means <- numeric(nc)
  
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  
  means
  
}


## lexical scoping


make.power <- function(p){
  
  pow <-function(i){
    i^p
    
  }
  pow
  
  
}


