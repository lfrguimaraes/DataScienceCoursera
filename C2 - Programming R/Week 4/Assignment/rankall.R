# outcome <- read.csv("data/outcome-of-care-measures.csv", colClasses="character")
# outcome[,11] <- as.numeric(outcome[,11])
# hist(outcome[,11])

library(rstudioapi)
colHeartAttack <- 11
colHeartFailure <- 17
colPneumonia <- 23
colHospitalName <- 2
colState <- 7

rankall <- function(outcome, num = "best"){

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

  outcomeData[,colRefId] <- as.numeric(outcomeData[,colRefId])
  outcomeData <- outcomeData[complete.cases(outcomeData[, colRefId]),]
  outcomeData <- outcomeData[,c(colState,colHospitalName,colRefId)]
  outcomeData <- outcomeData[order(outcomeData[,1], outcomeData[,3], outcomeData[,2]), ]
  
  outcomeDataSplit <- split(outcomeData, outcomeData$State)
  
  rankedHospitals <- numeric()
  lapply(outcomeDataSplit, function(x){
    
    xTemp <- x[,c(2,1)]
    
    if(num == "best"){
      rankedHospitals <<- rbind(rankedHospitals, c(xTemp[1,1], xTemp[1,2]))
    }else if(num == "worst"){
      rankedHospitals <<- rbind(rankedHospitals, c(xTemp[nrow(xTemp),1], xTemp[1,2]))
    }else if(num <= nrow(xTemp)){
      rankedHospitals <<- rbind(rankedHospitals, c(xTemp[num,1], xTemp[1,2]))
    }else{
      rankedHospitals <<- rbind(rankedHospitals, c(NA, xTemp[1,2]))
    }

  })
  
  rankedHospitals
}






