---
CODEBOOK-SAMSUNGDATASETAVG

-------------------------------------------------------------------------------------------------------------------------------------

This Code Book will describe the data and the variables.

####1.ActivtyCode 2.ActivityDesc

The activity Code associated to the ActivityDesc, The activities were performed by the subjects and measurements were
obtained and recorded with the associated activity.


#####ActivtityCode/ActivityDesc
1.WALKING
2.WALKING UPSTAIRS
3.WALKING DOWNSTAIRS
4.SITTING
5.STANDING
6.LAYING

####3.Subject

There were 30 subjects that participated in the experiment.
21 were in the Training Group and 9 were in the Test Group

Subjects were labeled 1-30.

The 21 subject numbers in the train group are (1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,28,30)
The 9 subject numbers in the test group are (2,4,9,10,12,13,18,20,24)

####4.SubjectGroup

This column was added and was not part of the original dataset.
This helps identify the subjects in the training and Test groups without having to perform a lookup.
The values are:

Training
Testing

###Measurement Variables

The following text is summarized from the features_intro.txt file from the original dataset. This is provided to put the variables in a more complete context since this was a scientific experiment. I included the original text from this summary since I do not think I would do it justice in paraphrasing. I have translated the raw variable names to the descriptive variable names. I have only included the variables that were associated to the mean and std deviation values we wished to use for our smaller data set.

t=Time and f=Frequency(Freq)

The features (measurement variables) selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Note: I have included the translation of the raw variable names to the more descriptive names.

######tBodyAcc-XYZ =          TimeBodyAccelX, TimeBodyAccelY, TimeBodyAccelZ
######tGravityAcc-XYZ =       TimeGravityAccelX, TimeGravityAccelY, TimeGravityAccelZ
######tBodyAccJerk-XYZ=       TimeBodyAccelJerkX, TimeBodyAccelJerkY, TimeBodyAccelJerkZ
######tBodyGyro-XYZ=          TimeBodyGyroX, TimeBodyGyroY, TimeBodyGyroZ
######tBodyGyroJerk-XYZ =     TimeBodyGyroJerkX, TimeBodyGyroJerkY, TimeBodyGyroJerkZ
######tBodyAccMag =           TimeBodyAccelMag          
######tGravityAccMag=         TimeGravityAccelMag
######tBodyAccJerkMag=        TimeBodyAccelJerkMag
######tBodyGyroMag=           TimeBodyGyroMag
######tBodyGyroJerkMag=       TimeBodyGyroJerkMag
######fBodyAcc-XYZ=           FreqBodyAccelX, FreqBodyAccelY, FreqBodyAccelZ
######fBodyAccJerk-XYZ=       FreqAccelJerkX, FreqAccelJerkY, FreqAccelJerkZ
######fBodyGyro-XYZ=          FreqBodyGyroX, FreqBodyGyroY, FreqBodyGyroZ
######fBodyAccMag=            FreqBodyAccelMag
######fBodyAccJerkMag=        FreqAccJerkMag
######fBodyGyroMag=           FreqGyroMag            
######fBodyGyroJerkMag        FreqGyroJerkMag

The set of variables that were estimated from these signals are: Note: (Only included the ones that were used in our set)

####mean(): Mean value

####std(): Standard deviation

###meanFreq(): Weighted average of the frequency components to obtain a mean frequency


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

######gravityMean= GravityMean
######tBodyAccMean= TimeBodyAccelMean
######tBodyAccJerkMean= TimeBodyAccelJermMean
######tBodyGyroMean = TimeBodyGyroMean
######tBodyGyroJerkMean= TimeBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt' in the original dataset


####5. AvgTimeBodyAccelMeanX
The mean of the TimeBodyAccelMeanX. The TimeBodyAccelMean is the mean of the raw data for the TimeBodyAccel on the X axial vector,


####6, AvgTimeBodyAccelMeanY
The mean of the TimeBodyAccelMeanY. The TimeBodyAccelMean is the mean of the raw data for the TimeBodyAccel on the Y axial vector,

####7.  AvgTimeBodyAccelMeanZ
The mean of the TimeBodyAccelMeanZ. The TimeBodyAccelMean is the mean of the raw data for the TimeBodyAccel on the Z axial vector,

####8.  AvgTimeGravityAccelMeanX
The mean of the TimeGravityAccelMeanX. The TimeGravityAccelMeanX is the mean of the raw data for the TimeGravityAccel
on the x axial vector.

