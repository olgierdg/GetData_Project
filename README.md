# GetData_Project
Project for Getting and Cleaning Data course on Coursera

## Repository contents

This repository contains the ```run_analysis.R``` script that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
This repository also contains the ```CodeBook.md``` file which explains the column names used in the output file (i.e. the tidy data set).

## Working with the script

1. The script requires the UCI HAR dataset in order to work, it will download and extract it automatically if it does not detect it in the working directory.
2. If the dataset is detected (the ```UCI HAR Dataset``` folder is present in the working directory) the script will not download the data.
3. When the script is done runing it will output the ```tidydataset.txt``` file to the working directory.
