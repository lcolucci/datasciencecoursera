# Getting and Cleaning Data: Course Project
# 
# Created by L.Colucci 2015-09-26

# ------------------------- Part 0 -----------------------------------
# GOAL Load necessary packages, and load files into the R workspace. 

# Set working directory + load packages
#setwd("~/Documents/Coursera/gettingcleaningdata")
library(dplyr)

# Download data and zip into working directory
#dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(dataset_url, "project_data.zip")
#unzip("project_data.zip", exdir="project_data") 
#I then manually moved the subfolder out into main folder (i.e. no longer using project_data folder)
#DATA IS ALREADY loaded into my folder. Don't need to download and unzip any more. 

#Load files into workspace 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features_info <- read.table("./UCI HAR Dataset/features_info.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
#training set
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#test set
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


# ------------------------- Part 1 -----------------------------------
# GOAL Merge the training and the test sets to create one data set.

#Combine training data (x_train), activity (y_train), subject  (subject_train). Give proper column labels. 
colnames(x_train) <- features$V2    #Give training data column names
train <- data.frame(subject_train, y_train, x_train)   #combine subjects, activity type, + rest of data
train <- rename(train, subject = V1, activity = V1.1)

#Combine test data (x_test), activity (y_test), subject  (subject_test). Give proper column labels (b/c 'rbind' requires them to be labeled the same way)
colnames(x_test) <- features$V2   #Give training data column names
test <- data.frame(subject_test, y_test, x_test)   #combine subjects, activity type, + rest of data
test <- rename(test, subject = V1, activity = V1.1)

#Merge the two datasets. Append 'test' data onto the bottom of 'train' data. Creat 'full' dataset. 
full <- rbind(train, test)

# MY ANSWER
part1result <- full 

# ------------------------- Part 2 -----------------------------------
# GOAL Extract only the measurements on the mean and standard deviation for each measurement. 
full_mean = select(full, contains("mean", ignore.case=TRUE))
full_std = select(full, contains("std", ignore.case=TRUE))
full_mean_std = cbind(full_mean, full_std) #data for only mean and stdev. But we've lost activity + subject info.
full_mean_std_subj_activity = data.frame(subject=full[,1], activity=full[,2],full_mean_std) #Add back subjects + activity info

# MY ANSWER
part2result <- full_mean_std_subj_activity

# ------------------------- Part 3 -----------------------------------
# GOAL Uses descriptive activity names to name the activities in the data set
activity_indexcodes <- part2result$activity
activity_name <- activity_labels$V2
part3result <- part2result #initialize part3 result 

# MY ANSWER
part3result$activity <- activity_name[activity_indexcodes]


# ------------------------- Part 4 -----------------------------------
# GOAL Appropriately labels the data set with descriptive variable names

# MY ANSWER
part4result <- part3result #Descriptive column names has already been taken care of earlier in the code. 
                           #No need to do anything more here. 


# ------------------------- Part 5 -----------------------------------
# GOAL From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

tidydata_groupby <- group_by(part4result, activity, subject) #group the data by activity and subject

# MY ANSWER
finaltidydata <- summarise_each(tidydata, funs(mean(.,na.rm=TRUE))) #take mean of each group and write results to new dataset

# Print results
write.table(finaltidydata, "finaltidydata.txt", row.names = FALSE)

