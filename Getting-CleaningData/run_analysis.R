## Set Working Directory

## Download data
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Unzip data
## Rename data directory from "UCI HAR Dataset" to "Dataset"

## 01 Merges the training and the test sets to create one data set.
TrainData <- read.table("Dataset/train/X_train.txt")
TrainLabel <- read.table("Dataset/train/y_train.txt")
TrainSubject <- read.table("Dataset/train/subject_train.txt")

TestData <- read.table("Dataset/test/X_test.txt")
TestLabel <- read.table("Dataset/test/y_test.txt") 
TestSubject <- read.table("Dataset/test/subject_test.txt")

Data <- rbind(TrainData, TestData)
Label <- rbind(TrainLabel, TestLabel)
Subject <- rbind(TrainSubject, TestSubject)

## 02 Extracts only the measurements on the mean and standard deviation for each measurement
Features <- read.table("Dataset/features.txt")
MeanStd <- grep("mean\\(\\)|std\\(\\)", Features[, 2])
Data <- Data[, MeanStd]
names(Data) <- gsub("\\(\\)", "", Features[MeanStd, 2])
names(Data) <- gsub("mean", "Mean", names(Data))
names(Data) <- gsub("std", "Std", names(Data))
names(Data) <- gsub("-", "", names(Data)) 

## 03 Uses descriptive activity names to name the activities in the data set
Activity <- read.table("Dataset/activity_labels.txt")
Activity[, 2] <- tolower(gsub("_", "", Activity[, 2]))
substr(Activity[2, 2], 8, 8) <- toupper(substr(Activity[2, 2], 8, 8))
substr(Activity[3, 2], 8, 8) <- toupper(substr(Activity[3, 2], 8, 8))
ActivityLabel <- Activity[Label[, 1], 2]
Label[, 1] <- ActivityLabel
names(Label) <- "activity"

## 04 Appropriately labels the data set with descriptive variable names.
names(Subject) <- "subject"
DataClean <- cbind(Subject, Label, Data)
write.table(DataClean, "data_clean.txt") 

## 05 From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.
SubjectLen <- length(table(Subject)) # 30
ActivityLen <- dim(Activity)[1] # 6
ColumnLen <- dim(DataClean)[2]
x <- matrix(NA, nrow=SubjectLen*ActivityLen, ncol=ColumnLen) 
x <- as.data.frame(x)
colnames(x) <- colnames(DataClean)
row <- 1
for(i in 1:SubjectLen) {
        for(j in 1:ActivityLen) {
                x[row, 1] <- sort(unique(Subject)[, 1])[i]
                x[row, 2] <- Activity[j, 2]
                bool1 <- i == DataClean$Subject
                bool2 <- Activity[j, 2] == DataClean$Activity
                x[row, 3:ColumnLen] <- colMeans(DataClean[bool1&bool2, 3:ColumnLen])
                row <- row + 1
        }
}
write.table(x, "data_finish.txt") 
write.table(x, "Proyect.txt", row.name=FALSE) 

