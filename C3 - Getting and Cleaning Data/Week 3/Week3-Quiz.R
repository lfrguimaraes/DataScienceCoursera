
microdata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(microdata,destfile="./data/microdata.csv",method="curl")
microdata <- read.csv("./data/microdata.csv")
