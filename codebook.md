# Introduction
This document assumes the grader is familiar with the project spec and data provided.

We provide a tidy dataset by transforming the dataset provided with the project spec. The original dataset represents a combination of gyroscopic and accelerometric data from 30 participants' smartphones while they engaged in different activities, as well as estimates of mean, standard deviation, and other quantities for each of the features studied.

This tidy data set is built from those estimates, specifically those relating to the mean and standard deviation of the studied features.

The primary key for this table is composition of (activityName,subjectId). Each corresponds to one record in the table, and each unique (activityName,subjectId) pair is represented exactly once.

# Data Dictionary - Mean of smart phone motion data for various activities
Below are details relating to each column in the data set.

## activityName
This column designates the activity the subject was involved in to generate the corresponding feature mean. This is a categorical field.

|code              |
|------------------|
|WALKING           |
|WALKING_UPSTAIRS  |
|WALKING_DOWNSTAIRS|
|SITTING           |
|STANDING          |
|LAYING            |

## subjectId
This column identifies the individual engaged in the given activity. Values are integers in the range [1,30] and is categorical. No mapping of individuals' names to subjectId was provided.

## Feature Means
Please refer to the README.txt supplied with the project spec data for background. Within the source data provided with the project spec, inertial data from the smartphones of various participants was provided.

Each variable in the tidy data set represents the _mean_ of the corresponding feature's summary values in the original dataset. The descriptive variable names are of the same format used in the provided dataset, e.g.,

fBodyBodyAccJerkMag-std()

represents the normalized (over the range [-1,1]) standard deviation of the magnitude of the fourier transform of the Jerk (change in acceleration) experienced by the smartphone's accelerometer. Please refer to the spec data codebook for a complete explanation. Other variables are similarly named; mean() indicating that the mean of a set of measurements is reported and std() indicating the standard deviation of those measurements is reported.

The variables in the tidy data set report the mean of these features' summary values.

The values in these columns are assumed to be unitless since the measurements provided are normalized values on the range [-1,1]. Each variable name is preceded by either an f or a t, which stand for fourier transform and time, respectively. This likely means that before normalization, the underlying values were in units of frequency and time, respectively.