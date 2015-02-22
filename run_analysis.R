##Download data and Create Directory to store files in for easy identification

if (!file.exists("./SamsungData")){
        dir.create("./SamsungData")
}
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="./SamsungData/getdata_projectfiles_UCI_HAR_Dataset.zip", mode="wb")

##Manually Unzipped Data in UCI HAR DATASET folder after downloading prior to reading in text files from their appropriate locations##

##Step 1: Read in train_x file and analyze the dimensions, names, and  view data
trainX<-read.table("./UCI HAR Dataset/train/x_train.txt",sep="",header=FALSE)
dim(trainX)
names(trainX)
head(trainX)
str(trainX)
View(trainX)

##Step 2: Read in test_x file and analyze the dimensions, names, and  view data
testX<-read.table("./UCI HAR Dataset/test/x_test.txt",sep="",header=FALSE)
dim(testX)
names(testX)
str(testX)
View(testX)

##Step 3: Combine the train_x and test_x data into one dataset. Validate data and ensure that number of rows and observations are as expected
trainX_testX<-rbind(trainX,testX)
dim(trainX_testX)
head(trainX_testX)
str(trainX_testX)
View(trainX_testX)

##Step 4: read in features file for column label descriptors for trainX and testX files. Validate that names are unique
features<-read.table("./UCI HAR Dataset/features.txt",sep="",header=FALSE)
dim(features)
unique(features)
#Step 5: Extract the names only from this file for the purpose of appending to the trainX_testX table.
featuresNames<-features[,2]
str(featuresNames)
View(featuresNames)

##Step 6: Append Column feature names to trainX_testX file, 
##Create new trainX_testXMod dataframe to validate against original trainX_testX set to validate for data integrity
trainX_testXMod<-data.frame(trainX_testX)
colnames(trainX_testXMod)<-featuresNames
head(trainX_testXMod)
str(trainX_testXMod)
View(trainX_testXMod)

##Step 7: Read in train_y file (activity_types associated to each observaton in the train_x file) and view data. 
##Validate number of dims and observations
trainY<-read.table("./UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)
dim(trainY)
head(trainY)
str(trainY)
names(trainY)
View(trainY)

##Step 8: Read in test_y file (activity_types associated to each observation in the train_y file) and view data. 
##Validate number of dims and observations
testY<-read.table("./UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)
dim(testY)
str(testY)
names(testY)
View(testY)

##Step 9: Combine the train_y and test_y data (activity_type oberservations)into one dataset
trainY_testY<-rbind(trainY,testY)
dim(trainY_testY)
str(trainY_testY)
head(trainY_testY)

##Step 10: Rename the Column to ActivtyCode
colnames(trainY_testY)<-"ActivityCode"
head(trainY_testY)

#Step 11: Read in Subjects in train group
##Analyze and view the data and dim, Add a SubjectGroup for further grouping later
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)
head(subject_train)
str(subject_train)

##Step 12: Add a new column to identify which SubjectGroup the subject belongs to
subject_train<-data.frame(subject_train,SubjectGroup="Training")
head(subject_train)
str(subject_train)
dim(subject_train)



#Step 13: Read in Subjects in test group
##Analyze and view the data and dim, Add a SubjectGroup for further grouping later
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE)
head(subject_test)
str(subject_test)

##Step 14: Add a new column to identify which SubjectGroup the subject belongs to
subject_test<-data.frame(subject_test,SubjectGroup="Testing")
head(subject_test)
str(subject_test)
dim(subject_test)



##Step 15: Combine subjects from train and test into one group, vaidate for expected number of variables and observations. 
##Ensure combined in same order
subjects<-rbind(subject_train,subject_test)
dim(subjects)

## Step 16: Add Column headers
colnames(subjects)<-c("Subject","SubjectGroup")
head(subjects)
tail(subjects)

subjects[subjects$SubjectGroup=="Training",1]
nrow(subjects[subjects$SubjectGroup=="Training",])

subjects[subjects$SubjectGroup=="Testing",1]
nrow(subjects[subjects$SubjectGroup=="Testing",])

View(subjects)

