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
features_of_interest <- within(features_of_interest, column_name <- paste("V",featureId,sep = ""))

## END: Extract features of interest: mean, standard deviation


## BEGIN: Merge data

## END: Merge data