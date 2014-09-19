# Introduction

This is an assigment for the course "Getting and Cleaning Data"
https://class.coursera.org/getdata-007/

This file explains operation of run_analysis.R script ans some the assumptions made for this assignment
Please note that run_analysis.R is commented carefully to be readable by itself.

The work presented here does NOT follow the order proposed in the assignment description as I found it more logical to complete the table first and only then to select colums requested (which was acknowledged by TA's to be OK).

Note1: * Sorry about grammar or spelling errors - English is not my first language *

# run_analysis.R does following steps:

1. Check if the data set directory has been downloaded and unzipped to current working directory. If not then it will download and unpack it. Downloaded zip-file is expected to create 'UCHI HAR Dataset' directory inside the working directory
2. It reads training and test set, related activity sets and subject ID's
3. It combines each type of data data (Steps 2-6 build the data frame described by David Hood ![data layout](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png), except that Activity and Subject columns are on the left side of the DF)
4. Replace Activity identifiers, by descriptive names, which are (e.g. WALKING, SITTING)
5. Combined all the information to a single data frame
6. Read original column names and add them together with subject and activity' to the data frame ()
   I'm using given column names as descriptive column names as they have been already chosen by experts, who do understand more about the data than I do
   I'm adding two additional variable names, which I'm naming "Test person id" to describe the test person and "Activity type" to decribe activity

7. Build a new data frame by selecting the columns with "mean", "std" together with the columns of Activities and user identification using grep function.

8. Create an independent tidy data set with the average of each variable for each activity and each subject.

9. Add variable names identifer AVERAGE, to point out that repeated measurements have been averaged.

10. The script creates a tidy data set which it stores in 'Tidy_dataset.txt' file.

This file can be read in from the current working directory by 
`read.table('./Tidy_dataset.txt', header=TRUE, check.names=F)`



