====================================================================================================================
BACKGROUND.

The following analysis is based on the study "Human Activity Recognition Using 

Smartphones Dataset" by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto.

For more details: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Underlying dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original study is briefly summarized below:

Synopsys (original study): The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Moreover, for each record in the original dataset it was provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

====================================================================================================================

GOAL.

The aim of this analysis is to provide an independent "tidy" (as described in lecture notes) 
data set with the average of each variable (from "561-feature vector" above) for every 
activity and subject combination. Details of data cleaning, transformations, etc. are provided
in CodeBook.md.

====================================================================================================================

CONTENTS. 

The repo includes the following files:

- 'README.md': background information.

- 'CodeBook.md': data cleaning, transformations, etc. performed.

- run_analysis.R: R code, which uses the original (raw) data set and produces the the above-mentioned "tidy" data set.

- 'Tidy_dataset.txt': Shows information about the variables used on the feature vector.

====================================================================================================================
 
 STEPS.
 
 It is assumed that the dataset (UCI HAR Dataset) has been saved to your working directory.
 
 Open the "run_analysis.R" script and make sure that the package "reshape2" is installed. Then, run the script
 (well-commented and pretty self-explanatory) in its entirety. The output will be the "Tidy_dataset.txt" files, stored,
 again, in the working directory.
 
 ====================================================================================================================

 
