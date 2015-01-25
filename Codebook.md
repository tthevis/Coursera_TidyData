# Codebook

## About the Data

*Original Data Description*

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

(Quote from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Conversion

1. The randomly partitioned test and train data sets are reunited.

2. From the original 561 variables only the estimates of the mean value and the standard deviation (indicated by a `mean()` and a `std()` substring in the variable name) are selected.
This selection contains 66 features.

3. Observations are formed by numerical identifiers of _subjects_ (1 .. 30) and six different _activities_ (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING).  These are grouped into 180 observations by taking the avarage value of the measured value for each feature of the group.

4. Variable name cleansing

  * To support subsequent data processings, hyphen (`-`) and parenthesis (`(` and `)`) are deleted because these characters invalid for variable naming in R and other programming languages.
  * The original data set distinguisches between _time domain signals_ (denoted by a `t` prefix in variable names) and a _Fast Fourier Transformation_ of the signals (`f` prefix). To make this destinction more obvious the prefixes are replaced by `time` and `freq`, respectively.
  * _camelCase_ notion was replaced by _dotted.lowercase_ notion
  * Examples:
    
    + `tBodyAcc-mean()-X` -> `time.body.acc.mean.x`
    + `fBodyAccJerk-std()-X` -> `freq.body.acc.jerk.std.x`

## List of Variables

    subject
    activity
  	time.body.acc.mean.x
  	time.body.acc.mean.y
  	time.body.acc.mean.z
  	time.body.acc.std.x
  	time.body.acc.std.y
  	time.body.acc.std.z
  	time.gravity.acc.mean.x
  	time.gravity.acc.mean.y
  	time.gravity.acc.mean.z
  	time.gravity.acc.std.x
  	time.gravity.acc.std.y
  	time.gravity.acc.std.z
  	time.body.acc.jerk.mean.x
  	time.body.acc.jerk.mean.y
    time.body.acc.jerk.mean.z
    time.body.acc.jerk.std.x
    time.body.acc.jerk.std.y
    time.body.acc.jerk.std.z
    time.body.gyro.mean.x
    time.body.gyro.mean.y
  	time.body.gyro.mean.z
  	time.body.gyro.std.x
  	time.body.gyro.std.y
  	time.body.gyro.std.z
  	time.body.gyro.jerk.mean.x
  	time.body.gyro.jerk.mean.y
  	time.body.gyro.jerk.mean.z
  	time.body.gyro.jerk.std.x
  	time.body.gyro.jerk.std.y
  	time.body.gyro.jerk.std.z
  	time.body.acc.mag.mean
  	time.body.acc.mag.std
  	time.gravity.acc.mag.mean
  	time.gravity.acc.mag.std
  	time.body.acc.jerk.mag.mean
  	time.body.acc.jerk.mag.std
  	time.body.gyro.mag.mean
  	time.body.gyro.mag.std
  	time.body.gyro.jerk.mag.mean
  	time.body.gyro.jerk.mag.std
  	freq.body.acc.mean.x
  	freq.body.acc.mean.y
  	freq.body.acc.mean.z
  	freq.body.acc.std.x
  	freq.body.acc.std.y
  	freq.body.acc.std.z
  	freq.body.acc.jerk.mean.x
  	freq.body.acc.jerk.mean.y
  	freq.body.acc.jerk.mean.z
  	freq.body.acc.jerk.std.x
  	freq.body.acc.jerk.std.y
  	freq.body.acc.jerk.std.z
  	freq.body.gyro.mean.x
  	freq.body.gyro.mean.y
  	freq.body.gyro.mean.z
  	freq.body.gyro.std.x
  	freq.body.gyro.std.y
  	freq.body.gyro.std.z
  	freq.body.acc.mag.mean
  	freq.body.acc.mag.std
  	freq.body.body.acc.jerk.mag.mean
  	freq.body.body.acc.jerk.mag.std
  	freq.body.body.gyro.mag.mean
  	freq.body.body.gyro.mag.std
  	freq.body.body.gyro.jerk.mag.mean
  	freq.body.body.gyro.jerk.mag.std

## Variable Meaning

All measurement/estimated variables are normalized to a range of `[-1, 1]` The following description is taken from the `features_info.txt` file contained in the original data set:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.