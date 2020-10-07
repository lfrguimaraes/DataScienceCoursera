if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")

top3 <- head(restData,n=3)
end3 <- tail(restData,n=3)