##step 17: Combine subjects and activity data sets together. 
##Validate that the data combines as expected

subjects_activity<-cbind(trainY_testY,subjects)
head(subjects_activity)
tail(subjects_activity)

subjects_activity[subjects_activity$SubjectGroup=="Training",2]
nrow(subjects_activity[subjects_activity$SubjectGroup=="Training",])

subjects_activity[subjects_activity$SubjectGroup=="Testing",2]
nrow(subjects_activity[subjects_activity$SubjectGroup=="Testing",])

View(subjects_activity)



##Step 18: Combine subjects_activity with 561 variables and observations from trainX_testXMod table
##Validate that data combined properly

SamsungData<-cbind(subjects_activity,trainX_testXMod)
head(SamsungData)
str(SamsungData)
dim(SamsungData)
View(SamsungData)




#Step 19: Read in Activity descriptors from activity_labels
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)

##Step 20: Label the column headers
colnames(activity_labels)<-c("ActivityCode","ActivityDesc")
head(activity_labels)
dim(activity_labels)
str(activity_labels)

##Step 21: Append Activity row Labels to SamsungData through a merge.
## Important doing this in the final step since data will be rearranged after merge
##Validate that data combined as expected. 

SamsungDataAll<-merge(activity_labels,SamsungData, by.x="ActivityCode", by.y="ActivityCode",all=TRUE)
head(SamsungDataAll,2)
str(SamsungDataAll)
View(SamsungDataAll)


## Step 22: Load library for dplyr, select only mean and std variables, exclude the angle

View(featuresNames)
library(dplyr)

##Step 23: Extract mean and std measurement columns only.

SamsungDataSet<-select(SamsungDataAll,ActivityCode,ActivityDesc,Subject,SubjectGroup,contains("mean"),contains("std"),-contains("angle"))

View(SamsungDataSet)
names(SamsungDataSet)

##Step 24: Capture the column names from this new set of data for the purposes of renaming with more descriptive named
FeatureNamesMod<-names(SamsungDataSet)

##Step 25: Use the gsub function to rename some incorrectly named features (i.e BodyBody when it should be Body )
##as well as naming with more descriptive names
FeatureNamesMod=gsub("BodyBody","Body",FeatureNamesMod)
FeatureNamesMod=gsub("Acc","Accel",FeatureNamesMod)
FeatureNamesMod=gsub("tBody","TimeBody",FeatureNamesMod)
FeatureNamesMod=gsub("fBody","FreqBody",FeatureNamesMod)
FeatureNamesMod=gsub("tGravity","TimeGravity",FeatureNamesMod)
FeatureNamesMod=gsub("-mean()","Mean",FeatureNamesMod)
FeatureNamesMod=gsub("-std()","Std",FeatureNamesMod)
FeatureNamesMod=gsub("-z","Z",FeatureNamesMod)
FeatureNamesMod=gsub("-y","Y",FeatureNamesMod)
FeatureNamesMod=gsub("-x","X",FeatureNamesMod)
FeatureNamesMod=gsub("-","",FeatureNamesMod)
FeatureNamesMod=gsub( ")" ,"",FeatureNamesMod)
FeatureNamesMod=gsub( "\\(" ,"",FeatureNamesMod)

View(FeatureNamesMod)

##Step 26: Append the new descriptive names to the SamsungDataSet, And Validate for the expected outcome
colnames(SamsungDataSet)<-FeatureNamesMod
View(SamsungDataSet)

##Ensure that dplyr is loaded

library(dplyr)


##Step 27: Group By The subjects and Activiies to summarize the measurements of the subject and activity combination
##Creating a set of tidy data
## The Column header descriptors were renamed to ensure the difference in viewing the raw data and summarized data

