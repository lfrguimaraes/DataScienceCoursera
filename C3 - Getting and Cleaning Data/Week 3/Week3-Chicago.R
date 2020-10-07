if(!file.exists("./data")){
  dir.create("./data")
}
fileURL <- "https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/dplyr/chicago.rds?raw=true"
download.file(fileURL, destfile = "./data/chicago.rds", method = "curl", extra='-L')
chicago <- readRDS("./data/chicago.rds")