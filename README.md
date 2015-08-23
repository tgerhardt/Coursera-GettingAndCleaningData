### Introduction
This script uses the dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. It will read in the test and training data, and create a data table with subject id, action, and the measurements on the mean and standard deviation for each measurement. Then it adds in descriptions and saves a tidy data set with the average of each variable for each activity and each subject.

You will need to install R to run the script.

### Using the Script
run_analysis.R needs to be placed in the root directory of the "UCI HAR Dataset". Inside R, set your working directory to this same folder, source the script, and run run_analysis(). The script works as follows:
1. It reads in the test and training data and merges them into one large data frame
2. It creates a new data frame that consists of the subject id, the action being performed, and the 66 variables that have -mean or -std in their name (these names come from features.txt in the original data files)
3. The columns of data frame are labelled
4. The data frame is melted to 4 columns: subject id, action, field name, and value. It's then cast back together with only 180 rows, one row for each subject ID and action pair, and the other 66 columns are the means of the values that fit that criteria. For example, the first row is for subject ID 1 when they were Walking, and the next column is the mean of all the "tBodyAcc-mean()-X" values that match that criteria.
5. The actions are translated from numbers to words
6. The file is saved as "tidy_data.txt"