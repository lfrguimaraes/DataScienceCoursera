if(!file.exists("./data")) dir.create("./data")
comm <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(comm,destfile="./data/comm.csv",method="curl")
comm <- read.csv("./data/comm.csv")
print(head(comm, 10))

names <- names(comm)
names <- strsplit(names, "\\wgtp")
result <- names[[123]]
print(result)


gdp <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdp,destfile="./data/gdp.csv",method="curl")
gdp <- read.csv("./data/gdp.csv", skip=4)
value <- gsub(",", "", gdp$X.4)
value <- head(value,190)
value <- as.numeric(value)
avg <- mean(value, na.rm = TRUE)
print(avg)

countryNames <- gdp$X.3
grep("^United",countryNames)


gdp <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edu <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdp,destfile="./data/gdp.csv",method="curl")
download.file(edu,destfile="./data/edu.csv",method="curl")
gdp <- read.csv("./data/gdp.csv", skip=4, dec=",")
gdp <- head(gdp,190)
edu <- read.csv("./data/edu.csv")
mergedData <- merge(gdp, edu,by.x="X", by.y="CountryCode",all=FALSE)
mergedData <- mergedData$Special.Notes
mergedData <- grep("Fiscal year end: June", mergedData)
length(mergedData)


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sample2012 <- grep("2012", format(sampleTimes, "%Y"))
length(sample2012)

