# Getting-and-Cleaning-Data
Repository for the Getting and Cleaning Data course final project
The repository contains a script called run_analysis.R that reads the original data set from two folders: train and test (please do not modify the folder or file names nor the structure). Next, both data sets are combined into a single object where the first column is the Subject, the second is the Activity and the remaining columns represent the variables. The mean and std measurements are extracted and the mean of each variable is calculated for each subject and each activity. The output (tidy_dataset) is a tidy dataset containing the subject, activity, and mean of each of the extracted variables for each subject and each activity.  The overall process is as follows:

1. Load the data
2. Combine the train and test sets into a single object
3. Extract those features that contain mean or std in the feature name
4. Use the activity_labels.txt file to replace the activity IDs with descriptive activity names
5. Label the data set variables with descriptive names 
6. Create a tidy data set with the average of each variable for each subject and each activity

The dataset can also be found in the repository with the title tidy_dataset.txt.