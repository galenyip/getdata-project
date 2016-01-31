rm(list=ls())
#setwd("~/Google Drive/Coursera/Rprog/getdata-035/project")

# Step 1 -----------------------------------------------------------------------
#
# Merges the training and the test sets to create one data set. 
#
# Solution: the test and train data were merge using rbind().  Then combining 
#           subject, y (activity) and x (sensor values) into a single Data Set 
#           with cbind(). 
#
# ------------------------------------------------------------------------------

# Read in Data from Files

	# Read in generic data
	features <- read.table("features.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	
	# Read in Test Data
	subject_test <- read.table("subject_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	x_test <- read.table("X_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	y_test <- read.table("y_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	
	# Read in Train Data
	subject_train <- read.table("subject_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	x_train <- read.table("X_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
	y_train <- read.table("y_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)

# Combining Text and Training Data Set

	# Combine x_test and x_train
	x_combine <- rbind(x_test,x_train)
	# Combine y_test and y_train
	y_combine <- rbind(y_test,y_train)
	# Combine subject_test and subject_train
	subject_combine <- rbind(subject_test,subject_train)

# label the combined subject, y and x	

	# label subject_combine
	colnames(subject_combine) <- 'Subject'
	# label y_combine
	colnames(y_combine) <- 'ActivityCode'
	# label x_combine
	colnames(x_combine) <- features[,2]
	
# Combining subject, y (activity) and x (sensor values) into a single Data Set so to
# merges the training and the test sets to create one data set. 

	step1_result <- cbind(subject_combine, y_combine, x_combine)

		
# Step 2 -----------------------------------------------------------------------
#
# Extracts only the measurements on the mean and standard deviation for each 
# measurement.  
#	
# Solution: using the grepl() function to get all the column name with pattern 
#           mean() and std(). And treat it as filter to obtain the data with 
#           desired column only.
#
# ------------------------------------------------------------------------------

# Using the base::grepl() function to identify all the column name contains 'std()' or 'mean()'

	# Identify the pattern in the column names
	select_mean_col <- grepl('mean()',features[,2],fixed = T)
	select_std_col <- grepl('std()',features[,2],fixed = T)

	# Identify column either with mean() or std()
	std_mean_col <- select_mean_col | select_std_col

	# To match with step1_result: added Subject and Activity column, create vector with first 
	# two as TRUE (i.e. always include them), and followed by the column identify in std_mean_col
	final_col <- c(TRUE, TRUE, std_mean_col)

# apply the final_col to step1_result so to extract only the measurements on the mean and standard 
# deviation for each measurement. 
step2_result <- step1_result[,final_col]


# Step 3 -----------------------------------------------------------------------
#
# Uses descriptive activity names to name the activities in the data set 
# 
# Solution: To replace the 1-6 activity code with activity name provided in
#           activity_labels.txt
#
# ------------------------------------------------------------------------------

# Replace (with merge() function) the numeric representation of Activity in the Descriptive names using the
# activity labels

step3_temp <- merge(activity_labels,step2_result,all.y=T,
		      by.x = c('V1'),
		      by.y = c('ActivityCode'))

# Rename the Activity Name column V2 after merge
colnames(step3_temp)[which(colnames(step3_temp) == 'V2')] <- 'ActivityName'

# Remove V1 column and assign to step3_result
step3_result <- step3_temp[,c(-1)]

# Step 4 -----------------------------------------------------------------------
#
# Appropriately labels the data set with descriptive variable names.
#
# Solution: using the name in features.txt (already supplemented in Step 1) but 
#           remove '()' from the string using the gsub() function
#
# ------------------------------------------------------------------------------

step4_temp <- step3_result
colnames(step4_temp) <- gsub('()','',colnames(step4_temp), fixed = TRUE)

step4_result <- step4_temp

# Step 5 -----------------------------------------------------------------------
#
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
#
# Solution: Summarize (avg) the data with the aggregate() function and group by 
#           subject and activity name
#
# ------------------------------------------------------------------------------

step5_result <- aggregate(step4_result[,3:ncol(step4_result)], by = list(Subject = step4_result$Subject,ActivityName = step4_result$ActivityName),FUN=mean,na.rm=T)

# Export result as .txt using write.table() and row.name=FALSE
write.table(step5_result,file = 'getdata-035-project-tidydata.txt',row.names = FALSE)
