# Data Source

The data linked to this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was originated from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project is provided by the Course and download from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Set Information

The originated data sets contains the senor readings of a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# Selection of Variable

The original data set contains 561 variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  Based on the project requirement, only 66 variables are selected.  They are the measurements on the mean and standard deviation for each measurement.  

Apart from the 66 sersors related variables, there are 2 additional variables, Subject and ActivityName, which refers to subject of study (1-30) and activity performed during the experiment.

# Data Processing 

### Step 1: Merges the training and the test sets to create one data set. 

> The test and train data in the original data set were merge using rbind().  Then combining subject, y (activity) and x (sensor values) into a single Data Set with cbind(). 

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.  

> Using the grepl() function to get all the column name with pattern 'mean()' and 'std()'. And treat it as filter to obtain the data with desired column only.

### Step 3: Uses descriptive activity names to name the activities in the data set 

> To replace the 1-6 activity code with activity name provided in activity_labels.txt

### Step 4: Appropriately labels the data set with descriptive variable names.

> Using the name in features.txt (already supplemented in Step 1) but remove '()' and '-' from the string using the gsub() function. Also replace 'mean' with 'Mean' and 'std' with 'Std'.

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

> Summarize (avg) the data with the aggregate() function and group by subject and activity name.  Then write the result using write.table()

# Value in the 'getdata-project-tidydata.txt' (Summaries)
The sensor value in the 'getdata-project-tidydata.txt' data set are the **average** of each variable for each activity and each subject.

# Variable Description

### Non Sensor Reading related
- Subject: refers to the subject being studied (1-30) in the experiments

- ActivityName: refers to one of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed during the experiments

### Sensor Reading related

There are 66 sensors related variable, with 33 related to the mean of each measurement and another 33 related to the standard deviation of each measurement.

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

### List of Variables
> 
- The prefix 't' in the below indicate the variable is time domain signal, while prefix 'f' indicate it is frequency domain signal.
- The suffix 'MeanX', 'MeanY' or 'MeanZ' indicate the value is the Mean of 3-axial signals in the X, Y and Z directions.
- The suffix 'StdX', 'StdY' or 'StdZ' indicate the value is the Standard Deviation of 3-axial signals in the X, Y and Z directions.
- The suffix 'Mean' indicate the value is the Mean of the signals.
- The suffix 'Std' indicate the value is the Standard Deviation of the signals.

- Subject
- ActivityName
- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccStdX
- tGravityAccStdY
- tGravityAccStdZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkStdX
- tBodyAccJerkStdY
- tBodyAccJerkStdZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroStdX
- tBodyGyroStdY
- tBodyGyroStdZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkStdX
- tBodyGyroJerkStdY
- tBodyGyroJerkStdZ
- tBodyAccMagMean
- tBodyAccMagStd
- tGravityAccMagMean
- tGravityAccMagStd
- tBodyAccJerkMagMean
- tBodyAccJerkMagStd
- tBodyGyroMagMean
- tBodyGyroMagStd
- tBodyGyroJerkMagMean
- tBodyGyroJerkMagStd
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccStdX
- fBodyAccStdY
- fBodyAccStdZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkStdX
- fBodyAccJerkStdY
- fBodyAccJerkStdZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroStdX
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyAccMagMean
- fBodyAccMagStd
- fBodyBodyAccJerkMagMean
- fBodyBodyAccJerkMagStd
- fBodyBodyGyroMagMean
- fBodyBodyGyroMagStd
- fBodyBodyGyroJerkMagMean
- fBodyBodyGyroJerkMagStd