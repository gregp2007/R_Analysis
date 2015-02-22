-------------------------------------------------------------------------------------------------------------------------------------
Human Activity Recognition Using Smartphones (Summarized Dataset):SAMSUNGDATASETAVG
-------------------------------------------------------------------------------------------------------------------------------------
Written By: Greg Parks

-------------------------------------------------------------------------------------------------------------------------------------
Objective and Sumary:
-------------------------------------------------------------------------------------------------------------------------------------
The objective of this project was to produce a tidy data set with the average of each variable for each activity and each subject that could be used later for further analysis. This entailed producing a summarized data set from the existing data set files.

To ensure the variable names were properly descriptive the prefix "Avg" was appended to the beginning of each descriptive variable to avoid any confusion when viewing the data. The variables and data descriptions will be described in more detail in the Code Book.

The data from this project is from experiments performed using a Samsung Smartphone where subjects performed 6 different activities (Walking, Walking Upstairs, Walking Downstairs, Sitting. Standing, and Laying). There were 30 volunteers who performed all activities, 70% of the volunteers (21 volunteers) were in the training group and 30% of the volunteers (9 volunteers) were in the test group.

Measurements were recorded for 561 different variables, for the purpose of this summarized dataset we were asked to only use the mean and std variables. 

######I identified 79 variables that met this critera, I determined that the mean for the angle features did not fall into the Time and Frequency measurement variables so these were excluded from our summarized data set.



The tidy data set called SamsungDataSetAVg was produced, and was produced in a wide format. I preferred the layout of this format rather than the deep format. This tidy set (SamsungDataSetAvg) variables have been averaged in the Code Book you will see the variables begin with "Avg" since these are averages of the mean observations for the subject and activity combinations. This produces one observation for every subject, activity, and variable.

There are a total of 180 observations in the SamsungDataSetAvg with 83 variables. Of these 79 are the measurement variables.

--------------------------------------------------------------------------------------------------------------------------------------

The Script:
--------------------------------------------------------------------------------------------------------------------------------------

The data was downloaded in a form of a .zip file and a directory was created (SamsungData). The UCI_HAR_DataSet.zip file was then manually unzipped into it's natural folder UCI HAR Dataset so that it could be ready to be read into R. The working directory was set to ensure data could be read.

######The folder contained various files that needed to be combined together to form one complete data set. The files are as follows:

subject_train.txt- The subjects that participated in the train group for each observation (7352 observations, 1 variables)
x_train.txt- All measurement observations  for activities performed by subjects in the train group (7352 observations, 561 variables)
y_train.txt- Activities for each observation that subjects performed in the train group (7352 observations, 1 variable)

subject_test.txt- The subjects that participated in the test group for each observation (2947 observations, 1 variables)
x_test.txt- All measurement observations for activities performed by subjects in test group (2947 observations, 561 variables)
y_test.txt- Activities for each observation that subjects performed in the test group (2947 observations, 1 variable)

activity_labels.txt - the activity descriptors that would be associated to the y files

features.txt-The 561 variable descriptions in the x files

--------------------------------------------------------------------------------------------------------------------------------------

 Script Steps:
--------------------------------------------------------------------------------------------------------------------------------------
 You will notice a number of functions such as dim(), head(). str(), View() after each step in the script. 
 This allows for validation at each step to ensure data integrity.
 Also other functions were performed such as checking for sums to ensure data was as expected as I progressed through the steps.
 
 I made the decision to combine the test and train files using the rbind function.

####Step 1: 

Read in the train_x.txt file and view the data and save to a trainX. Validate and review the data

####Step 2:

Read in the test_x.txt file and view the data and save to testX. Validate and review the data

####Step 3: 

Combine the trainX and testX files into one dataset using the rbind function, 
It is important to view the results and ensure it meets the expectations of number of variables and observations. 
Also all future rbind combinations of train and test data will need to be combined in the same order. 
Saved this result to trainX_testX.

####Step 4: 

Read in the features.txt file and save to features.Validate the names and review for uniqueness.

####Step 5: 

Extract only the features names from the features files and save this into a vector featuresNames so that we can
append to the trainX_testX. Validate the names to ensure the correct number of variables are as expected.

####Step 6: 

