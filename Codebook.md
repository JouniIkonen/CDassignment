#Data Set Code Book: Human Activity Recognition Using Smartphones

Exercise Codebook
17.9.2014 

Codebook prepared by Jouni Ikonen for a course exercise. **I acknowledge that I used codebook example provided by Kirsten Frank** (https://class.coursera.org/getdata-007/forum/thread?thread_id=28) in this work. I also used http://www.icpsr.umich.edu/files/deposit/Guide-to-Codebooks_v1.pdf, which states:
"a code book is a list of variables, how they are obtained and what is the unit/dimension""


The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data used as input for the the exercise is available:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



#Codebook

Subject number was transformed to "Test person id" (unique) (1-30)

Activity was transfered to "Activity type", (unique text strings)["WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"]

79 other variables are selected from original dataset by selecting columns with 'mean' or 'std' (with small letters) in variable name. *These variables are dependent on original data set and their units should be checked from the original codebook to reflect any changes that might be done to downloaded raw data set.* (**However** Original description is included in end of this codebook for historical purposes.) Data is summarized by calculating average for each user and each activity type. **Averaged data is identified by AVERAGE in the end of the variable name to differntitate it from the raw data ** Description of variables are available in 'UCHI HAR Dataset/features_info.txt' file. Variables are:                "tBodyAcc-mean()-X-AVERAGE"              
 "tBodyAcc-mean()-Y-AVERAGE"               "tBodyAcc-mean()-Z-AVERAGE"               "tBodyAcc-std()-X-AVERAGE"               
  "tBodyAcc-std()-Y-AVERAGE"                "tBodyAcc-std()-Z-AVERAGE"                "tGravityAcc-mean()-X-AVERAGE"           
 "tGravityAcc-mean()-Y-AVERAGE"            "tGravityAcc-mean()-Z-AVERAGE"            "tGravityAcc-std()-X-AVERAGE"            
 "tGravityAcc-std()-Y-AVERAGE"             "tGravityAcc-std()-Z-AVERAGE"             "tBodyAccJerk-mean()-X-AVERAGE"          
 "tBodyAccJerk-mean()-Y-AVERAGE"           "tBodyAccJerk-mean()-Z-AVERAGE"           "tBodyAccJerk-std()-X-AVERAGE"           
 "tBodyAccJerk-std()-Y-AVERAGE"            "tBodyAccJerk-std()-Z-AVERAGE"            "tBodyGyro-mean()-X-AVERAGE"             
 "tBodyGyro-mean()-Y-AVERAGE"              "tBodyGyro-mean()-Z-AVERAGE"              "tBodyGyro-std()-X-AVERAGE"              
 "tBodyGyro-std()-Y-AVERAGE"               "tBodyGyro-std()-Z-AVERAGE"               "tBodyGyroJerk-mean()-X-AVERAGE"         
 "tBodyGyroJerk-mean()-Y-AVERAGE"          "tBodyGyroJerk-mean()-Z-AVERAGE"          "tBodyGyroJerk-std()-X-AVERAGE"          
 "tBodyGyroJerk-std()-Y-AVERAGE"           "tBodyGyroJerk-std()-Z-AVERAGE"           "tBodyAccMag-mean()-AVERAGE"             
 "tBodyAccMag-std()-AVERAGE"               "tGravityAccMag-mean()-AVERAGE"           "tGravityAccMag-std()-AVERAGE"           
 "tBodyAccJerkMag-mean()-AVERAGE"          "tBodyAccJerkMag-std()-AVERAGE"           "tBodyGyroMag-mean()-AVERAGE"            
 "tBodyGyroMag-std()-AVERAGE"              "tBodyGyroJerkMag-mean()-AVERAGE"         "tBodyGyroJerkMag-std()-AVERAGE"         
 "fBodyAcc-mean()-X-AVERAGE"               "fBodyAcc-mean()-Y-AVERAGE"               "fBodyAcc-mean()-Z-AVERAGE"              
 "fBodyAcc-std()-X-AVERAGE"                "fBodyAcc-std()-Y-AVERAGE"                "fBodyAcc-std()-Z-AVERAGE"               
 "fBodyAcc-meanFreq()-X-AVERAGE"           "fBodyAcc-meanFreq()-Y-AVERAGE"           "fBodyAcc-meanFreq()-Z-AVERAGE"          
 "fBodyAccJerk-mean()-X-AVERAGE"           "fBodyAccJerk-mean()-Y-AVERAGE"           "fBodyAccJerk-mean()-Z-AVERAGE"          
 "fBodyAccJerk-std()-X-AVERAGE"            "fBodyAccJerk-std()-Y-AVERAGE"            "fBodyAccJerk-std()-Z-AVERAGE"           
 "fBodyAccJerk-meanFreq()-X-AVERAGE"       "fBodyAccJerk-meanFreq()-Y-AVERAGE"       "fBodyAccJerk-meanFreq()-Z-AVERAGE"      
 "fBodyGyro-mean()-X-AVERAGE"              "fBodyGyro-mean()-Y-AVERAGE"              "fBodyGyro-mean()-Z-AVERAGE"             
 "fBodyGyro-std()-X-AVERAGE"               "fBodyGyro-std()-Y-AVERAGE"               "fBodyGyro-std()-Z-AVERAGE"              
 "fBodyGyro-meanFreq()-X-AVERAGE"          "fBodyGyro-meanFreq()-Y-AVERAGE"          "fBodyGyro-meanFreq()-Z-AVERAGE"         
 "fBodyAccMag-mean()-AVERAGE"              "fBodyAccMag-std()-AVERAGE"               "fBodyAccMag-meanFreq()-AVERAGE"         
 "fBodyBodyAccJerkMag-mean()-AVERAGE"      "fBodyBodyAccJerkMag-std()-AVERAGE"       "fBodyBodyAccJerkMag-meanFreq()-AVERAGE" 
 "fBodyBodyGyroMag-mean()-AVERAGE"         "fBodyBodyGyroMag-std()-AVERAGE"          "fBodyBodyGyroMag-meanFreq()-AVERAGE"    
 "fBodyBodyGyroJerkMag-mean()-AVERAGE"     "fBodyBodyGyroJerkMag-std()-AVERAGE"      "fBodyBodyGyroJerkMag-meanFreq()-AVERAGE"


Note1: there are six enteries for each test person, one for each activity. 

Note2: 79 other variables are composed of original raw data's column names and add them together with subject and activity' to the data frame ()
   I'm using given column names as descriptive column names (with AVERAGE ending to inform that values are averages from multiple measurements) as they have been already chosen by experts, who do understand more about the data than I do. 
   
Note3: For completenes the content of file 'UCHI HAR Dataset/features_info.txt' is *copied* below **Caution:** This information can differ from current raw dataset (this might be a bit paranid) 

###Feature Selection 

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