####9.  AvgTimeGravityAccelMeanY
The mean of the TimeGravityAccelMeanY. The TimeGravityAccelMeanY is the mean of the raw data for the TimeGravityAccel
on the Y axial vector.

####10. AvgTimeGravityAccelMeanZ
The mean of the TimeGravityAccelMeanZ. The TimeGravityAccelMeanZ is the mean of the raw data for the TimeGravityAccel
on the Z axial vector.

####11. AvgTimeBodyAccelJerkMeanX
The mean of the TimeBodyAccelJerkMeanX. The TimeBodyAccelJerkMeanX is the mean of the raw data for the TimeBodyAccelJerk
on the X axial vector.

####12. AvgTimeBodyAccelJerkMeanY
The mean of the TimeBodyAccelJerkMeanY. The TimeBodyAccelJerkMeanY is the mean of the raw data for the TimeBodyAccelJerk
on the Y axial vector.

####13. AvgTimeBodyAccelJerkMeanZ
The mean of the TimeBodyAccelJerkMeanZ. The TimeBodyAccelJerkMeanZ is the mean of the raw data for the TimeBodyAccelJerk
on the Z axial vector.

####14. AvgTimeBodyGyroMeanX
The mean of the TimeBodyGyroMeanX. The TimeBodyGyroMeanX is the mean of the raw data for the TimeBodyGyro
on the X axial vector.

####15. AvgTimeBodyGyroMeanY
The mean of the TimeBodyGyroMeanY. The TimeBodyGyroMeanY is the mean of the raw data for the TimeBodyGyro
on the Y axial vector.

####16, AvgTimeBodyGyroMeanZ
The mean of the TimeBodyGyroMeanZ. The TimeBodyGyroMeanZ is the mean of the raw data for the TimeBodyGyro
on the Z axial vector.

####17. AvgTimeBodyGyroJerkMeanX
The mean of the TimeBodyGyroJerkMeanX. The TimeBodyGyroJerkMeanX is the mean of the raw data for the TimeBodyGyroJerk
on the X axial vector.

####18. AvgTimeBodyGyroJerkMeanY
The mean of the TimeBodyGyroJerkMeanY. The TimeBodyGyroJerkMeanY is the mean of the raw data for the TimeBodyGyroJerk
on the Y axial vector.

####19. AvgTimeBodyGyroJerkMeanZ
The mean of the TimeBodyGyroJerkMeanZ. The TimeBodyGyroJerkMeanZ is the mean of the raw data for the TimeBodyGyroJerk
on the Z axial vector.

####20. AvgTimeBodyAccelMagMean
The mean of the TimeBodyAccelMagMean. The TimeBodyAccelMagMean is the mean of the raw data for the TimeBodyAccelMag
which is the magnitude of the 3 dimensional signals.

####21. AvgTimeGravityAccelMagMean
The mean of the TimeGravityAccelMagMean. The TimeGravityAccelMagMean is the mean of the raw data for the TimeGravityAccelMag
which is the magnitude of the 3 dimensional signals.

####22. AvgTimeBodyAccelJerkMagMean
The mean of the TimeBodyAccelJerkMagMean. The TimeBodyAccelJerkMagMean is the mean of the raw data for the TimeBodyAccelJerkMag
which is the magnitude of the 3 dimensional signals.

####23. AvgTimeBodyGyroMagMean
The mean of the TimeBodyGyroMagMean. The TimeBodyGyroMagMean is the mean of the raw data for the TimeBodyGyroMag
which is the magnitude of the 3 dimensional signals.

####24. AvgTimeBodyGyroJerkMagMean
The mean of the TimeBodyGyroJerkMagMean. The TimeBodyGyroJerkMagMean is the mean of the raw data for the TimeBodyGyroJerkMag
which is the magnitude of the 3 dimensional signals.

####25. AvgFreqBodyAccelMeanX
The mean of the FreqBodyAccelMeanX. The FreqBodyAccelMeanX is the mean of the raw data for the FreqBodyAccel
on the X axial vector.

####26. AvgFreqBodyAccelMeanY
The mean of the FreqBodyAccelMeanY. The FreqBodyAccelMeanY is the mean of the raw data for the FreqBodyAccel
on the Y axial vector.

####27. AvgFreqBodyAccelMeanZ
The mean of the FreqBodyAccelMeanZ. The FreqBodyAccelMeanZ is the mean of the raw data for the FreqBodyAccel
on the Z axial vector.

####28. AvgFreqBodyAccelMeanFreqX
The mean of the FreqBodyAccelMeanFreqX. The FreqBodyAccelMeanX is the mean frequency of the raw data for the FreqBodyAccel
on the X axial vector.

