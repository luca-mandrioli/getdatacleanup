#setwd("~/Downloads/project")
library(reshape2)

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c('ID', 'label'))
# part 4: renaming the subject column
names(subject) <- "Subject"
features <- read.table("UCI HAR Dataset/features.txt", col.names = c('ID', 'feature'))

# part 1: loading x, y and subject data. Merging test with train data
x <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), 
           read.table("UCI HAR Dataset/test/X_test.txt"))
y <- rbind(read.table("UCI HAR Dataset/train/Y_train.txt"), 
           read.table("UCI HAR Dataset/test/Y_test.txt"))
subject <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), 
                 read.table("UCI HAR Dataset/test/subject_test.txt"))
# part 2: grepping only mean and standard deviation features. Creating a new x table with the extraction
grepped <- grep("mean|std", features$feature)
featureNames <- features[grepped, 2]
xExtract <- x[, grepped]
names(xExtract) <- featureNames
# part 3: creating a new y table with the labels rather than the IDs specified in the activity label file 
yExtract <- y
names(yExtract) <- "ActivityLabel"
yExtract$ActivityLabel <- activityLabels[y$V1, 2]
# part 4 continue: merging all subject, y and x data
dataset <- cbind(subject, yExtract, xExtract)
write.table(dataset, "dataset_cleanead_up.txt")
#part 5: creating a copy of the data set, grouping all the Xs by subject and activity label; then applying the mean to each X grouped by each subject and variable
datasetCopy <- dataset
datasetCopy <- melt(datasetCopy, id.vars = c("Subject", "ActivityLabel"))
datasetCopy <- dcast(datasetCopy, Subject+ActivityLabel ~ variable, fun.aggregate = mean)
write.table(datasetCopy, "dataset_summarised.txt")
write.table(datasetCopy, "dataset_summarised_no_header.txt", row.name = FALSE)
