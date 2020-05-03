# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' 
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
# 'pollutantmean' reads that monitors' particulate matter data from the directory specified 
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
# ignoring any missing values coded as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id=1:332){
  
  # Gets the complete path to files directory
  directory <- paste(getwd(), directory, sep="/")
  
  # Creates an empty data frame
  totalData <- NA
  
  for (fileId in id){
    
    # Gets the complete file path for current Id 
    fileURL <- paste(directory, "/", formatC(fileId, width=3, flag="0"), ".csv", sep="")
    
    # Gets file data
    fileData <- read.csv(fileURL)
    
    # Adds file data to complete data frame
    totalData <- rbind(totalData,fileData)
    
  }
  
  # Calculates mean for data frame column "pollutant", removing NAs
  mean(totalData[[pollutant]], na.rm=TRUE)
}
