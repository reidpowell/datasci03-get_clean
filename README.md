# datasci03-get_clean
Repo for the Coursera JHU Data Science course Getting and Cleaning Data

# Document Summary
The sections of this document are intended to reflect the evaluation requirements.  There are two main sections to indicate how the submission meets the assignment's requirements (so that graders will (hopefully) feel able to answer "Yes").

1. Tidy data set
  * Meets each principal of a tidy data set
2. Github Repo
  * Repo Link
  * Code Book
  * README

Following these sections are more details and explanation about the submission. They explain how the scripts work, how they are connected, and how they meet the requirements not necessarily covered by the short evaluation questions.

# Tidy Data Set
(For the purposes of this submission, we refer to https://github.com/jtleek/datasharing and http://vita.had.co.nz/papers/tidy-data.pdf)

The project spec also states that "wide" data sets are acceptable, which is what has been submitted. Please see codebook.md for more detail.

The "key" (individual entities for which we report variables' values) is a combination of the "activityName" and "subjectId". Each row corresponds to a unique (activityName,subjectId) pair, and all 180 (6 activities, 30 participants) possible combinations are represented.

The variables in the tidy data set represent the MEAN (average) of the (subset of) feature estimates described in the project data's code book.

# Github Repo
The following sections give details about the files required by the project spec:
  
  * Repo Link
  * Code Book
  * README

All of these items are provided in this submission and are described below.

## Repo Link
Please navigate to https://github.com/reidpowell/datasci03-get_clean to view the GitHub repo.

## Code Book
The code book for this project is contained in codebook.md. According to the tidy data references, a code book should contain

1. Information about the variables (including units!) in the data set not contained in the tidy data
2. Information about the summary choices you made
3. Information about the experimental study design you used

Each of the variables in the tidy data set are described and details about how it differs from the given data set are provided, along with details about the choices made.

## README
This file describes the contents of the repo as well as the as well as the logic contained in the run_analysis.R script.

# Submission Notes
The main piece of the assignment is the script run_analysis.R. It is intended to do the following.

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Below (in addition to comments in the script itself) we describe the logic of the script.

## Merge Training and Test Data
This submission uses relative paths and assumes the folder/directory "UCI HAR Dataset" is unzipped into the current working directory.

In this data set, it appears that the data are partitioned into two subsets: test and train. It seems that observations corresponding to a subject (person participating in the study; there are 30 subjects in the study) are placed into one category or the other. In this submission, we will merge these two data sets so that all 30 subjects' observations are in a single data set.

The test and train subfolders have the same file structure and there are three (correspondingly named) files in each.

1. subject_test.txt: provides the ID of the person to which a particular sample corresponds
2. X_test.txt: provides the feature estimates for a given (subject,activity) pair
3. y_test.txt: provides the activity ID that a given subject's estimates correspond to

Note: The "Inertial Signals" data will be omitted for the purposes of this submission. (From my understading, these subdirectories contain the gyroscopic and accelerometric data from the smartphones, from which feature estimates were calculated (in addition to other analyses). These estimates are the values with which we are concerned.)

## Extract Mean and Stdev
We are only interested in a subset of the features supplied, so we will use the "features.txt" file to determine which columns should be kept (those that contain either "mean()" or "std()").

### Interpretation of Mean and Standard Deviation
In this submission, we consider any feature containing either mean() or std() to be of interest. There are features that contain mean elsewhere in their title, e.g., "294 fBodyAcc-meanFreq()-X", and this code can be modified to analyze those; however, as there is no requirement for analysis of mean frequency of any of the FFT features or any accompanying standard deviation feature, they are omitted.

## Use Descriptive Activity Names
These activity names are taken from the "activiy_labels.txt" file.

## Label Variables
Variable names are taken from the "features.txt" file.

## Average for each Activity and Subject
A tidy data set containing the mean value of each of the mean() and std() features of the spec data for each (activity,subject) pair was written to a file and submitted to the Coursera website. To browse the result in RStudio, please use the command

tidy_dat <- read.table("./activitysubject_featureaverage.txt", header = TRUE)

with the file "activitysubject_featureaverage.txt" in your working directory.

# Thank You!
Thank you, dear grader, for your time and comments!