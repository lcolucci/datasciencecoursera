Code Book 
================


### Final Tidy Data
In "finaltidydata", there are  86 (NOT including 'subject' and 'activity') of the original 561 variables given in the raw data. The 88 variables are the mean or standard deviation columns (let's call this data frame "subset-df"). 
"Subset-df" was grouped by activity and subject. For every combination of activity (m=6) and subject (n=30), we calculated the average of those 88 variables. Our tidy data therefore contains 180 observations/rows and 88 variables/columns. 

The 88 variables are as follows: 

###Notation and Units 
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. There are actually 3 variables for each row listed. 
* prefix 't' to denote time domain signals
* 'f' to indicate frequency domain signals (FFT was applied to them) 

subject - There are 30 subjects in this study
activity - Each subject performed 6 different activities
                          
tBodyAcc.mean...XYZ                                  
tGravityAcc.mean...XYZ                               
tBodyAccJerk.mean...XYZ               
tBodyGyro.mean...XYZ                            
tBodyGyroJerk.mean...XYZ           
tBodyAccMag.mean..                
tGravityAccMag.mean..         
tBodyAccJerkMag.mean..            
tBodyGyroMag.mean..         
tBodyGyroJerkMag.mean.."             
fBodyAcc.mean...XYZ                      
fBodyAcc.meanFreq...XYZ                           
fBodyAccJerk.mean...XYZ                  
fBodyAccJerk.meanFreq...XYZ          
fBodyGyro.mean...XYZ            
fBodyGyro.meanFreq...XYZ           
fBodyAccMag.mean..               
fBodyAccMag.meanFreq..              
fBodyBodyAccJerkMag.mean..         
fBodyBodyAccJerkMag.meanFreq..      
fBodyBodyGyroMag.mean..         
fBodyBodyGyroMag.meanFreq..        
fBodyBodyGyroJerkMag.mean..  
fBodyBodyGyroJerkMag.meanFreq..     
angle.tBodyAccMean.gravity.       
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.              
angle.Y.gravityMean.                
angle.Z.gravityMean.
              
tBodyAcc.std...XYZ                   
tGravityAcc.std...XYZ  
tBodyAccJerk.std...XYZ               
tBodyGyro.std...XYZ               
tBodyGyroJerk.std...XYZ               
tBodyAccMag.std..               
tGravityAccMag.std..                
tBodyAccJerkMag.std..           
tBodyGyroMag.std..                 
tBodyGyroJerkMag.std..          
fBodyAcc.std...XYZ                 
fBodyAccJerk.std...XYZ
fBodyGyro.std...XYZ              
fBodyAccMag.std..                 
fBodyBodyAccJerkMag.std..           
fBodyBodyGyroMag.std..               
fBodyBodyGyroJerkMag.std.. 



### How the Raw Dataset was Collected
The raw dataset contained 561 variables (NOT including 'subject' and 'activity'). Data was collected from 30 volunteers performing 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone. The data was generated by the smartphone's embedded accelerometer and gyroscope. 


### How the Raw Data was Processed  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


The complete list of variables of each feature vector is available in 'features.txt'