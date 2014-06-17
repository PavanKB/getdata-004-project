### Introduction

This repo has been created for the Coursera course - Getting and Cleaning Data.
The contents are :

1. run_analysis.R
2. summaryData.csv
3. completeData.csv
4. CodeBook for completeData.csv
5. README.md

The R file **run_analysis.R** contains the function run_analysis() that will analyse the
data from Samsung Galaxy S2 during activities. This data was sourced from :
```
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
```
The function will process the training and testing data and combine them generating a data set(**completeData.csv**) containng the means and std of various measurements. 

Another data set (**summaryData.csv**) is also created that contains the averages, grouped by Subject and Activity. 

The data from folder *test/Inertial Signals* and *train/Inertial Signals* is not processed.

###How to Run :
1. Download the zip file form  [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the contents into the working directory of you current R session. The folder structutre will be as shown:
```
<Working Directory>
	|-UCI HAR Dataset
        |-test
            +-Inertial Signals
            .-subject_test.txt
            .-X_test.txt
            .-y_test.txt
        |-train
            +-Inertial Signals
            .-subject_train.txt
            .-X_train.txt
            .-y_train.txt
        .-activity_labels.txt
        .-features.txt
        .-features_info.txt
        .-README.txt
```
3. Copy the run_analysis.R file from repo to the working directory.
4. Execute the following code:
```{r}
> source('<Working Directory>/run_analysis.R')
> run_analysis()
```
5. The function will print the progress statements.
```
[1] "Read features.txt ."
[1] "Read X_train.txt ."
[1] "Read y_train.txt ."
[1] "Read subject_train.txt ."
[1] "Read X_test.txt ."
[1] "Read y_test.txt ."
[1] "Read subject_test.txt ."
[1] "Combined test and training data ."
[1] "Created filtered data with means and std."
[1] "Created summary data ."
[1] "Generated completeData.csv with the means and std values ."
[1] "Generated summaryData.csv with averages of completeData grouped by Subject,Activity."
[1] "END."
```
6. Once completed, two new CSV file should be available in the working directory.


###Output:
The function will generate two CSV files.

completeData.csv

summaryData.csv