####29. AvgFreqBodyAccelMeanFreqY
The mean of the FreqBodyAccelMeanFreqY. The FreqBodyAccelMeanY is the mean frequency of the raw data for the FreqBodyAccel
on the Y axial vector

####30. AvgFreqBodyAccelMeanFreqZ
The mean of the FreqBodyAccelMeanFreqZ. The FreqBodyAccelMeanZ is the mean frequency of the raw data for the FreqBodyAccel
on the Z axial vector

####31. AvgFreqBodyAccelJerkMeanX
The mean of the FreqBodyAccelJerkMeanX. The FreqBodyAccelJerkMeanX is the mean of the raw data for the FreqBodyAccelJerk
on the X axial vector.

####32. AvgFreqBodyAccelJerkMeanY
The mean of the FreqBodyAccelJerkMeanY. The FreqBodyAccelJerkMeanY is the mean of the raw data for the FreqBodyAccelJerk
on the Y axial vector.

####33. AvgFreqBodyAccelJerkMeanZ
The mean of the FreqBodyAccelJerkMeanZ. The FreqBodyAccelJerkMeanZ is the mean of the raw data for the FreqBodyAccelJerk
on the Z axial vector.

####34. AvgFreqBodyAccelJerkMeanFreqX
The mean of the FreqBodyAccelJerkMeanFreqX. The FreqBodyAccelJerkMeanFreqX is the mean frequency of the raw data for the 
FreqBodyAccelJerk on the X axial vector.

####35. AvgFreqBodyAccelJerkMeanFreqY
The mean of the FreqBodyAccelJerkMeanFreqY. The FreqBodyAccelJerkMeanFreqY is the mean frequency of the raw data for the 
FreqBodyAccelJerk on the Y axial vector.

####36. AvgFreqBodyAccelJerkMeanFreqZ
The mean of the FreqBodyAccelJerkMeanFreqZ. The FreqBodyAccelJerkMeanFreqZ is the mean frequency of the raw data for the 
FreqBodyAccelJerk on the Z axial vector.

####37. AvgFreqBodyGyroMeanX
The mean of the FreqBodyGyroMeanX. The FreqBodyGyroMeanX is the mean of the raw data for the FreqBodyGyro
on the X axial vector.

####38. AvgFreqBodyGyroMeanY
The mean of the FreqBodyGyroMeanY. The FreqBodyGyroMeanY is the mean of the raw data for the FreqBodyGyro
on the Y axial vector.

####39. AvgFreqBodyGyroMeanZ
The mean of the FreqBodyGyroMeanZ. The FreqBodyGyroMeanZ is the mean of the raw data for the FreqBodyGyro
on the Z axial vector.

####40. AvgFreqBodyGyroMeanFreqX
The mean of the FreqBodyGyroMeanFreqX. The FreqBodyGyroMeanFreqX is the mean frequency of the raw data for the 
FreqBodyGyro on the X axial vector.


####41. AvgFreqBodyGyroMeanFreqY
The mean of the FreqBodyGyroMeanFreqY. The FreqBodyGyroMeanFreqY is the mean frequency of the raw data for the 
FreqBodyGyro on the Y axial vector.

####42. AvgFreqBodyGyroMeanFreqZ
The mean of the FreqBodyGyroMeanFreqZ. The FreqBodyGyroMeanFreqZ is the mean frequency of the raw data for the 
FreqBodyGyro on the Z axial vector.

####43. AvgFreqBodyAccelMagMean
The mean of the FreqBodyAccelMagMean. The FreqBodyAccelMagMean is the mean of the raw data for the FreqBodyAccelMag
which is the magnitude of the 3 dimensional signals.

####44. AvgFreqBodyAccelMagMeanFreq
The mean of the FreqBodyAccelMagMeanFreq. The FreqBodyAccelMagMeanFreq is the mean frequency of the raw data for the FreqBodyAccelMag
which is the magnitude of the 3 dimensional signals.

####45.	AvgFreqBodyAccelJerkMagMean
The mean of the FreqBodyAccelJerkMagMean. The FreqBodyAccelJerkMagMean is the mean of the raw data for the FreqBodyAccelJerkMag
which is the magnitude of the 3 dimensional signals.

####46.	AvgFreqBodyAccelJerkMagMeanFreq
The mean of the FreqBodyAccelJerkMagMeanFreq. The FreqBodyAccelJerkMagMeanFreq is the mean frequency of the raw data for the 
FreqBodyAccelJerkMag which is the magnitude of the 3 dimensional signals

