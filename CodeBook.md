====================================================================================================================================

Data cleaning, transformations, etc. performed:

1. 
For both Train and Test cases, the following 3 variables have been added to (joined with)
the X dataset (e.g., X_train.txt, containing the 561-feature vector of measurements):

Mapping

New var                 Old var

Activity      -    Activity ID (1-6; e.g., see y_train.txt) 
Activity_Desc -    Activity Label (see activity_labels.txt)
Subject       -    Participant ID (e.g., subject_train.txt)

2. 
The original 516-feature vector contained duplicate columns (only 477 unique). Those were eliminated, with only the first instance retained in each case.

3. 
For an explanation of each of the variables comprising the above vector, please refer feature.txt and feature_info.txt in the original data set.

====================================================================================================================================

Outline of steps taken to generate the tidy data set (for details, consult run_analysis.R):

1.Download Train data set into R, merging X (independent variables), y (Response variable) and subject in the process. Include variable names and activity labels, as needed.
2.Repeat 1. for Test data set.
3.Combine Train and Test data sets. Delete duplicate columns.
4.Extract only those variables (besides, Subject, Activity and Activity_Desc) that contain mean() and std() in their names.
5.Re-shape the resultant data set to arrive at the average of each variable for each Subject/Activity_Desc pairing.

====================================================================================================================================
