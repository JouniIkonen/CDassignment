# This script loads and processes data accordig course assigment provided in:
# https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions

# Output is a file 'Tidy_dataset.txt' 



# Load files needed to be cleaned

  url_zip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  # Check if data are downloaded and extracted
  # if not download, extreact and remove .zip file
  
  if((!file.exists("./UCI\ HAR\ Dataset/test/X_test.txt")) && (!file.exists("./UCI\ HAR\ Dataset/train/X_train.txt"))) {
    print("Downloading and extracting data files")
    download.file(url_zip,destfile="./data.zip",method="curl")
    
    # extract downloaded data package
    unzip("./data.zip")
    
    # remove .zip file
    unlink("./data.zip")
  } else print("Data files exists, no need to download")

    print("Processing data")
   
 # Read test and training data sets.
  test_set <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt")
  train_set <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")

  # read activity ID's for measurements (from training and test set) and combine them 
  activity_training_id <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
  activity_test_id <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
  activity_ids <- rbind(activity_training_id, activity_test_id)
  
  # Step 3 "Uses descriptive activity names to name the activities in the data set"
  # change ID's to describing texts (there is probably better way to do this!)
  activity_ids$V1 <- replace(activity_ids$V1, activity_ids$V1=="1", "WALKING")
  activity_ids$V1 <- replace(activity_ids$V1, activity_ids$V1=="2", "WALKING_UPSTAIRS")
  activity_ids$V1 <- replace(activity_ids$V1, activity_ids$V1=="3", "WALKING_DOWNSTAIRS")
  activity_ids$V1 <- replace(activity_ids$V1, activity_ids$V1=="4", "SITTING")
  activity_ids$V1 <- replace(activity_ids$V1, activity_ids$V1=="5", "STANDING")
  activity_ids$V1 <- replace(activity_ids$V1, activity_ids$V1=="6", "LAYING")

  # read subject (test person) ID's from both sets and combine them 
  subject_training_id <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
  subject_test_id <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")
  subject_ids <- rbind(subject_training_id, subject_test_id)

  # Add test data set to training data (add new test data, ie. rows) 
  DT <- rbind(train_set,test_set)
  
  # Build a new data frame, which has followin columns
  # Test person id, activity, and experiment data coulumns
  DT <- cbind(subject_ids, activity_ids, DT)

  # 4. Appropriately labels the data set with descriptive variable names. 
  # I'm using given column names as descriptive column names as they have been already chosen by experts, who do understand more about the data than I do
  # I'm adding two additional variable names, which I'm naming "Test person id" to describe the test person and "Activity type" to decribe activity
  # Get column names
  column_names_tmp <- read.table("./UCI\ HAR\ Dataset/features.txt", stringsAsFactors=FALSE)
  
  # Add new labels ("Test person id" and "Activity type") to column name set   
  column_names_tmp <- rbind("Test person id", "Activity type", column_names_tmp)
  columnNames <- column_names_tmp[,2];
  
  # Add column names to the data set
  colnames(DT) <- columnNames

  # Select columns which have mean or std the name (Step 2)
  # Done after we have attached labels to DF
  # Extract only the measurements on the mean and standard deviation for each measurement.
  # Note that my reg.exp is assumine that there is no clashing variables for person id and activity (this is a hack ;)
  a <- DT[,grep("mean|std|Activity|person", names(DT), value=TRUE)]

  # 5. From the data set in step 4, creates a second, independent tidy data set 
  # with the average of each variable for each activity and each subject.

  # I got help for step 5 from (which was mentioned in course forums):
  # http://stackoverflow.com/questions/10787640/ddply-summarize-for-repeating-same-statistical-function-across-large-number-of
  # and the following (of which the last one was finally applied)
  # http://www.slideshare.net/jeffreybreen/grouping-summarizing-data-in-r
  # http://stackoverflow.com/questions/13919587/summarize-based-on-two-grouping-variables-in-r-using-data-table 

  library("data.table")
  b <- data.table(a)
  setkeyv(b, keycols)
  c <- b[, lapply(.SD,mean), by = key(b)]
  
  #add identifier AVERAGE each variable too mark that value is average from multiple measurements, which the subject person has done in a type of activity
  colnames(c)[3:81] <- paste(colnames(c)[3:81],"AVERAGE",sep ="-")
  
  # Write regusted data table with the name 'Tidy_dataset.txt'
  write.table(c, './Tidy_dataset.txt', row.name=FALSE)
  print("Wrote the tidy dataset to 'Tidy_dataset.txt'")