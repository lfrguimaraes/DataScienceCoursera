# Write a function that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and 
# nitrate for monitor locations where the number of completely observed 
# cases (on all variables) is greater than the threshold. The function 
# should return a vector of correlations for the monitors that meet the 
# threshold requirement. If no monitors meet the threshold requirement, 
# then the function should return a numeric vector of length 0. 

corr <- function (directory, threshold= 0){
  
  # Gets the complete path to files directory
  directory <- paste(getwd(), directory, sep="/")
  
  # Gets the list of files in directory
  files <- list.files(directory)
  
  # Creates a numeric vector with lenght 0
  correlationVector <- numeric(0)
  
  for (fileName in files){
    
    # Gets the complete file path for current file 
    fileURL <- paste(directory, "/", fileName, sep="")
    
    # Gets file data
    fileData <- read.csv(fileURL)
    
    # Remove NAs
    fileData <-na.omit(fileData)
    
    # Add correlations to vector
    if(nrow(fileData)>threshold){
      correlationVector <- c(correlationVector,cor(fileData[,2],fileData[,3])) 
    }
    
  }
  
  correlationVector
}