####47.	AvgFreqBodyGyroMagMean
The mean of the FreqBodyGyroMagMean. The FreqBodyGyroMagMean is the mean of the raw data for the FreqBodyGyroMag
which is the magnitude of the 3 dimensional signals.

####48.	AvgFreqBodyGyroMagMeanFreq
The mean of the FreqBodyGyroMagMeanFreq. The FreqBodyGyroMagMeanFreqq is the mean frequency of the raw data for the FreqBodyGyroMag
which is the magnitude of the 3 dimensional signals

####49.	AvgFreqBodyGyroJerkMagMean
The mean of the FreqBodyGyroJerkMagMean. The FreqBodyGyroJerkMagMean is the mean of the raw data for the FreqBodyGyroJerkMag
which is the magnitude of the 3 dimensional signals.

####50.	AvgFreqBodyGyroJerkMagMeanFreq
The mean of the FreqBodyGyroJerkMagMeanFreq. The FreqBodyGyroJerkMagMeanFreq is the mean frequency of the raw data for the 
FreqBodyGyroJerkMag which is the magnitude of the 3 dimensional signals

####51.	AvgTimeBodyAccelStdX
The mean of the TimeBodyAccelStdX. The TimeBodyAccelStdX is the standard deviation of the raw data for the 
TimeBodyAccel on the X axial vector.

####52.	AvgTimeBodyAccelStdY
The mean of the TimeBodyAccelStdY. The TimeBodyAccelStdY is the standard deviation of the raw data for the 
TimeBodyAccel on the Y axial vector.

####53.	AvgTimeBodyAccelStdZ
The mean of the TimeBodyAccelStdZ. The TimeBodyAccelStdZ is the standard deviation of the raw data for the 
TimeBodyAccel on the Z axial vector.

####54.	AvgTimeGravityAccelStdX
The mean of the TimeGravityAccelStdX. The TimeGravityAccelStdX is the standard deviation of the raw data for the 
TimeGravityAccel on the X axial vector.

####55.	AvgTimeGravityAccelStdY
The mean of the TimeGravityAccelStdY. The TimeGravityAccelStdY is the standard deviation of the raw data for the 
TimeGravityAccel on the Y axial vector.

####56.	AvgTimeGravityAccelStdZ
The mean of the TimeGravityAccelStdZ. The TimeGravityAccelStdZ is the standard deviation of the raw data for the 
TimeGravityAccel on the Z axial vector.

####57.	AvgTimeBodyAccelJerkStdX
The mean of the TimeBodyAccelJerkStdX. The TimeBodyAccelJerkStdX is the standard deviation of the raw data for the 
TimeBodyAccelJerk on the X axial vector.

####58.	AvgTimeBodyAccelJerkStdY
The mean of the TimeBodyAccelJerkStdY. The TimeBodyAccelJerkStdY is the standard deviation of the raw data for the 
TimeBodyAccelJerk on the Y axial vector.

####59.	AvgTimeBodyAccelJerkStdZ
The mean of the TimeBodyAccelJerkStdZ. The TimeBodyAccelJerkStdZ is the standard deviation of the raw data for the 
TimeBodyAccelJerk on the Z axial vector.

####60.	AvgTimeBodyGyroStdX
The mean of the TimeBodyGyroStdX. The TimeBodyGyroStdX is the standard deviation of the raw data for the 
TimeBodyGyro on the X axial vector.

####61.	AvgTimeBodyGyroStdY
The mean of the TimeBodyGyroStdY. The TimeBodyGyroStdY is the standard deviation of the raw data for the 
TimeBodyGyro on the Y axial vector.

####62.	AvgTimeBodyGyroStdZ
The mean of the TimeBodyGyroStdZ. The TimeBodyGyroStdZ is the standard deviation of the raw data for the 
TimeBodyGyro on the Z axial vector.


####63.	AvgTimeBodyGyroJerkStdX
The mean of the TimeBodyGyroJerkStdX. The TimeBodyGyroJerkStdX is the standard deviation of the raw data for the 
TimeBodyGyroJerk on the X axial vector.

####64.	AvgTimeBodyGyroJerkStdY
The mean of the TimeBodyGyroJerkStdY. The TimeBodyGyroJerkStdY is the standard deviation of the raw data for the 
TimeBodyGyroJerk on the Y axial vector.

####65.	AvgTimeBodyGyroJerkStdZ
The mean of the TimeBodyGyroJerkStdZ. The TimeBodyGyroJerkStdZ is the standard deviation of the raw data for the 
TimeBodyGyroJerk on the Z axial vector.

