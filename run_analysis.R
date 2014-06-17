
run_analysis <- function(){
    
    ## Information : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
    ## 1. Merges the training and the test sets to create one data set.
    
    # Generate the factors
    activity <- factor(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
    
    # Load the features
    features <- read.table("UCI HAR Dataset/features.txt",header=FALSE,colClasses = c("numeric","character"))
    colnames(features) <- c("FeatureId","FeatureName")
    print("Read features.txt .")
    
    # -------- Get TRAIN data ---------------
    
    X_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
    colnames(X_train) <- features$FeatureName
    print("Read X_train.txt .")
    
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)  # the list of activities
    colnames(y_train) <- c("Activity")
    print("Read y_train.txt .")
    
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)  # the list of subjects
    colnames(subject_train) <- c("Subject")
    print("Read subject_train.txt .")
    
    trainData <- cbind(subject_train,y_train,X_train)
    
    
    # -------- Get TEST data---------------    
    
    X_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
    colnames(X_test) <- features$FeatureName
    print("Read X_test.txt .")
    
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)  # the list of activities
    colnames(y_test) <- c("Activity")
    print("Read y_test.txt .")
    
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)  # the list of subjects
    colnames(subject_test) <- c("Subject")
    print("Read subject_test.txt .")
    
    testData <- cbind(subject_test,y_test,X_test)
    
    # -------- Combine TRAIN and TEST data  ---------------  
    
    combinedData <- rbind(trainData,testData)
    print("Combined test and training data .")
    
    ## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    meanStdColIdx <- grep("std|mean",names(combinedData))
    filteredData <- combinedData[,c(1,2,meanStdColIdx)]
    
    ## 3. Uses descriptive activity names to name the activities in the data set
    filteredData$Activity <- factor(filteredData$Activity,levels = c(1:6),labels = levels(activity))
    
    print("Created filtered data with means and std.")
    
    ## 4. Appropriately labels the data set with descriptive variable names. 
        # The variables have already been properly defined
    
    ## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    
    summaryData <- aggregate(filteredData[,3:81], by=list(filteredData$Subject, filteredData$Activity),FUN=mean, na.rm=TRUE)
    
    func <- function(x){paste("Avg-",x,sep="")}
    newAvgColNames <- lapply(names(filteredData[,3:81]),FUN = func)
    colnames(summaryData) <- c("Subject","Activity",newAvgColNames)

    print("Created summary data .")
    
    write.csv(filteredData, file = "completeData.csv", row.names=FALSE)
    print("Generated completeData.csv with the means and std values .")
    
    write.csv(summaryData, file = "summaryData.csv", row.names=FALSE)
    print("Generated summaryData.csv with averages of completeData grouped by Subject,Activity.")
    
    print("END.")
    
}