library(dplyr)
library(stringr)

# Step 0
# Download and unzip data if not already present

getData <- function() {
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                destfile = 'tmp.zip',
                method = 'curl') 
  unzip('tmp.zip')
  file.remove('tmp.zip')
}

if(!file.exists('UCI HAR Dataset')) { getData() }


# Step 1
# Create one data set from training and test data (ignore 'Inertial Signals' folder)
# (activity label and subject information will be added in step 3)

trainData <- read.table('UCI HAR Dataset/train/X_train.txt')
trainLabels <- read.table('UCI HAR Dataset/train/y_train.txt')
trainSubjects <- read.table('UCI HAR Dataset/train/subject_train.txt')

testData <- read.table('UCI HAR Dataset/test/X_test.txt')
testLabels <- read.table('UCI HAR Dataset/test/y_test.txt')
testSubjects <- read.table('UCI HAR Dataset/test/subject_test.txt')

fullData <- rbind(trainData, testData)
fullLabels <- rbind(trainLabels, testLabels)
fullSubjects <- rbind(trainSubjects, testSubjects)


# Step 2
# Extracts only the measurements on the mean and standard deviation for each measurement

featureNames <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors = F)
meanStdDevIndices <- featureNames[grep('(mean|std)\\(', featureNames$V2, 'r'), 1]
meanStdDevData <- select(fullData, meanStdDevIndices)


# Step 3
# - Uses descriptive activity names to name the activities in the data set
# - Bind activity and subject information to the data

activities <- read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors = F)
actNames <- sapply(fullLabels, function(i) { activities[i, 2] })
DF <- cbind(fullSubjects, actNames, meanStdDevData)


# Step 4
# Label the data set with descriptive variable names

# hyphen and parenthesis are illegal in variable names and must be removed
RepairName <- function(name) {
  name <- str_replace(name, 'mean\\(\\)', 'Mean')
  name <- str_replace(name, 'std\\(\\)', 'Std')
  name <- str_replace(name, '^t', 'time')
  name <- str_replace(name, '^f', 'freq')
  name <- str_replace_all(name, '\\-', '')
  name <- str_replace_all(name, '([A-Z])', '.\\1') # convert from camelCase 
  tolower(name)                                    # to not.camel.case
}
features <- sapply(featureNames[meanStdDevIndices, 2], RepairName)
names(DF) <- c("subject", "activity", features)


# Step 5
# Create tidy data set with the average of each variable for each activity and each subject
# Each variable does already form a column, so no further re-arrange action required
grp <- group_by(DF, subject, activity)
tidyDF <- summarise_each(grp, funs(mean))

write.table(tidyDF, file="tidyDF.txt", row.name=FALSE)