This step will entail appending the features names (561 variable names) to the trainX_testX table, Prior to doing
this, I save the current trainX_testX to a new data.frame called trainX_testXMod. This will allow for validation to ensure
the data is as expected from the original trainX_testX table. After this is complete I append the featureNames to the 
trainX_testXMod table. It is important to validate the data at this time as well to ensure data is as expected. 
We have appended the names earlier in the project since it will be very helpful as we move forward and need to identify 
the variables that we will need to limit to

####Step 7: 

Read in the train_y.txt file of the activity types performed for each observation. Validate and view the data,
Save in trainY.

####Step 8: 

Read in the test_y.txt file of the activity types performed for each observation. Validate and view the data,
Save in testY.

####Step 9: 

Combine the trainY and testY datasets into one dataset using the rbind function and save into trainY_testY.
Validate the data to ensure it meets expectations.

####Step 10: 

Rename the column name in the trainY_testY dataset to ActivtyCode and validate

####Step 11: 

Read in the subject_train.txt file and validate and view the data. 
Save as subject_train.

####Step 12: 

Add a new column to the subject_train dataset called SubjectGroup, assign a value of "Training".
This will allow for easier identification of which group the subject belonged to and may assist with
further analysis between the two groups.


####Step 13: 

Read in the subject_test.txt file and validate and view the data. 
Save as subject_test.

####Step 14: 

Add a new column to the subject_test dataset called SubjectGroup, assign a value of "Testing".
This will allow for easier identification of which group the subject belonged to and may assist with
further analysis between the two groups.

####Step 15: 

Combine subjects from subject_train and subject_test into one file with the rbind function
save as subjects. Validate for expected variables and observations.

####Step 16: 

Add columns headers to the subjects dataset Subject and SubjectGroup. Validate to ensure data is as expected.

####Step 17: 

Combine the subjects and trainY_testY (activity observations) into one dataset using the cbind command. Validate that
the data combined as expected. Save as subjects_activity.

####Step 18: 

Combine the subjects_activity withe the trainX_testxMod (measurements of 561 variables) using the cbind command.
Validate to ensure data is as expected. Save as SamsungData.

####Step 19: 

Read in the activity_labels.txt file and save as activity_labels.

####Step 20: 

Name the activity_labels dataset column headers to Activity Code and ActivityDesc

####Step 21: 

Merge the activity_labels dataset with SamsungData dataset. This will merge on ActivtyCode=ActivityCode.
Since we have already combined all data and the last step is to append the activity labels to this dataset we will be OK
even though the dataset will become re-arranged due to the merge. It is important to validate the outcome to ensure the data
is as expected and matches previous observations. Save as SamsungDataAll.

####Step 22: 

We will load the library with the dplyr package so we can select the mean and std variables

####Step 23: 

Extract the mean and std variables through the select from the dplyr package, we will select all variables that contain mean and std but will exclude the angle variables. Save this as SamsungDataSet.

####Step 24: 

We will now extract the names of the variables we just selected and put them into a vector called FeaturesNamesMod. 
We are extracting for the purpose of renaming these to more descriptive names.

####Step 25: 

We will now run the FeatureNamedMod dataset through a series of gsub functions to find and replace portions of names that will make it more descriptive. f now will become Freq (short for Frequency), t will become Time, Acc will become Accel (short for accelerometer). Corrections will be made to incorrect feature names, from BodyBody to Body. Also "-" will be removed and "()" will be removed.This will be done in a Camel Case format to make for easier reading. The descriptive names will be more intuitive. These will be updated and saved back to FeaturesNamesMod.

####Step 26: 

The FeaturesNamesMod after cleansing will now be appended to the SamsungDataSet through the colnames function.

Ensure that the library for dplyr package is still loaded.

####Step 27: 

We will now write a dplyr chain which groups by Activity Code, Activity Desc, Subject and Subject Group. 
We then will chain this with the summarize function and will perform a mean function on each variable. 
I am renaming these variables with "Avg" pre=pended to the descriptive variable name. This will ensure that anyone viewing this data
will understand it is an average of this variable, Validate and view the data to ensure it meets expectations.


####Step 28 : 

A tidy data set has now been produced and it is time to write this data to the working directory. use the write.table command, name the output file SamsungDataSetAvg.txt and set the row,name to FALSE.

####Step 29: 

Read and view the file that was exported, through R to ensure the output is as expected,



