# Load libraries
library(dplyr)

# Load and unzip file

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")) dir.create("./data")
if(!file.exists("./data/Week4-Project-Data.zip")) download.file(url, destfile="./data/Week4-Project-Data.zip", method="curl")
if(!file.exists("./data/UCI HAR Dataset")) unzip(zipfile = "./data/Week4-Project-Data.zip", exdir = "./data")

# Extract data frames

feature <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("id_feature","obs"))
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("id_activity", "activity"))

testX <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = feature$obs)
testY<- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "id")

trainX <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = feature$obs)
trainY <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "id")

testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "id_subject")
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "id_subject")


# Merge test and train data frames

dataX <- rbind(testX, trainX)
dataY <- rbind(testY, trainY)
dataSubject <- rbind(testSubject, trainSubject)


# Assignment 1: Merges test and train sets to subject identification to create one tidy data set
dataMerged <- cbind(dataX, dataY, dataSubject)

# Assignment 2: Extracts only the measurements on the mean and standard deviation for each measurement
dataMeanStd <- select(dataMerged, id_subject, id, contains("mean"), contains("std"))

# Assingment 3: Uses descriptive activity names to name the activities in the data set
dataMeanStd$id <- activity[dataMeanStd$id, 2]

# Assingment 4: Appropriately labels the data set with descriptive variable names

# Acc to Accelerometer
names(dataMeanStd)<-gsub("Acc", "Accelerometer", names(dataMeanStd))

# Gyro to Gyroscope
names(dataMeanStd)<-gsub("Gyro", "Gyroscope", names(dataMeanStd))

# Mag to Magnitude
names(dataMeanStd)<-gsub("Mag", "Magnitude", names(dataMeanStd))

# t to Time
names(dataMeanStd)<-gsub("^t", "Time", names(dataMeanStd))

# f to Frequency
names(dataMeanStd)<-gsub("^f", "Frequency", names(dataMeanStd))

# -mean to Mean
names(dataMeanStd)<-gsub("-mean()-", "Mean", names(dataMeanStd))

# -std to Std
names(dataMeanStd)<-gsub("-std()-", "Std", names(dataMeanStd))

# id to Activity
names(dataMeanStd)<-gsub("^id$", "Activity", names(dataMeanStd))

# id_subject to Subject
names(dataMeanStd)<-gsub("^id_subject$", "Subject", names(dataMeanStd))






