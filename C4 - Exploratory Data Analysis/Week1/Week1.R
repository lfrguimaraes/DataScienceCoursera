avgpm25 <- "https://raw.githubusercontent.com/jtleek/modules/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv"
download.file(avgpm25,destfile="./data/avgpm25.csv")

pollution <- read.csv("./data/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)
summary(pollution$pm25)


#Histogram
hist(pollution$pm25, col = "green", breaks=200)
#adds a vertical line at national limit of 12
abline(v = 12, lwd = 2)
#adds a vertical line at median
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

#Boxplot
boxplot(pollution$pm25, col = "blue") 
abline(h = 12)

#Boxplot by region
boxplot(pm25 ~ region, data = pollution, col = "red")

#Barplot
barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")


#Multiple histograms
par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green") 
hist(subset(pollution, region == "west")$pm25, col = "green")

#Scatterplots
with(pollution, plot(latitude, pm25)) 
abline(h=12,lwd=2,lty=2)

#Scatterplots with color
with(pollution, plot(latitude, pm25, col = region)) 
abline(h=12,lwd=2,lty=2)

#Multiple scatterplots
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West")) 
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))