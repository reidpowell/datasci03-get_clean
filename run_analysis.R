## BEGIN: Read the data set

## subject IDs
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train = read.table("./UCI HAR Dataset/train/subject_test.txt")

## feature estimates for a (subject,activity) pair
feature_estimates_test = read.table("./UCI HAR Dataset/test/X_test.txt")
feature_estimates_train = read.table("./UCI HAR Dataset/train/X_train.txt")

## activity IDs
activity_test = read.table("./UCI HAR Dataset/test/y_test.txt")
activity_train = read.table("./UCI HAR Dataset/train/y_train.txt")

## END: Read the data set


## BEGIN: Extract features of interest: mean, standard deviation

## read the features.txt file
feature_enum <- read.table("./UCI HAR Dataset/features.txt")

## rename columns
feature_enum <- setNames(feature_enum,c("featureId","featureName"))

## get a subset of IDs that correspond to mean() and std()
features_of_interest <- subset(feature_enum, grepl("mean\\(\\)|std\\(\\)",featureName))

## match the IDs to column names in the feature data
features_of_interest <- within(features_of_interest, featureColumnId <- paste("V",featureId,sep = ""))

## END: Extract features of interest: mean, standard deviation


## BEGIN: Merge data

## Merge the fields that will make up our "composite key"...
subject_activity_test <- cbind(subject_test,activity_test)
subject_activity_test <- setNames(subject_activity_test,c("subjectId","activityId"))

## ...along with the data from the features of interest
test_data <- cbind(subject_activity_test,feature_estimates_test[,features_of_interest$featureColumnId])

## Do the same for the training data
subject_activity_train <- cbind(subject_train,activity_train)
subject_activity_train <- setNames(subject_activity_train,c("subjectId","activityId"))
train_data <- cbind(subject_activity_train,feature_estimates_train[,features_of_interest$featureColumnId])

## Merge the rows of taining and testing data into one data set
dat <- rbind(train_data,test_data)

## END: Merge data


## BEGIN: Use Activity Names instead of Activity IDs

## Read the activity enum and name columns appropriately
activity_enum <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_enum <- setNames(activity_enum, c("activityId","activityName"))

## Pick up activity names from enum
dat <- merge(x = dat, y = activity_enum, by = "activityId", all.x = TRUE)

## END: Use Activity Names instead of Activity IDs


## BEGIN: Use more descriptive Variable Names

dat <- setNames(dat, c("activityId", "subjectId", as.vector(features_of_interest$featureName), "activityName"))

## cleanup and reorder columns by dropping activity ID column and reordering
## according to project spec
dat <- dat[,!(names(dat) %in% c("activityId"))]
dat <- dat[,c(ncol(dat),1,seq(from = 2, to = ncol(dat) - 1))]

## END: Use more descriptive Variable Names


## BEGIN: Create tidy data set with the average of each variable for each
## activity and each subject.

library(data.table)
dat_table <- data.table(dat)
setkey(dat_table,activityName, subjectId)
tidy_data <- dat_table[,lapply(.SD, mean), by = key(dat_table)]

## END: Create tidy data set with the average of each variable for each
## activity and each subject.


## Write the file
write.table(tidy_data, file = "./activitysubject_featureaverage.txt", row.names = FALSE)