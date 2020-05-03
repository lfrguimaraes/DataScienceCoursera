# Write a function that reads a directory full of files and reports the number of 
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is the 
# number of complete cases. A prototype of this function follows


complete <- function (directory, id= 1:332){
  
  # Gets the complete path to files directory
  directory <- paste(getwd(), directory, sep="/")
  
  # Creates a matrix with first columns as elements of 'id'
  matrixData <- NULL
  
  
  for (fileId in id){
    
    # Gets the complete file path for current Id 
    fileURL <- paste(directory, "/", formatC(fileId, width=3, flag="0"), ".csv", sep="")
    
    # Gets file data
    fileData <- read.csv(fileURL)
    
    # Count Non-NA rows
    nonNACount <- nrow(na.omit(fileData))
    
    #Add row to matrix
    matrixData <-rbind(matrixData, c(fileId,nonNACount))
    
  }
  
  colnames(matrixData) <- c("id", "nobs")
  matrixData
}