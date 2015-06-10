# This is the script for the course project of Getting and Cleaning Data
# This script does the 5 steps as follows

# 1. Merges the training and test sets to create one data set
xtrain <- read.table("UCI HAR Dataset/train//X_train.txt")
xtest <- read.table("UCI HAR Dataset/test//X_test.txt")
x <- rbind(xtrain, xtest)

ytrain <- read.table("UCI HAR Dataset/train//y_train.txt")
ytest <- read.table("UCI HAR Dataset/test//y_test.txt")
y <- rbind(ytrain, ytest)

strain <- read.table("UCI HAR Dataset/train//subject_train.txt")
stest <- read.table("UCI HAR Dataset/test//subject_test.txt")
s <- rbind(strain, stest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset//features.txt")
required_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x <- x[, required_features]
names(x) <- features[required_features, 2]
names(x) <- gsub("\\(|\\)", "", names(x))
names(x) <- tolower(names(x))

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- gsub("_", "", tolower(activities[, 2]))
y[, 1] = activities[y[, 1], 2]
names(y) <- "activity"

# 4. Appropriately labels the data set with descriptive names
names(s) <- "subject"
cleaned_set <- cbind(s, y, x)

# write the tidy data into an external file
write.table(cleaned_set, "tidy_data.txt")

# 5. Creates a 2nd, independant tidy data set with the average of each variable for each activity and each subject
subjects <- unique(s)[, 1]
num_subjects <- length(subjects)
num_activities <- length(activities[, 1])
num_cols <- dim(cleaned_set)[2]
result <- cleaned_set[1:(num_subjects*num_activities),]

r = 1
for (s in 1:num_subjects) {
  for (a in 1:num_activities) {
    result[r, 1] = subjects[s]
    result[r, 2] = activities[a, 2]
    temp <- cleaned_set[cleaned_set$subject==s & cleaned_set$activity==activities[a, 2],]
    result[r, 3:num_cols] <- colMeans(temp[, 3:num_cols])
    r = r+1
  }
}

# write the new tidy set into qnother external file
write.table(result, "tidy_data_average.txt")