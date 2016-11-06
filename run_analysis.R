# Preliminary

# Set working directory to UCI HAR Dataset folder
# setwd("C:/Users/BorisBocharov/Desktop/Data Science Coursera/Data Cleaning/Week 4/Project/UCI HAR Dataset")
#getwd()

#Fetch descriptive names of variables and activities
filename <- "./UCI HAR Dataset/features.txt"
var_names <- read.table(filename,header=FALSE, sep="")
filename <- "./UCI HAR Dataset/activity_labels.txt"
Act_names <- read.table(filename,header=FALSE, sep="")

#re-name activities
Act_names[,2] <- c("Walk", "Walk_Up", "Walk_Dn", "Sit", "Stand", "Lay")

# Create Train Dataset 

# Download
filename <- "./UCI HAR Dataset/train/X_train.txt"
X_train <- read.table(filename,header=FALSE, sep="")
filename <- "./UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(filename,header=FALSE, sep="") 
filename <- "./UCI HAR Dataset/train/subject_train.txt"
SubjectID_train <- read.table(filename,header=FALSE, sep="")

# Check dimensions
dim(X_train)[1]
dim(y_train)[1]
dim(SubjectID_train)[1]

# Merge and name
Data_train <- cbind(X_train, y_train, SubjectID_train)
colnames(Data_train) <- c(as.character(var_names[,2]),"Response", "Subject")

# Create Test Dataset 

# Download
filename <- "./UCI HAR Dataset/test/X_test.txt"
X_test <- read.table(filename,header=FALSE, sep="")
filename <- "./UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(filename,header=FALSE, sep="") 
filename <- "./UCI HAR Dataset/test/subject_test.txt"
SubjectID_test <- read.table(filename,header=FALSE, sep="")

# Check dimensions
dim(X_test)[1]
dim(y_test)[1]
dim(SubjectID_test)[1]

# Merge and name
Data_test <- cbind(X_test, y_test, SubjectID_test)
colnames(Data_test) <- c(as.character(var_names[,2]),"Response", "Subject")


# STEP 1. Combine Train & Test Datasets
Data_All <- rbind(Data_train, Data_test)

# Remove duplicate columns
Data_All <- Data_All[, !duplicated(colnames(Data_All))]

# Check dimensions
dim(Data_All)[1]
dim(X_train)[1] + dim(X_test)[1]

# STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# These contain mean() and std()
Data_All_mean_n_std <- Data_All[ ,union(grep("mean()", colnames(Data_All)),grep("std()", colnames(Data_All)))]

# STEP 3. Uses descriptive activity names to name the activities in the data set.
Data_All <- inner_join(Data_All, Act_names, by = c("Response" = "V1"))
colnames(Data_All)[length(colnames(Data_All))] <- "Response_Desc"

# STEP 4. Appropriately labels the data set with descriptive variable names.
# Done at Train/Test data sets creation stage.

# STEP 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

temp <- length(colnames(Data_All))

# Melt the Data_All dataset using Response (Activity), Response_Desc and Subject as variables
Data_All_molten <- melt(Data_All, id = c(temp-2, temp,temp-1))

# Re-cast the molten dataset by averaging each variable (for each Response/Subject combination)
Data_All_reshaped <- dcast(Data_All_molten, Response + Response_Desc + Subject ~ variable, mean)

# Save tidy dataset to working directory
write.table(Data_All_reshaped, file = "Tidy_dataset.txt", row.names = FALSE, sep="")
