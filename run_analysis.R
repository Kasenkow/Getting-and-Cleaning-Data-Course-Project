rm(list = ls(all = TRUE)); gc()
sessionInfo()
# R version 3.6.0 (2019-04-26)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 17134)
# dplyr_0.8.1
# data.table_1.12.2

### loading required packages and setting options: 
library(dplyr)
library(data.table)
options(stringsAsFactors = FALSE)

### downloading and extracting files:
url <- paste0("https://d396qusza40orc.cloudfront.net/",
              "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
download.file(url, "dataset.zip")
unzip("dataset.zip")

### changing working directory:
setwd("UCI HAR Dataset/")

### Reading files...

# ... features' labels:
features <- read.table("features.txt")[[2]]
# since we don't need the whole dataset:
inds <- grep("-mean(\\())|-std(\\())", features)
# ... subjects' ids for training set:
subjects_train <- read.table("train/subject_train.txt")
# ... subjects' ids for testing set:
subjects_test <- read.table("test/subject_test.txt")
# ... training set:
X_train <- fread("train/X_train.txt", select = inds)
# ... testing set:
X_test <- fread("test/X_test.txt", select = inds)
# ... target feature values for training set:
y_train <- read.table("train/y_train.txt")
# ... target feature values for testing set:
y_test <- read.table("test/y_test.txt")
# ... target feature labels:
activity_labels <- read.table("activity_labels.txt")


### Steps 1 through 4:
# 1. Merging the training and the test sets to create one data set,
# 2. Extracting only the measurements on the mean and standard deviation
# for each measurement,
# 3. Assigning descriptive activity names to name the activities
# in the data set,
# 4. Appropriately labeling the data set with descriptive variable names

dataset1 <- rbind(cbind(subjects_train, X_train, y_train),
                  cbind(subjects_test, X_test, y_test)) %>%
        `colnames<-`(c("subject", features[inds], "activity")) %>%
        mutate(activity = factor(activity,
                                 levels = activity_labels[[1]],
                                 labels = activity_labels[[2]])) %>%
        arrange(subject)

### 5. Creating independent tidy data set with the average of each
### variable for each activity and each subject:
dataset2 <- dataset1 %>%
        group_by(activity, subject) %>%
        summarise_all(list(~mean(.)))

### 6. Writing datasets:
write.table(dataset1, "dataset1.txt", row.names = FALSE)
write.table(dataset2, "dataset2.txt", row.names = FALSE)
