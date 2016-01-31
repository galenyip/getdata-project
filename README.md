---
output: html_document
---
# About this repo
Link: https://github.com/galenyip/getdata-project

# Background
This repo is for the course project of Coursera Course "R Programing - Getting and Cleaning Data" provided by Johns Hopkins University.

It consist of 3 files:
- README.MD (this file)
- run_analysis.R (the script that used to genrate output for the project)
- CodeBook.MD (describes the variables, the data, and any transformations or work that you performed to clean up the data)

All the R code to process the data is in run_analysis.R .  The file basically having 5 parts, which addressing the 5 requirements of the project.  It is with comment at the beginning of each park to briefly describe what is the objective and how to achieve that.

## Part 1: Merges the training and the test sets to create one data set. 

> Solution: the test and train data were merge using rbind().  Then combining 
          subject, y (activity) and x (sensor values) into a single Data Set 
          with cbind(). 

## Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.  

> Solution: using the grepl() function to get all the column name with pattern 
          mean() and std(). And treat it as filter to obtain the data with 
          desired column only.

## Part 3: Uses descriptive activity names to name the activities in the data set 

> Solution: To replace the 1-6 activity code with activity name provided in
          activity_labels.txt

## Part 4: Appropriately labels the data set with descriptive variable names.

> Solution: using the name in features.txt (already supplemented in Step 1) but 
          remove '()' from the string using the gsub() function

## Part 5: From the data set in part 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

> Solution: Summarize (avg) the data with the aggregate() function and group by 
          subject and activity name
