run_analysis <- function()
{
  ## Assume the working directory is pre-set
  
  ## Read all data in
  ## Read test data 2947 X 561, 2947 X 1, 2947 X 1
  testData <- read.table("./test/X_test.txt")
  testLabel <- read.table("./test/y_test.txt")
  testSubject <- read.table("./test/subject_test.txt")
  
  ## Read train data 7352 X 561, 7352 X 1, 7352 X 1
  trainData <- read.table("./train/X_train.txt")
  trainLabel <- read.table("./train/y_train.txt")
  trainSubject <- read.table("./train/subject_train.txt")
  
  ## Read label nanmes and activity names 561 X 2, 6 X 2
  features <- read.table("./features.txt")
  activityNames <- read.table("./activity_labels.txt")
  
  ## 1. Merges the training and the test sets to create one data set 10299 X 561
  data <- rbind(trainData, testData)
  
  ## Merge the activity data (Labels) and rename the column 10299 X 1
  activityData <- rbind(trainLabel, testLabel)
  colnames(activityData) <- c("Activity")
  
  ## Merge the subject data and rename the column 10299 X 1
  subjectData <- rbind(trainSubject, testSubject)
  colnames(subjectData) <- c("Subject")
  
  ## 3. Uses descriptive activity names to name the activities in the data set
  for (i in 1:nrow(activityNames))
  {
    activityData[activityData$Activity == activityNames$V1[i], ] <- as.character(activityNames$V2[i])
  }
  
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement
  ## 4. Appropriately labels the data set with descriptive variable names
  ## Remove the meanFreq
  removeMeanFreq <- sub("meanFreq", "Freq", features$V2)
  ## Get the index of columns which name is *mean*
  indexofmean <- grep("mean", removeMeanFreq, fixed=TRUE)
  ## Get the actual column names which name is *mean*
  colnameofmean <- grep("mean", removeMeanFreq, fixed=TRUE, value=TRUE)
  
  ## Perform the same operation for STD
  indexofSTD <- grep("std", features$V2, fixed=TRUE)
  colnameofSTD <- grep("std", features$V2, fixed=TRUE, value=TRUE)
  
  ## Select data only having mean and STD
  meanData <- data[indexofmean]
  STDData <- data[indexofSTD]
  ## Assign column names to the data sets
  names(meanData) <- colnameofmean
  names(STDData) <- colnameofSTD
  
  ## Merge the mean data and STD data together
  meanSTDData <- cbind(meanData, STDData)
  
  ## Merge with Subject and Activity data
  finalData <- cbind(meanSTDData, subjectData)
  finalData <- cbind(finalData, activityData)
  
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  ## finalData: 10299 X 68
  for(i in 1:nrow(activityNames))
  {
    for(j in 1:30)
      {
        tempData <- finalData[finalData$Activity == activityNames$V2[i] & finalData$Subject == as.character(j), ] 
        if (i ==1 & j ==1)
        {
          results <- sapply(tempData[, 1:66], mean)
        }
        else
        {
          results <- rbind(results, sapply(tempData[, 1:66], mean))
        }
      }
  }
  
  ## Save the results
  write.table(results, "./results.txt", row.names=FALSE)
}