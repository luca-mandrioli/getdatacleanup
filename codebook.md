Getting and Cleaning Data Codebook - getdata-015
==========================================

## Execution steps:
- loads x, y, subject data, features and activity labels. 
- merges x, y, subject test data with train data
- loads activity labels and renaming the subject column
- extract only the different features from X which are corresponding to mean or std
- substitutes activity labels to the activity IDs in the y table
- merges x, y and subject in a single table
- copies the output table and calculates the mean for each statistics (x), grouped by each activity and by each subject

## Column names:
- *subject*: contains the ID of the subject performing the activity
- *activityLabel*: contains the type of activity associated to the stats recorder
- *79 variables* recording mean and standard deviation associated to an activity for a specific subject
