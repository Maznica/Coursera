# Getting and Cleaning Data - Course Project

This repository contains R code, documentation as well as final data set of the course project
for the Coursera class "Getting and Cleaning Data".

The data used for this project were taken from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Files
This repository contains following files:

### README.md 
this file describes the whole procedure as well as all files contained in this repository

### CodeBook.md
describes the data as well as all transformations made during the project

### run_analysis.R
this file contains all the code used for the whole analysis.

In very first step I merged the test and train features data (x_data).
I used the rbind command as both datasets contain the same variables.
I also renamed the variables (i.e. features) accordingly. To this end
I used the features.txt which contains the appropriate names of the features.
There is 561 features.
This data was then stored in data frame x_data.

In the second step I merged the labels data (y_data).
I also used the rbind command.
I renamed the variable to "activity"
There are 6 types of activity decoded as follows:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
This data was stored in data frame y_data.

In the third step I did the same with subject data.
I renamed the variable as "volunteer id", which is basically
an identifier for the subject. There are 30 volunteers.
I stored the data in data frame subject_data.

After that I extracted only the features with measurements
on the mean and standard deviation (mean, std) from the x_data.
To this end I again used the features.txt.
I stored the data as mean_std_data.

Then I merged this data with y_data and subject_data.
To this end I used the cbind command as the "key" is basically a row.
I stored this data into final_data.
This data frame contains 66 features + information about activity (activity)
and subject identifier (volunteer_id).

In the next step I added to the data description of activities.
To this end I used the activity_labels.txt.
I renamed the variables to activity (which is the key, code 1 - 6) and activity_description.
After that I used left_join from dplyr package to merge final_data with activity data.
I dropped the activity variable, so that there was only activity_description in the final_data
left.

After that I created tidy data set with the average of each feature by 
activity and subject.
To this end, I used the ddply command from the plyr package.

Finally, I saved the output as averages_data.txt.


### averages_data.txt
this is the output file which was also uploades on the course project's page
