#Datasets Description

After processing the input files as instructed, the script produces two datasets: TidyDataSet and MeansTidyDataSet.

##TidyDataSet

The TidyDataSet is the dataset that results of combining and cleaning up the initial datasets. It consists of the rows found in both training and test datasets, with the "Subject" and "Activity"
fields added, and with the columns filtered so that only those indicating a mean or a standard deviation are shown. The data in the "Activity" column was further worked to display a textual 
description of the activity instead of just a numeric label.

##MeansTidyDataSet

The MeansTidyDataSet is a further consolidation of the TidyDataSet. It consists of the summarization through the mean of the TidyDataSet by the "Subject" and "Activity" columns.

#Variables Description

*Subject: ID of the person who performed the test. Values range from 1 to 6.

*Activity: Activity that the subject doing the test performed. There are 6 possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

*In addition, the following 79 variables were used from the orignal dataset, and they represent the Mean and Standard Deviation of the original tests mesurements.

	tBodyAcc_mean___X; tBodyAcc_mean___Y; tBodyAcc_mean___Z; tBodyAcc_std___X; tBodyAcc_std___Y; tBodyAcc_std___Z; tGravityAcc_mean___X; tGravityAcc_mean___Y; tGravityAcc_mean___Z; 
	tGravityAcc_std___X; tGravityAcc_std___Y; tGravityAcc_std___Z; tBodyAccJerk_mean___X; tBodyAccJerk_mean___Y; tBodyAccJerk_mean___Z; tBodyAccJerk_std___X; tBodyAccJerk_std___Y; 
	tBodyAccJerk_std___Z; tBodyGyro_mean___X; tBodyGyro_mean___Y; tBodyGyro_mean___Z; tBodyGyro_std___X; tBodyGyro_std___Y; tBodyGyro_std___Z; tBodyGyroJerk_mean___X; 
	tBodyGyroJerk_mean___Y; tBodyGyroJerk_mean___Z; tBodyGyroJerk_std___X; tBodyGyroJerk_std___Y; tBodyGyroJerk_std___Z; tBodyAccMag_mean__; tBodyAccMag_std__; tGravityAccMag_mean__; 
	tGravityAccMag_std__; tBodyAccJerkMag_mean__; tBodyAccJerkMag_std__; tBodyGyroMag_mean__; tBodyGyroMag_std__; tBodyGyroJerkMag_mean__; tBodyGyroJerkMag_std__; fBodyAcc_mean___X; 
	fBodyAcc_mean___Y; fBodyAcc_mean___Z; fBodyAcc_std___X; fBodyAcc_std___Y; fBodyAcc_std___Z; fBodyAcc_meanFreq___X; fBodyAcc_meanFreq___Y; fBodyAcc_meanFreq___Z; fBodyAccJerk_mean___X; 
	fBodyAccJerk_mean___Y; fBodyAccJerk_mean___Z; fBodyAccJerk_std___X; fBodyAccJerk_std___Y; fBodyAccJerk_std___Z; fBodyAccJerk_meanFreq___X; fBodyAccJerk_meanFreq___Y; 
	fBodyAccJerk_meanFreq___Z; fBodyGyro_mean___X; fBodyGyro_mean___Y; fBodyGyro_mean___Z; fBodyGyro_std___X; fBodyGyro_std___Y; fBodyGyro_std___Z; fBodyGyro_meanFreq___X; 
	fBodyGyro_meanFreq___Y; fBodyGyro_meanFreq___Z; fBodyAccMag_mean__; fBodyAccMag_std__; fBodyAccMag_meanFreq__; fBodyBodyAccJerkMag_mean__; fBodyBodyAccJerkMag_std__; 
	fBodyBodyAccJerkMag_meanFreq__; fBodyBodyGyroMag_mean__; fBodyBodyGyroMag_std__; fBodyBodyGyroMag_meanFreq__; fBodyBodyGyroJerkMag_mean__; fBodyBodyGyroJerkMag_std__; 
	fBodyBodyGyroJerkMag_meanFreq__

#Work Performed to Process the Data

The following steps were followed to process the data:

01: Use Notepad++ to remove numeric ID from features.txt and leave only the text description for ease of import.

02: Load global data (libraries to be used and common data like features and activity labels).

03: Load training data (load data from y_train.txt, subject_train.txt and x_train.txt files).

04: Load test data (load data from y_test.txt, subject_test.txt and x_train.txt files).

05: Assign column names to the "x" data sets based on the features data imported in step 02.

06: Consolidate test data set (consolidate the dataset created in step 04 into a single "test" dataset).

07: Consolidate training data set (consolidate the dataset created in step 03 into a single "training dataset).

08: Consolidate both data sets (unite the data from the "test" and the "training" dataset into a single dataset).

09: Subset the consolidated dataset based on columns (remove any column that doesn't pertain to a mean or standard deviation, excluding the subject and activity columns).

10: Replace Activity labels for descriptive text & create the first tidy dataset (make sure that each row has a descriptive text value in the "Activity" column).

11: Create second tidy dataset (calculate the mean for all variable fields pivoting on the "Subject" and "Activity" fields.

12: Write datasets to the respective text file (TidyDataSet.txt and MeansTidyDataSet.txt).


#Signature
Diego Alfaro Bergueiro
San Jose, Costa Rica
July 26th, 2014
