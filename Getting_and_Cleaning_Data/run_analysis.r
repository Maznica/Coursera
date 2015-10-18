##################################################
##################################################

# G E T T I N G  A N D  C L E A N I N G  D A T A
# C O U R S E  P R O J E C T

##################################################
##################################################


## Setting working directory

setwd("C:/Users/mmasika/Dropbox/Coursera/Data_Science/Getting and Cleaning Data/Assignments/UCI HAR Dataset")

##########################################################
## Question 1
## Merge the training and test sets to create one data set

# Features Data Set

x_train <- read.table("train/X_train.txt")
# Train data  with 561 variables and 7352 observations

x_test <- read.table("test/X_test.txt")
# Test data (features) - with 561 variables and 2947 observations

## Merge features data
x_data <- rbind(x_train, x_test)

# In order to rename the column names we have to use features.txt
# This is file with all features
# In the first step we upload the data
# Then we extract the names of the features
# Finally, we rename the columns of x_data

features <- read.table("features.txt")
listing <- features$V2
names(x_data) <- listing

# Drop not useful data frames and lists
listing <- NULL
x_test <- NULL
x_train <- NULL

# Labels data set (y data) - activities

y_train <- read.table("train/y_train.txt")
# Train data (labels) with 7352 observations and 1 variable
# The variable contains information about the label, i.e. activity
# Activity range3 is between 1 till 6.
# 1 - WALKING, 2 - WALKING_UPSTAIRS, 3 - WALKING_DOWNSTAIRS,
# 4 - SITTING, 5 - STANDING, 6 - LAYING

y_test <- read.table("test/y_test.txt")
# Test data (labels) with 2947 observations and one variable

# Merge labels data
y_data <- rbind(y_train, y_test)

# rename the variable
names(y_data) <- "activity"

# Drop not useful data frames

y_test <- NULL
y_train <- NULL

# Information about the subjects - volunteers

subject_train <- read.table("train/subject_train.txt")
# train data - with 7352 observations with 1 variable (volunteer_id)
# Each row is identified by volunteer and time window.
# Each row specifies the activity
# There are 30 volunteers

subject_test <- read.table("test/subject_test.txt")
# subject test data - 2947 observations with 1 variable

# Merge the subject data
subject_data <- rbind(subject_train, subject_test)

# rename the variable
names(subject_data) <- "volunteer_id"

# Drop not useful data frames

subject_test <- NULL
subject_train <- NULL

##########################################################
# Question 2
# Extract only the measurements on the mean and standard 
# deviation for each measurement (mean,std)

# In the first step we extract all relevant features from features dataframe
list_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

# In the second step we subset the desired columns from features dataset
mean_std_data <- x_data[, list_mean_std]
# There are 66 variables with mean or std in the name

# New Final Data

final_data <- cbind(mean_std_data,y_data,subject_data)
# 68 Variables and 10299 observations

#############################################################
# Question 3
# Use descriptive activity names to name the activities in the data set

# Data Frame with activities
activities <- read.table("activity_labels.txt")
# rename the columns
names(activities) <- c("activity","activity_description")

# merge with the data, joining by activity
library(dplyr)
final_data <- final_data %>% left_join(activities)
# drop the activity
final_data$activity <- NULL

##################################################################
# Question 4
# Appropriately label the data set with descriptive variable names

## This is already done in the question 1 - see the question 1
# To check the names
names(final_data)

#################################################################
# Question 5
# Create a second, independent tidy data set with the average 
# of each variable for each activity and each subject


# use ddply
library(plyr)
averages_data <- ddply(final_data, .(volunteer_id, activity_description), 
                       function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)

























