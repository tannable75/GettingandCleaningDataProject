Files
---------
Readme - describes the data files
Part1.csv - tidy data set including columns with standard deviations or means with descriptive activity titles
Part2-bayactivity.csv - same data set as part 1 but grouped by Activity with all data averaged across activity
Part2-bySubject.csv - same data set as part 1 but grouped by Activity with all data averaged across activity
runanalysis.R - R script to produce files above from raw data sets that are not included


Variables in R script
-----------------------
xtest - data fram of import of raw data from x_test.txt provided
xtrain - data frame of import of raw data from xtrain.txt provided
ytest - data frame of import of raw data from y_test.txt provided
ytrain - data frame of import of raw data from y_train.txt provided
activitylavels - data frame of import of raw data from activity_labels.txt provided
subjecttest - vector produced from import of subject_test.txt file provided
subjecttrain - vector produced from import of subject_train.txt file provided
features - vector of column names from features.txt file provided
xmerged - combined data from with both test and training records
stdcols - vector of logic indicating column indicies that contain a standard deviation value
meancols - vector of logic indicating column indicies that contain a mean column value
selectedcols - vecotr of logic indicating the final column selections
xbyActivity - xmerged dataframe grouped by activity
xbySubject - xmerge dataframe grouped by subject


Notes 
-----------------------
The algorighim first loads all the data into memory in rows 1-31
Column names are assigned in rows 34-35
Activities and subjects are added as solumns in rows 38-39
The frames are merged together and activity labels added in rows 44-48
Columns are selected in rows 57-65
Part 1 output on lines 68-69

grouping by activty and subject and subsequent output in rows 70+
