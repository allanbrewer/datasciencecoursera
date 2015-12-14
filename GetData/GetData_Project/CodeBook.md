# Tidy dataset CodeBook

## Synopsis

The specification of formatting and content of the data contained in the simplified dataset and final tidy dataset is documented here.

The data used is available to download by clicking [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This repository contains the [R script](./run\_analysis.R) that creates the tidy dataset.

A [README.md](./README.md) file a description of the data cleansing and transformation process done by the script. 

This [CodeBook.md](./CodeBook.md) describes the variables of the tidy dataset that the script writes into the [tidy dataset](./tidydataset.txt) file.

The original files contained the following data before transforming it:

	a. 30 participants between 19-48 years of age. 
	b. Each participant did 6 activities (laying, sitting, standing, walking, walking downstairs, and walking upstairs) while wearing a Samsung smartphone.
	c. Accelerometer and gyroscope measurements of tri-axial linear acceleration and tri-axial angular velocity. 
	d. The data was separated into two sets, 70% training, 30% testing used in the machine learning process. 

## Tidy Dataset variables description

The tidy dataset includes 68 variables and 180 observations (30 users and 6 activities per user). This variables have been selected from the original complete data set of 563 variables (subject, activity and 561 features) and 10,299 observations. 

Only variables with the **mean()** and **std()** functions in their names where selected from the features list, variables with **meanFreq()** and **angle()** functions where excluded from the tidy dataset variables.

Variable name 													| Variable description
----------------------------------------------------------------|---------------------------------------------------
[1]	subjectcode													| This code represents the subject performing the activity. It ranges from 1 to 30
[2] activity													| Factor variable with the activity name performed, there are 6 activities.
[3] TimeDomainBodyAccelerometerMeanxAxis						| Mean of the body acceleration on the x-Axis. Time domain Variable.
[4] TimeDomainBodyAccelerometerMeanyAxis						| Mean of the body acceleration on the y-Axis. Time domain Variable.
[5] TimeDomainBodyAccelerometerMeanzAxis						| Mean of the body acceleration on the z-Axis. Time domain Variable.
[6] TimeDomainBodyAccelerometerStandardDeviationxAxis			| Standard deviation of the body acceleration on the x-Axis. Time domain Variable.
[7] TimeDomainBodyAccelerometerStandardDeviationyAxis  			| Standard deviation of the body acceleration on the y-Axis. Time domain Variable.
[8] TimeDomainBodyAccelerometerStandardDeviationzAxis 			| Standard deviation of the body acceleration on the z-Axis. Time domain Variable.
[9] TimeDomainGravityAccelerometerMeanxAxis 					| Mean of the gravity acceleration on the x-Axis. Time domain Variable.
[10] TimeDomainGravityAccelerometerMeanyAxis 					| Mean of the gravity acceleration on the y-Axis. Time domain Variable.
[11] TimeDomainGravityAccelerometerMeanzAxis 					| Mean of the gravity acceleration on the z-Axis. Time domain Variable.
[12] TimeDomainGravityAccelerometerStandardDeviationxAxis		| Standard deviation of the gravity acceleration on the x-Axis. Time domain Variable.
[13] TimeDomainGravityAccelerometerStandardDeviationyAxis 	 	| Standard deviation of the gravity acceleration on the y-Axis. Time domain Variable.
[14] TimeDomainGravityAccelerometerStandardDeviationzAxis 		| Standard deviation of the gravity acceleration on the z-Axis. Time domain Variable.
[15] TimeDomainBodyAccelerometerJerkMeanxAxis 					| Mean of the jerk of the body acceleration on the x-Axis. Time domain Variable.
[16] TimeDomainBodyAccelerometerJerkMeanyAxis 					| Mean of the jerk of the body acceleration on the y-Axis. Time domain Variable.
[17] TimeDomainBodyAccelerometerJerkMeanzAxis 					| Mean of the jerk of the body acceleration on the z-Axis. Time domain Variable.
[18] TimeDomainBodyAccelerometerJerkStandardDeviationxAxis 		| Standard deviation of the jerk of the body acceleration on the x-Axis. Time domain Variable.
[19] TimeDomainBodyAccelerometerJerkStandardDeviationyAxis 		| Standard deviation of the jerk of the body acceleration on the y-Axis. Time domain Variable.
[20] TimeDomainBodyAccelerometerJerkStandardDeviationzAxis 		| Standard deviation of the jerk of the body acceleration on the z-Axis. Time domain Variable.
[21] TimeDomainBodyGyroscopeMeanxAxis 							| Mean of the body angular velocity on the x-Axis. Time domain Variable.
[22] TimeDomainBodyGyroscopeMeanyAxis 							| Mean of the body angular velocity on the y-Axis. Time domain Variable.
[23] TimeDomainBodyGyroscopeMeanzAxis 							| Mean of the body angular velocity on the z-Axis. Time domain Variable.
[24] TimeDomainBodyGyroscopeStandardDeviationxAxis 				| Standard deviation of the body angular velocity on the x-Axis. Time domain Variable.
[25] TimeDomainBodyGyroscopeStandardDeviationyAxis 				| Standard deviation of the body angular velocity on the y-Axis. Time domain Variable.
[26] TimeDomainBodyGyroscopeStandardDeviationzAxis 				| Standard deviation of the body angular velocity on the z-Axis. Time domain Variable.
[27] TimeDomainBodyGyroscopeJerkMeanxAxis 						| Mean of the body jerk angular velocity on the x-Axis. Time domain Variable.
[28] TimeDomainBodyGyroscopeJerkMeanyAxis 						| Mean of the body jerk angular velocity on the y-Axis. Time domain Variable.
[29] TimeDomainBodyGyroscopeJerkMeanzAxis 						| Mean of the body jerk angular velocity on the z-Axis. Time domain Variable.
[30] TimeDomainBodyGyroscopeJerkStandardDeviationxAxis 			| Standard deviation of the body jerk angular velocity on the x-Axis. Time domain Variable.
[31] TimeDomainBodyGyroscopeJerkStandardDeviationyAxis 			| Standard deviation of the body jerk angular velocity on the y-Axis. Time domain Variable.
[32] TimeDomainBodyGyroscopeJerkStandardDeviationzAxis 			| Standard deviation of the body jerk angular velocity on the z-Axis. Time domain Variable.
[33] TimeDomainBodyAccelerometerMagnitudMean 					| Mean of the body acceleration magnitud using the Euclidian Norm. Time domain Variable.
[34] TimeDomainBodyAccelerometerMagnitudStandardDeviation 		| Standard deviation of the body acceleration magnitud using the Euclidian Norm. Time domain Variable.
[35] TimeDomainGravityAccelerometerMagnitudMean 				| Mean of the gravity acceleration magnitud. Time domain Variable.
[36] TimeDomainGravityAccelerometerMagnitudStandardDeviation 	| Standard deviation of the gravity acceleration magnitud. Time domain Variable.
[37] TimeDomainBodyAccelerometerJerkMagnitudMean				| Mean of the body acceleration jerk magnitud using the Euclidian Norm. Time domain Variable.
[38] TimeDomainBodyAccelerometerJerkMagnitudStandardDeviation 	| Standard deviation of the body acceleration jerk magnitud using the Euclidian Norm. Time domain Variable.
[39] TimeDomainBodyGyroscopeMagnitudMean 						| Mean of the angular velocity magnitud. Time domain Variable.
[40] TimeDomainBodyGyroscopeMagnitudStandardDeviation 			| Standard deviation of the angular velocity magnitud. Time domain Variable.
[41] TimeDomainBodyGyroscopeJerkMagnitudMean 					| Mean of the angular velocity jerk magnitud. Time domain Variable.
[42] TimeDomainBodyGyroscopeJerkMagnitudStandardDeviation 		| Standard deviation of the angular velocity jerk magnitud. Time domain Variable.
[43] FrequencyDomainBodyAccelerometerMeanxAxis 					| Mean of the body acceleration on the x-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[44] FrequencyDomainBodyAccelerometerMeanyAxis 					| Mean of the body acceleration on the y-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[45] FrequencyDomainBodyAccelerometerMeanzAxis 					| Mean of the body acceleration on the z-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[46] FrequencyDomainBodyAccelerometerStandardDeviationxAxis 	| Standard deviation of the body acceleration on the x-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[47] FrequencyDomainBodyAccelerometerStandardDeviationyAxis 	| Standard deviation of the body acceleration on the y-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[48] FrequencyDomainBodyAccelerometerStandardDeviationzAxis 	| Standard deviation of the body acceleration on the z-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[49] FrequencyDomainBodyAccelerometerJerkMeanxAxis 				| Mean of the body acceleration jerk on the x-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[50] FrequencyDomainBodyAccelerometerJerkMeanyAxis 				| Mean of the body acceleration jerk on the y-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[51] FrequencyDomainBodyAccelerometerJerkMeanzAxis 				| Mean of the body acceleration jerk on the z-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[52] FrequencyDomainBodyAccelerometerJerkStandardDeviationxAxis | Standard deviation of the body acceleration jerk on the x-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[53] FrequencyDomainBodyAccelerometerJerkStandardDeviationyAxis | Standard deviation of the body acceleration jerk on the y-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[54] FrequencyDomainBodyAccelerometerJerkStandardDeviationzAxis | Standard deviation of the body acceleration jerk on the z-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[55] FrequencyDomainBodyGyroscopeMeanxAxis 						| Mean of the body angular velocity on the x-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[56] FrequencyDomainBodyGyroscopeMeanyAxis 						| Mean of the body angular velocity on the y-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[57] FrequencyDomainBodyGyroscopeMeanzAxis 						| Mean of the body angular velocity on the z-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[58] FrequencyDomainBodyGyroscopeStandardDeviationxAxis 		| Standard deviation of the body angular velocity on the x-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[59] FrequencyDomainBodyGyroscopeStandardDeviationyAxis 		| Standard deviation of the body angular velocity on the y-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[60] FrequencyDomainBodyGyroscopeStandardDeviationzAxis 		| Standard deviation of the body angular velocity on the z-Axis. Frequency domain Variable, Fast Fourier Transform applied.
[61] FrequencyDomainBodyAccelerometerMagnitudMean 				| Mean of the body acceleration magnitud using the Euclidian Norm. Frequency domain Variable, Fast Fourier Transform applied.
[62] FrequencyDomainBodyAccelerometerMagnitudStandardDeviation 	| Standard deviation of the body acceleration magnitud using the Euclidian Norm. Frequency domain Variable, Fast Fourier Transform applied.
[63] FrequencyDomainBodyAccelerometerJerkMagnitudMean 			| Mean of the body acceleration jerk magnitud using the Euclidian Norm. Frequency domain Variable, Fast Fourier Transform applied.
[64] FrequencyDomainBodyAccelerometerJerkMagnitudStandardDeviation | Standard deviation of the body acceleration jerk magnitud using the Euclidian Norm. Frequency domain Variable, Fast Fourier Transform applied.
[65] FrequencyDomainBodyGyroscopeMagnitudMean 					| Mean of the angular velocity magnitud. Frequency domain Variable, Fast Fourier Transform applied.	
[66] FrequencyDomainBodyGyroscopeMagnitudStandardDeviation 		| Standard deviation of the angular velocity magnitud. Frequency domain Variable, Fast Fourier Transform applied.
[67] FrequencyDomainBodyGyroscopeJerkMagnitudMean 				| Mean of the angular velocity jerk magnitud. Frequency domain Variable, Fast Fourier Transform applied.
[68] FrequencyDomainBodyGyroscopeJerkMagnitudStandardDeviation	| Standard deviation of the angular velocity  jerk magnitude. Frequency domain Variable, Fast Fourier Transform applied.

## Refenrence

Human Activity Recognition Using Smartphones Data Set. University of California at Irvine,  Center for Machine Learning and Intelligent Systems, [Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Retrieved 20 March 2015.