## Data download and unzip 

# string variables for file download
fileName <- "Data.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

# To verify the download.  If file does not exist, download to the current working directory.
if(!file.exists(fileName)){
    download.file(url,fileName, mode = "wb") 
}

# To verify the file unzip process.  If the directory (produced after unzip) does not 
# exist, unzip the downloaded file.
if(!file.exists(dir)){
    unzip("Data.zip", files = NULL, exdir=".")
}


## Read Data from the file
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  


## Analysis
# 1. Merges the training and the test sets to create one data set.
# the final produced data set: dataSet
dataSet <- rbind(X_train,X_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Create a vector of  mean and std, use the vector to subset.
MeanStd <- grep("mean|std|", features[, 2]) 
dataSet <- dataSet[,MeanStd]

# 4. Appropriately labels the data set with descriptive activity names.
# Create vector of "Sub..." feature names by getting rid of "()" apply to the dataSet to rename labels.
SubFeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(dataSet) <- SubFeatureNames[MeanStd]

# combine test and train of subject data and activity data, rename the lables
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'
activity <- rbind(y_train, y_test)
names(activity) <- 'activity'
# combine subject, activity, and mean and std  data set to create final data set.
dataSet <- cbind(subject,activity, dataSet)

# 3. Uses descriptive activity names to name the activities in the data set
# group the activity column of dataSet, re-name lable of levels with activity_levels, and apply it to dataSet.
activity_group <- factor(dataSet$activity)
levels(activity_group) <- activity_labels[,2]
dataSet$activity <- activity_group



# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# check if plyr  package is installed
if (!"plyr" %in% installed.packages()) {
    install.packages("dplyr")
}
library("plyr")
# split data by subject and activity and calculate the mean of each variable
data_average<- ddply(dataSet, c("subject","activity"), numcolwise(mean))

write.table(data_average, "tidy_data.txt", sep = ",",row.name=FALSE)
