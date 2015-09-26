
#Getting and Cleaning Data: Final Project
####Lina A. Colucci, 26 Sept 2015

####Greetings! And welcome to my submission for the final class project on "Getting and Cleaning Data"! 

##Getting Oriented
In this github repo you'll find 3 files:
1. The README file that you are reading at the moment
2. The Codebook which contains information about what each variable in the tidy data is (note: my tidy data is uploaded on Coursera)
3. An R script called "run_analysis.R”

##Running the R Script
If you'd like to test out my R script, please do the following: 
1. Download and open my R script and set your working directory path on line 17 (just above "library(dplyr)".
2. Place the unzipped Samsung data into your working directory. The folder must be called "UCI HAR Dataset". DO NOT change anything about what the folders are called or the sub-folder structure. The data can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Here's How the Script Works
Part 0. Loads the data files into the R workspace
Part 1. First, all the training set files are combined into a data frame called "train”. Train's first column contains the subject IDs (from "subject_train.txt"). The second column contains the activity type (from "y_train.txt"). The rest of the columns are outputs from the gyroscope and accelerometer (from "x_train.txt"). The "train" columns are labeled with the names contained in "features.txt". The "subject" and "activity" column were manually labeled with those column names. All column names are explained further in the codebook. 
       Dimensions of Train: dim(train) = 7352 x 563

        Second, the same thing explained above for the training set was done for the test set. This was saved into a data frame called "test"
      Dimensions of Test: dim(test) = 2947 x 563

    Finally, the "train" and "test" sets were merged together. I appended the "test" results to the bottom of "train" results using rbind(). This result is saved in a data frame called "part1result"
       Dimensions of Part1Result: dim(part1result) = 10299 x 563

Part 2. I selected all the "mean" and "standard deviation" columns from the "part1result" data frame. I did this by using dplyr's "select" function to choose only columns that contained the word "mean” or the word "std” (ignoring the case of the word). 
    To be specific, I first selected out the just the columns with "mean” ("select(full, contains("mean", ignore.case=TRUE))") then I selected out just the columns with "std”. Then I put those two intermediate data frames together and added back the "subject" and "activity" columns. 
    I saved this result in a data frame called "part2result".  


Part 3. I used the lookup book provided to us in "activity_labels.txt" to rename the activity column in the "part2result" data frame with string descriptions instead of just numbers. For example, I renamed all the "1”'s with "WALKING”. I saved these results in a data frame called "part3result". 

Part 4. I had already ensured all of my columns were properly named in Part 1 and so there was nothing I needed to do in this section. 

Part 5. We were asked to calculate some statistics for each activity and each subject. I used the group_by() functionality to group the "part3result" data by both activity and subject. Once I had these groupings, I calculated the mean of each group using the summarise_each() function. I ignored the NA values when calculating the mean. I saved the results of this analysis into a data frame called "finaltidydata". 
     Dimensions of Final Tidy Data: dim(finaltidydata) = 180 x 88 

As a sanity check, I know I have the right number of rows in "finaltidydata" because we should have a row for every activity and subject grouping. There are 6 activities and 30 subjects. 6*30=180 rows. 


That's all I've got. 

Thanks for reading!
Lina

PS - If you'd like to read up on how the original data was collected and/or what the raw data files mean, I've included the description by the authors of that original data here: 

==================================================================

Human Activity Recognition Using Smartphones Dataset

Version 1.0

==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit‡ degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

==================================================================



The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See "features_info.txt" for more details. 



For each record it is provided:

======================================



- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.



The dataset includes the following files:

=========================================



- "README.txt"



- "features_info.txt": Shows information about the variables used on the feature vector.



- "features.txt": List of all features.



- "activity_labels.txt": Links the class labels with their activity name.



- "train/X_train.txt": Training set.



- "train/y_train.txt": Training labels.



- "test/X_test.txt": Test set.



- "test/y_test.txt": Test labels.



The following files are available for the train and test data. Their descriptions are equivalent. 



- "train/subject_train.txt": Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 



- "train/Inertial Signals/total_acc_x_train.txt": The acceleration signal from the smartphone accelerometer X axis in standard gravity units "g". Every row shows a 128 element vector. The same description applies for the "total_acc_x_train.txt" and "total_acc_z_train.txt" files for the Y and Z axis. 



- "train/Inertial Signals/body_acc_x_train.txt": The body acceleration signal obtained by subtracting the gravity from the total acceleration. 



- "train/Inertial Signals/body_gyro_x_train.txt": The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



Notes: 

======

- Features are normalized and bounded within [-1,1].

- Each feature vector is a row on the text file.



For more information about this dataset contact: activityrecognition@smartlab.ws



License:

========

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.



Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

