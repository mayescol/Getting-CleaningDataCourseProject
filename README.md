# Getting-CleaningDataCourseProject
This readme document describes step by step how to prepare and clean the dataset presented in the Course Project.

1. Set your working directory and make a data folder inside the working directory
2. Download file from url and unzip Datasets to folder named data
3. Read Datasets and store to its corresponding variable
4. Merge datasets by row, set names to variables using features.tx then merged the datasets by column and store to a new viriable 
5. Extracts only the measurements on the mean and standard deviation for each measurement
6. Read descriptive activity names from "activity_labels.txt" and use it to names the activities in the datasets
7. Appropriately labels the data set with the following descriptive names:
      * prefix t  is replaced by  time
      * Acc is replaced by Accelerometer
      * Gyro is replaced by Gyroscope
      * prefix f is replaced by frequency
      * Mag is replaced by Magnitude
      * BodyBody is replaced by Body
8. Create a new idependent data set with the average of each variable for each activity and each subject, using the aggregate function
9. Write the resulting data set into a .txt file name "tidydata.txt"
