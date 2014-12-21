

##CodeBook

<br>

#####Source of the data
The raw data originates from a study by J. L. Reyes-Ortiz et al [1]. Thirty participants were carrying smartphones that measured inertial forces, while undertaking different activities. Further information about the study and the data set itself can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

<br>

#####Processing of the original data
The original data is separated into a training and a test set. Both cover the subject IDs (in the *subject* files), the activity the subject is performing during measurement coded as numbers from 1 to 6 (in the *y* files) and 561 features that describe the measurements from the smartphones (in the *X* files). They are combined to one data frame.
In addition to them following files are contained in the original data set:

* *README.txt*: information about the data set
* *features_info.txt*: information about the features
* *features.txt*: a list of all features
* *activity_labels.txt*: the meaning of the activity identifiers

To make the data set easier to understand names are given to the columns – *subject*, *activity* and the names from the *features.txt* file are assigned.
The more descriptive activity names from *activity_labels.txt* replace the numbers in the corresponding column.

Only the features that calculate the average or the standard deviation of the measurements are chosen for the new data frame. To summarize the features for these values the mean for each subject/activity combination is calculated.

The script used to perform the processing of the data (*run_analysis.R*) as well as further information about it (*README.md*) can be found on this Github respository.

<br>

#####Code book

Following variables are part of the data set:

* *subject*: the subject ID. For there were 30 participants in the study it is a integer number and reaches from 1 to 30.
* *activity*: the activity the subject was performing during the measurement. The alternatives are *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING* and *LAYING*.
* the features: the average (*mean()*) and the standard deviation (*std()*) of the following values were already part of the original data set (further information about the measurements can be found in the *feature_info.txt* file or on the linked website):
    * tBodyAcc-XYZ
    * tGravityAcc-XYZ
    * tBodyAccJerk-XYZ
    * tBodyGyro-XYZ
    * tBodyGyroJerk-XYZ
    * tBodyAccMag
    * tGravityAccMag
    * tBodyAccJerkMag
    * tBodyGyroMag
    * tBodyGyroJerkMag
    * fBodyAcc-XYZ
    * fBodyAccJerk-XYZ
    * fBodyGyro-XYZ
    * fBodyAccMag
    * fBodyAccJerkMag
    * fBodyGyroMag
    * fBodyGyroJerkMag
    
    (*XYZ*...present as a x, y and z component)    
    Each variable is normalized to a value between -1 and 1. In the final data set they are averaged for each activity each subject is performing.

____

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