####66.	AvgTimeBodyAccelMagStd
The mean of the TimeBodyAccelMagStd. The TimeBodyAccelMagStd is the standard deviation of the raw data for the TimeBodyAccelMag
which is the magnitude of the 3 dimensional signals.

####67.	AvgTimeGravityAccelMagStd
The mean of the TimeGravityAccelMagStd. The TimeGravityAccelMagStd is the standard deviation of the raw data for the 
TimeGravityAccelMag which is the magnitude of the 3 dimensional signals.

####68.	AvgTimeBodyAccelJerkMagStd
The mean of the TimeBodyAccelJerkMagStd. The TimeBodyAccelJerkMagStd is the standard deviation of the raw data for the 
TimeBodyAccelJerkMag which is the magnitude of the 3 dimensional signals.

####69.	AvgTimeBodyGyroMagStd
The mean of the TimeBodyGyroMagStd. The TimeBodyGyroMagStd is the standard deviation of the raw data for the 
TimeBodyGyroMag which is the magnitude of the 3 dimensional signals.

####70.	AvgTimeBodyGyroJerkMagStd
The mean of the TimeBodyGyroJerkMagStd. The TimeBodyGyroJerkMagStd is the standard deviation of the raw data for the 
TimeBodyGyroJerkMag which is the magnitude of the 3 dimensional signals.

####71.	AvgFreqBodyAccelStdX
The mean of the FreqBodyAccelStdX. The FreqBodyAccelStdX is the standard deviation of the raw data for the 
FreqBodyAccel on the X axial vector.

####72.	AvgFreqBodyAccelStdY
The mean of the FreqBodyAccelStdY. The FreqBodyAccelStdY is the standard deviation of the raw data for the 
FreqBodyAccel on the Y axial vector.

####73.	AvgFreqBodyAccelStdZ
The mean of the FreqBodyAccelStdZ. The FreqBodyAccelStdZ is the standard deviation of the raw data for the 
FreqBodyAccel on the Z axial vector.

####74.	AvgFreqBodyAccelJerkStdX
The mean of the FreqBodyAccelJerkStdX. The FreqBodyAccelJerkStdX is the standard deviation of the raw data for the 
FreqBodyAccelJerk on the X axial vector.

####75.	AvgFreqBodyAccelJerkStdY
The mean of the FreqBodyAccelJerkStdY. The FreqBodyAccelJerkStdY is the standard deviation of the raw data for the 
FreqBodyAccelJerk on the Y axial vector.

####76.	AvgFreqBodyAccelJerkStdZ
The mean of the FreqBodyAccelJerkStdZ. The FreqBodyAccelJerkStdZ is the standard deviation of the raw data for the 
FreqBodyAccelJerk on the Z axial vector.

####77.	AvgFreqBodyGyroStdX
The mean of the FreqBodyGyroStdX. The FreqBodyGyroStdX is the standard deviation of the raw data for the 
FreqBodyGyro on the X axial vector.

####78.	AvgFreqBodyGyroStdY
The mean of the FreqBodyGyroStdY. The FreqBodyGyroStdY is the standard deviation of the raw data for the 
FreqBodyGyro on the Y axial vector.

####79.	AvgFreqBodyGyroStdZ
The mean of the FreqBodyGyroStdZ. The FreqBodyGyroStdZ is the standard deviation of the raw data for the 
FreqBodyGyro on the Z axial vector.

####80.	AvgFreqBodyAccelMagStd
The mean of the FreqBodyAccelMagStd. The FreqBodyAccelMagStd is the standard deviation of the raw data for the 
FreqBodyAccelMag which is the magnitude of the 3 dimensional signals.

####81.	AvgFreqBodyAccelJerkMagStd
The mean of the FreqBodyAccelJerkMagStd. The FreqBodyAccelJerkMagStd is the standard deviation of the raw data for the 
FreqBodyAccelJerkMag which is the magnitude of the 3 dimensional signals.

####82.	AvgFreqBodyGyroMagStd
The mean of the FreqBodyGyroMagStd. The FreqBodyGyroMagStd is the standard deviation of the raw data for the 
FreqBodyGyroMag which is the magnitude of the 3 dimensional signals.

####83.	AvgFreqBodyGyroJerkMagStd
The mean of the FreqBodyGyroJerkMagStd. The FreqBodyGyroJerkMagStd is the standard deviation of the raw data for the 
FreqBodyGyroJerkMag which is the magnitude of the 3 dimensional signals.

