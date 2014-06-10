## README

###Introduction

This repo contains a script for "R" containing code to complete the "Getting and cleaning data" project.

The data are from accelerometers in Samsung Galaxy S smartphones. A full description is here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and the link to the data is here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Project Description

We were asked to do the following. 

1.Merge the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

For Step 2. I kept all variables with a "-mean()" or "-sd()" in the title.  Referring to the features.txt file that is included with the data the following variables are kept for analysis:1,2,3:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,255,256,268:273,347:352,426:431,505,506,531,532,544,545.  

This is a total of 66 variables

For each variable I completed step 5 by collapsing to the mean by subject and activity.  There are 30 subjects and 6 activities for a total of 180 observations.  The data set is 66 variables by 180 observations.  

The script is included in the file run_analysis.R.

##IMPORTANT
to run this script run install.packages("doBy").
This package makes it simple to collapse data in a data frame.  You want this package!!

 