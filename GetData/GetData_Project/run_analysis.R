## Check if data set file is in working directory, if not, stop script
if (file.exists("./UCI_HAR_Dataset")) {
 
 ## Check if package dplyr is installed, if not, install it   
if(!require(dplyr)) {
	print("dplyr Package is required, script will install Package")
    install.packages("dplyr")
    library(dplyr)
}

###################################################################################################
## Step 1: Merge the train and test dataset
###################################################################################################

## Read Activity Table
activities <- read.table("./UCI_HAR_Dataset/activity_labels.txt", header = FALSE, col.names=c("activitycode", "activity"), stringsAsFactors = FALSE)
## Read Features into a vector
features <- read.table("./UCI_HAR_Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
features <- features[,2]

## Read Test Data
test_subject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", header = FALSE, col.names=c("subjectcode"), stringsAsFactors = FALSE)
test_activities <- read.table("./UCI_HAR_Dataset/test/y_test.txt", header = FALSE, col.names=c("activitycode"), stringsAsFactors = FALSE)
test_data <- read.table("./UCI_HAR_Dataset/test/X_test.txt", header = FALSE,  fill = TRUE, stringsAsFactors = FALSE)
## Add names to data frame
names(test_data) <- features
## Combine Test Data
test_data <- cbind(test_subject, test_activities, test_data)
rm(test_subject, test_activities)

## Read Train Data
train_subject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", header = FALSE, col.names=c("subjectcode"), stringsAsFactors = FALSE)
train_activities <- read.table("./UCI_HAR_Dataset/train/y_train.txt", header = FALSE, col.names=c("activitycode"), stringsAsFactors = FALSE)
train_data <- read.table("./UCI_HAR_Dataset/train/X_train.txt", header = FALSE,  fill = TRUE, stringsAsFactors = FALSE)
## Add names to data frame
names(train_data) <- features
rm(features)
## Combine Train Data
train_data <- cbind(train_subject, train_activities, train_data)
rm(train_subject, train_activities)

## Combine all Data
data <- rbind(test_data, train_data)
rm(test_data, train_data)

###################################################################################################
# Step 2: Extract only the measurements on the mean and standard deviation
###################################################################################################

## Select only Mean and Standard Deviation Variables, not included meanFreq() and angle() with mean variables
data <- data[,c(1:2, grep("mean\\(\\)|std\\(\\)", names(data)))]


###################################################################################################
# Step 3: Add descriptive activity names for each activity
###################################################################################################

## Replace activity code with activity name
activities[,2] <- tolower(gsub("_", "", activities[,2]))
for (i in 1:nrow(activities)) {data$activitycode <- gsub(activities[[1]][i], activities[[2]][i], data$activitycode)}
names(data)[2] <- "activity"
data$activity <- as.factor(data$activity)
rm(activities, i)

###################################################################################################
# Step 4: Label the data set with descriptive variable names
###################################################################################################


## Rename Variables Names
for (i in 3:ncol(data)) {
	names(data)[i] <- gsub("\\-", "" ,names(data)[i])
	names(data)[i] <- gsub("^t", "TimeDomain" ,names(data)[i])
	names(data)[i] <- gsub("^f", "FrequencyDomain" ,names(data)[i])
	names(data)[i] <- gsub("BodyBody", "Body" ,names(data)[i])
	names(data)[i] <- gsub("Acc", "Accelerometer" ,names(data)[i])
	names(data)[i] <- gsub("Gyro", "Gyroscope" ,names(data)[i])
	names(data)[i] <- gsub("Mag", "Magnitud" ,names(data)[i])
	names(data)[i] <- gsub("X", "xAxis" ,names(data)[i])
	names(data)[i] <- gsub("Y", "yAxis" ,names(data)[i])
	names(data)[i] <- gsub("Z", "zAxis" ,names(data)[i])
    names(data)[i] <- gsub("mean\\(\\)", "Mean" ,names(data)[i])
    names(data)[i] <- gsub("std\\(\\)", "StandardDeviation" ,names(data)[i])
}

###################################################################################################
# Step 5:  Creates a second, independent tidy dataset with the mean of each variable by each activity and subject
###################################################################################################

## Use the dplyr package to group the data and turn into a tidy data set that summerizes the mean of the measurements by subject and activity
data <- tbl_df(data)
data <- group_by(data, subjectcode, activity)
table <- summarise_each(data, funs(mean))

## Write tidy data into a file
write.table(table, file="tidydataset.txt", row.names = FALSE)

} stop("UCI_HAR_Dataset not in working directory, please download from the following URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip or rename to UCI_HAR_Dataset")

