library(dplyr) ##Loads the dplyr library 

## Reads the files required to create the tidy dataset
subject_test <- read.table("./test/subject_test.txt") 
subject_train <- read.table("./train/subject_train.txt") 
subject <- rbind(subject_test, subject_train) ##combines subject test and train

activity_test <- read.table("./test/y_test.txt") 
activity_train <- read.table("./train/y_train.txt") 
activity <- rbind(activity_test, activity_train) ##combines y test and train

x_test_test <- read.table("./test/X_test.txt") ##x_test
x_test_train <- read.table("./train/X_train.txt") ##x_train
x_test <- rbind(x_test_test, x_test_train) ##combines X test and train

##Names the columns of the subject and activity variables
names(subject) <- "Subject"
names(activity) <- "Activity"

##Step 1: Merging the data into a single object
train_all <- cbind(subject, activity, x_test)

##Step 2: Extract only the measurements on mean and standard deviation
features <- read.table ("features.txt") ##Reads the list of features
list_mean <- grep("mean", features$V2) ##List of mean measurements
list_std <- grep("std", features$V2) ##list of std measurements
list_all <- c(list_mean, list_std) ##Creates a single list with mean and std
clabel <- features$V2 [list_all ] ##Creates a list of features with mean and std
list_all <- list_all +2 ##Adds 2 to the column number to account for 2 columns added
extracted <- cbind(Subject=train_all$Subject, Activity =train_all$Activity,train_all [,list_all ])

##Step 3: Replace activity ID with activity name
activity_labels <- read.table("activity_labels.txt") ##Reads the activity labels
extracted <- mutate(extracted, Activity = activity_labels$V2[extracted$Activity]) ##Replaces actvity
## id with descriptive name

##Step 4:Label dataset with descriptive variable names
clabel<-gsub("-","", clabel) ##Removes "-" from the names 
clabel<-gsub("\\()","", clabel) ##Removes "()" from the names
colnames(extracted)<- c("Subject", "Activity", clabel) ##Renames the columns

##Step 5:Creates tidy dataset
tidy_dataset<-summarise_each(extracted %>% group_by(Subject, Activity), mean)
tidy_dataset
