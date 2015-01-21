library(dplyr)

# Step 0
# Download and unzip data if not already present

if(!file.exists('data')) { dir.create('data') }
if(!file.exists('data/UCI HAR Dataset')) {
        download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                      destfile = 'tmp.zip',
                      method = 'curl')
        unzip('tmp.zip', exdir = 'data')
        file.remove('tmp.zip')
}


# Step 1
# Create one data set from training and test data (ignore 'Inertial Signals' folder)
# (activity label and subject information will be added in step 3)

# trainData <- read.table('data/UCI HAR Dataset/train/X_train.txt')
# trainLabels <- read.table('data/UCI HAR Dataset/train/y_train.txt')
# trainSubjects <- read.table('data/UCI HAR Dataset/train/y_train.txt')
#
# testData <- read.table('data/UCI HAR Dataset/test/X_test.txt')
# testLabels <- read.table('data/UCI HAR Dataset/test/y_test.txt')
# testSubjects <- read.table('data/UCI HAR Dataset/test/y_test.txt')
#
# fullData <- rbind(trainData, testData)
# fullLabels <- rbind(trainLabels, testLabels)
# fullSubjects <- rbind(trainSubjects, testSubjects)


# Step 2
# Extracts only the measurements on the mean and standard deviation for each measurement

featureNames <- read.table('data/UCI HAR Dataset/features.txt', stringsAsFactors = F)
meanStdDevIndices <- featureNames[grep('(mean|std)\\(', featureNames$V2, 'r'), 1]
meanStdDevData <- select(fullData, meanStdDevIndices)


# Step 3
# - Uses descriptive activity names to name the activities in the data set
# - Bind activity and subject information to the data

activities <- read.table('data/UCI HAR Dataset/activity_labels.txt', stringsAsFactors = F)
actNames <- merge(x= fullLabels, y = activities)[2]
DF <- cbind(fullSubjects, actNames, meanStdDevData)


# Step 4
# Label the data set with descriptive variable names
names(DF) <- c("Subject", "Activity", featureNames[meanStdDevIndices, 2])


# Step 5
# Create tidy data set with the average of each variable for each activity and each subject
grp <- group_by(DF, Subject, Activity)
tidyDF <- summarise_each(grp, funs(mean))

write.table(tidyDF, file="tidyDF.txt")
