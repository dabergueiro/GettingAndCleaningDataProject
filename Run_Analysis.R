#Note: Before executing script, remember to set the working directory to where the project data files were extracted
#Step 0: Use Notepad++ to remove numeric ID from features.txt and leave only the text description for ease of import

#Step 1: Load global data
library(sqldf)
library(data.table)
library(reshape2)
features <- read.table("features.txt")
ActivityLabels <- read.table("activity_labels.txt")

#Step 2: Load training data
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
x_train <- read.table("./train/X_train.txt", sep=" ")
#Step 2.5: Replace initial double spaces from file with single spaces using Notepat++
#lose first (empty) column
x_train <- x_train[,2:ncol(x_train)]

#Step 3: Load test data
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
x_test <- read.table("./test/X_test.txt", sep=" ")
#Step 3.5: Replace initial double spaces from file with single spaces using Notepat++
#lose first (empty) column
x_test <- x_test[,2:ncol(x_test)]

#Step 4: Assign column names to the x data sets
for (count in 1:nrow(features)) {
  colnames(x_train)[count] <- as.character(features[count,])
}
for (count in 1:nrow(features)) {
  colnames(x_test)[count] <- as.character(features[count,])
}

#Step 5: Consolidate test data set
consolidatedTest <- cbind(y_test, x_test)
colnames(consolidatedTest)[1] <- "Activity"
consolidatedTest <- cbind(subject_test, consolidatedTest)
colnames(consolidatedTest)[1] <- "Subject"

#Step 6: Consolidate training data set
consolidatedTrain <- cbind(y_train, x_train)
colnames(consolidatedTrain)[1] <- "Activity"
consolidatedTrain <- cbind(subject_train, consolidatedTrain)
colnames(consolidatedTrain)[1] <- "Subject"

#Step 7: Consolidate both data sets
consolidated <- sqldf("select * from consolidatedTest union select * from consolidatedTrain")

#Step 8: Subset dataset based on columns
PreTidyDataSet <- consolidated[grep("Subject|Activity|mean|std",names(consolidated))]

#Step 9: Replace Activity labels for descriptive text & create the first tidy dataset
TidyDataSet <- sqldf("select a.*, p.* from ActivityLabels a inner join PreTidyDataSet p on a.V1 = p.Activity")
TidyDataSet <- cbind(TidyDataSet[,3], TidyDataSet[,2], TidyDataSet[,5:ncol(TidyDataSet)])
colnames(TidyDataSet)[1:2] <- c("Subject","Activity")
View(TidyDataSet)

#Step 10: Create second tidy dataset
DataSetMelt <- melt(TidyDataSet, id=c("Subject","Activity"), measure.vars=colnames(consolidated[grep("mean|std",names(consolidated))]))
MeansTidyDataSet <- dcast(DataSetMelt, Subject + Activity ~ variable,mean)
View(MeansTidyDataSet)

#Step 11: Write Datasets
write.table(TidyDataSet, "TidyDataSet.txt", sep="\t")
write.table(MeansTidyDataSet, "MeansTidyDataSet.txt", sep="\t")