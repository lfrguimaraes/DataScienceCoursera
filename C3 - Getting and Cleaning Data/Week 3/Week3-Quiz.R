
microdata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(microdata,destfile="./data/microdata.csv",method="curl")
microdata <- read.csv("./data/microdata.csv")
agricultureLogical <- (microdata$ACR == 3 & microdata$AGS == 6)
head(which(agricultureLogical))


install.packages('jpeg')
library(jpeg)
fileJPEG <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileJPEG,destfile="./data/fileJPEG.csv",method="curl")
dataJPEG <- readJPEG("./data/fileJPEG.csv",native = TRUE)
quantile(dataJPEG, c(0.3,0.8))

gdp <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edu <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdp,destfile="./data/gdp.csv",method="curl")
download.file(edu,destfile="./data/edu.csv",method="curl")
gdp <- read.csv("./data/gdp.csv", skip=4, dec=",")
gdp <- head(gdp,190)
edu <- read.csv("./data/edu.csv")
mergedData <- merge(gdp, edu,by.x="X", by.y="CountryCode",all=FALSE)

nrow(mergedData)

mergedData[,5] <- as.numeric(gsub(",", "", mergedData[,5]))
mergedData <- mergedData[order(rank(mergedData$"X.4")),]
mergedData[13,4]



mergedData[,2] <- as.numeric(mergedData[,2])
tapply(mergedData$'X.1',mergedData$Income.Group,mean)


mergedData$groups <- cut(mergedData$'X.1',breaks = quantile(mergedData$'X.1',c(0,0.2,0.4,0.6,0.8,1)))
table(mergedData$groups,mergedData$Income.Group)


