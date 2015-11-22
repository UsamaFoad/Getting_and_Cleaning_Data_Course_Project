Getting and Cleaning Data Course Project
=======
This repository created for Getting and Cleaning Data Course Project.
The current repository include four files:
* README.md (current file)
* CodeBook.md
* run_analysis.R
* tidy_data.txt

The main goal for current project is to create one R script called **run_analysis.R** that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the **mean** and **standard deviation** for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

[Here are the raw data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and [A full description is available at the site where the data was obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

CodeBook.md
--------
A code book that describes the variables, the data, transformations and work that performed to clean up the data. It also include information about software used in current project.

run_analysis.R
--------
R script to create the tidy data from the raw data.

tidy_data.txt
--------
The output of the run_analysis.R file contain the tidy data