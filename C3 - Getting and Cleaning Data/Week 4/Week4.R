d2 <- Sys.Date()
d2
format(d2, "%a %b %d")
format(d2, "%A %b %d")
x <- c("1jan1960", "2jan1980", "3jul1980")
z <- as.Date(x, "%d%b%Y")
z

