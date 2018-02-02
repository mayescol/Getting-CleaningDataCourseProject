#You should create one R script called run_analysis.R that does the following.

#1. Merges the training and the test sets to create one data set.

#1.a set working directory and download file from url and unzip to the folder named data
setwd("C:/datasciencecoursera/module3/Getting-CleaningDataCourseProject")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.create(data)
download.file(fileURL, destfile="data/UCI_HAR_Datasets.zip")
unzip(zipfile, exdir="data")
#1.b read Datasets and store to a variable
x.train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
x.test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

#1.c Merge datasets by row
x.merged <- rbind(x.train, x.test)
y.merged <- rbind(y.train, y.test)
subject.merged<- rbind(subject.train,subject.test)

#1.d Set names to variables
names(subject.merged)<-c("subject")
names(y.merged)<- c("activity")
features<- read.table("data/UCI HAR Dataset/features.txt")
names(x.merged)<- features$V2
#1.e Merge datasets by column 
merged.Data = cbind(x.merged,subject.merged,y.merged)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
subdatafeatures<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
selectedNames<-c(as.character(subdatafeatures), "subject", "activity" )
merged.Data<-subset(merged.Data,select=selectedNames)

#3. Uses descriptive activity names to name the activities in the data set

#3.a Read descriptive activity names from "activity_labels.txt" 
activityLabels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

#3.b.factorize Variable `activity` in  the data frame `Data` using  descriptive activity names
merged.Data$activity<- factor(merged.Data$activity,labels=as.character(activityLabels$V2))

#4. Appropriately labels the data set with descriptive variable names.
#- prefix t  is replaced by  time
#- Acc is replaced by Accelerometer
#- Gyro is replaced by Gyroscope
#- prefix f is replaced by frequency
#- Mag is replaced by Magnitude
#- BodyBody is replaced by Body

names(merged.Data)<-gsub("^t", "Time", names(merged.Data))
names(merged.Data)<-gsub("^f", "Frequency", names(merged.Data))
names(merged.Data)<-gsub("Acc", "Accelerometer", names(merged.Data))
names(merged.Data)<-gsub("Gyro", "Gyroscope", names(merged.Data))
names(merged.Data)<-gsub("Mag", "Magnitude", names(merged.Data))
names(merged.Data)<-gsub("BodyBody", "Body", names(merged.Data))

#5. From the data set in step 4,
#creates a second independent tidy data set 
#with the average of each variable for each activity and each subject.
library(plyr);
tidyData<-aggregate(. ~subject + activity, merged.Data, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)

