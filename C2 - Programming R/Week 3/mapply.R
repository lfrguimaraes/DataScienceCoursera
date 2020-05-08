#mapply

x <- list(rep(1,4), rep(2,3), rep (3,2), rep(4,1))
x<- mapply(rep, 1:4, 4:1)

FUN 


noise<-function(n,mean, sd){
  rnorm(n,mean,sd)
}

noise(5,1,2)

noise(1:5,1:5,2)

mapply(noise, 1:5, 1:5, 2)

noise(1,1,2)
noise(2,2,2)
...

