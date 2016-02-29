#Getting and Cleaning Data Course Project

1. Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and take all the data in a single folder, make this folder your WD.
2. Call run_analysis.R and run it. 
3. Use data <- read.table("data_with_means.txt") command in RStudio to read the file.

There are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for 
each of the 66 features.

If you want to know the activities name, there is a function to change the names, is called rename, and
using apply you could mutate the list to work with the names. 