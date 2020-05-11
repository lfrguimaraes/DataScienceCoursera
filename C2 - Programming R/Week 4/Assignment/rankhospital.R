# outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses="character")
# outcome[,11] <- as.numeric(outcome[,11])
# hist(outcome[,11])

library(rstudioapi)
colHeartAttack <- 11
colHeartFailure <- 17
colPneumonia <- 23
colHospitalName <- 2

rankhospital <- function(state, outcome, num = "best"){
  #directory <- dirname(getActiveDocumentContext()$path)
  fileURL <- paste("", "data/outcome-of-care-measures.csv", sep="")
  outcomeData <- read.csv(fileURL, colClasses = "character")
  
  #Check existing Outcome
  colRefId<-0
  if(outcome == "heart attack"){
    colRefId <- colHeartAttack
  }else if(outcome == "heart failure"){
    colRefId <- colHeartFailure
  }else if(outcome == "pneumonia"){
    colRefId <- colPneumonia
  }else{
    stop("invalid outcome")
  }
  
  # Check existing State
  if(nrow(outcomeData[outcomeData$State == state,])==0) stop("invalid state")
  
  # Filter output data by state
  outcomeState <- outcomeData[outcomeData$State == state,]
  
  # Converts outcome column data to numeric
  outcomeState[,colRefId] <- as.numeric(outcomeState[,colRefId])
  
  # Orders output data by outcome column data
  outcomeState <- outcomeState[order(outcomeState[,colRefId], outcomeState[,colHospitalName]),]
  
  outcomeState <- outcomeState[complete.cases(outcomeState[, colRefId]),]
  
  # Returns hospital name for reauested index
  
  if(num == "best"){
    hospital <- outcomeState[1,colHospitalName]
  }else if(num == "worst"){
    hospital <- outcomeState[nrow(outcomeState),colHospitalName]
  }else if(num <= nrow(outcomeState)){
    hospital <- outcomeState[num,colHospitalName]
  }else{
    hospital <- NA
  }

  hospital
  
}