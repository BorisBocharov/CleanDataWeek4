====================================================================================================================================

Data cleaning, transformations, etc. performed:

1. For both Train and Test cases, the following 3 variables have been added to (joined with)
the X dataset (e.g., X_train.txt, containing the 561-feature vector of measurements):

Mapping

New var                 Old var

Response      -    Activity ID (1-6; e.g., see y_train.txt) 
Response_Desc -    Activity Label ("Walk", "Walk_Up", "Walk_Dn", "Sit", "Stand", "Lay" - shortened version of original labels for greater readability; see activity_labels.txt)
Subject       -    Participant ID (e.g., subject_train.txt)

2. The original 516-feature vector contained duplicate columns (only 477 unique). Those were
eliminated, with only the first instance retained in each case.

3. For an explanation of each of the variables comprising the above vector, please refer
feature.txt and feature_info.txt in the original data set.

====================================================================================================================================

Outline of steps taken to generate the tidy data set (for details, consult run_analysis.R):

1. Download Train data set into R, merging X (independent variables), y (Response variable) and 
subject in the process. Include variable names and activity labels, as needed.
2. Repeat 1. for Test data set.
3. Combine Train and Test data sets. Delete duplicate columns.
4. Re-shape the merged data set to arrive at the average of each variable for each 
Activity/Subject pairing.

====================================================================================================================================