SamsungDataSetAvg<-group_by(SamsungDataSet,ActivityCode, ActivityDesc,Subject,SubjectGroup)%>%
                 summarize(
                 AvgTimeBodyAccelMeanX = mean(TimeBodyAccelMeanX),
                 AvgTimeBodyAccelMeanY = mean(TimeBodyAccelMeanY),
                 AvgTimeBodyAccelMeanZ = mean(TimeBodyAccelMeanZ),
                 AvgTimeGravityAccelMeanX = mean(TimeGravityAccelMeanX),
                 AvgTimeGravityAccelMeanY = mean(TimeGravityAccelMeanY),
                 AvgTimeGravityAccelMeanZ = mean(TimeGravityAccelMeanZ),
                 AvgTimeBodyAccelJerkMeanX = mean(TimeBodyAccelJerkMeanX),
                 AvgTimeBodyAccelJerkMeanY = mean(TimeBodyAccelJerkMeanY),
                 AvgTimeBodyAccelJerkMeanZ = mean(TimeBodyAccelJerkMeanZ),
                 AvgTimeBodyGyroMeanX = mean(TimeBodyGyroMeanX),
                 AvgTimeBodyGyroMeanY = mean(TimeBodyGyroMeanY),
                 AvgTimeBodyGyroMeanZ = mean(TimeBodyGyroMeanZ),
                 AvgTimeBodyGyroJerkMeanX = mean(TimeBodyGyroJerkMeanX),
                 AvgTimeBodyGyroJerkMeanY = mean(TimeBodyGyroJerkMeanY),
                 AvgTimeBodyGyroJerkMeanZ = mean(TimeBodyGyroJerkMeanZ),
                 AvgTimeBodyAccelMagMean = mean(TimeBodyAccelMagMean),
                 AvgTimeGravityAccelMagMean = mean(TimeGravityAccelMagMean),
                 AvgTimeBodyAccelJerkMagMean = mean(TimeBodyAccelJerkMagMean),
                 AvgTimeBodyGyroMagMean = mean(TimeBodyGyroMagMean),
                 AvgTimeBodyGyroJerkMagMean = mean(TimeBodyGyroJerkMagMean),
                 AvgFreqBodyAccelMeanX = mean(FreqBodyAccelMeanX),
                 AvgFreqBodyAccelMeanY = mean(FreqBodyAccelMeanY),
                 AvgFreqBodyAccelMeanZ = mean(FreqBodyAccelMeanZ),
                 AvgFreqBodyAccelMeanFreqX = mean(FreqBodyAccelMeanFreqX),
                 AvgFreqBodyAccelMeanFreqY = mean(FreqBodyAccelMeanFreqY),
                 AvgFreqBodyAccelMeanFreqZ = mean(FreqBodyAccelMeanFreqZ),
                 AvgFreqBodyAccelJerkMeanX = mean(FreqBodyAccelJerkMeanX),
                 AvgFreqBodyAccelJerkMeanY = mean(FreqBodyAccelJerkMeanY),
                 AvgFreqBodyAccelJerkMeanZ = mean(FreqBodyAccelJerkMeanZ),
                 AvgFreqBodyAccelJerkMeanFreqX = mean(FreqBodyAccelJerkMeanFreqX),
                 AvgFreqBodyAccelJerkMeanFreqY = mean(FreqBodyAccelJerkMeanFreqY),
                 AvgFreqBodyAccelJerkMeanFreqZ = mean(FreqBodyAccelJerkMeanFreqZ),
                 AvgFreqBodyGyroMeanX =	mean(FreqBodyGyroMeanX),
                 AvgFreqBodyGyroMeanY =	mean(FreqBodyGyroMeanY),
                 AvgFreqBodyGyroMeanZ =	mean(FreqBodyGyroMeanZ),
                 AvgFreqBodyGyroMeanFreqX = mean(FreqBodyGyroMeanFreqX),
                 AvgFreqBodyGyroMeanFreqY = mean(FreqBodyGyroMeanFreqY),
                 AvgFreqBodyGyroMeanFreqZ = mean(FreqBodyGyroMeanFreqZ),
                 AvgFreqBodyAccelMagMean = mean(FreqBodyAccelMagMean),
                 AvgFreqBodyAccelMagMeanFreq =	mean(FreqBodyAccelMagMeanFreq),
                 AvgFreqBodyAccelJerkMagMean = mean(FreqBodyAccelJerkMagMean),
                 AvgFreqBodyAccelJerkMagMeanFreq = mean(FreqBodyAccelJerkMagMeanFreq),
                 AvgFreqBodyGyroMagMean = mean(FreqBodyGyroMagMean),
                 AvgFreqBodyGyroMagMeanFreq = mean(FreqBodyGyroMagMeanFreq),
                 AvgFreqBodyGyroJerkMagMean = mean(FreqBodyGyroJerkMagMean),
                 AvgFreqBodyGyroJerkMagMeanFreq = mean(FreqBodyGyroJerkMagMeanFreq),
                 AvgTimeBodyAccelStdX =	mean(TimeBodyAccelStdX),
                 AvgTimeBodyAccelStdY = mean(TimeBodyAccelStdY),
                 AvgTimeBodyAccelStdZ =	mean(TimeBodyAccelStdZ),
                 AvgTimeGravityAccelStdX = mean(TimeGravityAccelStdX),
                 AvgTimeGravityAccelStdY = mean(TimeGravityAccelStdY),
                 AvgTimeGravityAccelStdZ = mean(TimeGravityAccelStdZ),
                 AvgTimeBodyAccelJerkStdX = mean(TimeBodyAccelJerkStdX),
                 AvgTimeBodyAccelJerkStdY = mean(TimeBodyAccelJerkStdY),
                 AvgTimeBodyAccelJerkStdZ = mean(TimeBodyAccelJerkStdZ),
                 AvgTimeBodyGyroStdX = mean(TimeBodyGyroStdX),
                 AvgTimeBodyGyroStdY = mean(TimeBodyGyroStdY),
                 AvgTimeBodyGyroStdZ =	mean(TimeBodyGyroStdZ),
                 AvgTimeBodyGyroJerkStdX = mean(TimeBodyGyroJerkStdX),
                 AvgTimeBodyGyroJerkStdY = mean(TimeBodyGyroJerkStdY),
                 AvgTimeBodyGyroJerkStdZ = mean(TimeBodyGyroJerkStdZ),
                 AvgTimeBodyAccelMagStd = mean(TimeBodyAccelMagStd),
                 AvgTimeGravityAccelMagStd = mean(TimeGravityAccelMagStd),
                 AvgTimeBodyAccelJerkMagStd = mean(TimeBodyAccelJerkMagStd),
                 AvgTimeBodyGyroMagStd = mean(TimeBodyGyroMagStd),
                 AvgTimeBodyGyroJerkMagStd = mean(TimeBodyGyroJerkMagStd),
                 AvgFreqBodyAccelStdX = mean(FreqBodyAccelStdX),
                 AvgFreqBodyAccelStdY = mean(FreqBodyAccelStdY),
                 AvgFreqBodyAccelStdZ = mean(FreqBodyAccelStdZ),
                 AvgFreqBodyAccelJerkStdX = mean(FreqBodyAccelJerkStdX),
                 AvgFreqBodyAccelJerkStdY = mean(FreqBodyAccelJerkStdY),
                 AvgFreqBodyAccelJerkStdZ = mean(FreqBodyAccelJerkStdZ),
                 AvgFreqBodyGyroStdX = mean(FreqBodyGyroStdX),
                 AvgFreqBodyGyroStdY = mean(FreqBodyGyroStdY),
                 AvgFreqBodyGyroStdZ =	mean(FreqBodyGyroStdZ),
                 AvgFreqBodyAccelMagStd = mean(FreqBodyAccelMagStd),
                 AvgFreqBodyAccelJerkMagStd = mean(FreqBodyAccelJerkMagStd),
                 AvgFreqBodyGyroMagStd = mean(FreqBodyGyroMagStd),
                 AvgFreqBodyGyroJerkMagStd = mean(FreqBodyGyroJerkMagStd))

head(SamsungDataSetAvg)
str(SamsungDataSetAvg)
View(SamsungDataSetAvg)

##Step 28: Now that the data is tidy it is ready for export. It will be exported as a .txt file
##into the working directory
write.table(SamsungDataSetAvg,file='SamsungDataSetAvg.txt',row.name=FALSE)

##Step 29: To ensure the data exported as expected we will read it back in and view.
View(read.table("./SamsungDataSetAvg.txt",sep="",header=TRUE))
