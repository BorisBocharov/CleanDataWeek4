# Preliminary

# Install reshape package, if not done already!
library(reshape2)

# Set working directory to UCI HAR Dataset folder
setwd("C:/Users/BorisBocharov/Desktop/Data Science Coursera/Data Cleaning/Week 4/Project")
#getwd()

#Fetch descriptive names of variables and activities
filename <- "./UCI HAR Dataset/features.txt"
var_names <- read.table(filename,header=FALSE, sep="")
filename <- "./UCI HAR Dataset/activity_labels.txt"
Act_names <- read.table(filename,header=FALSE, sep="")

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
colnames(Data_train) <- c(as.character(var_names[,2]),"Activity", "Subject")

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
colnames(Data_test) <- c(as.character(var_names[,2]),"Activity", "Subject")


# STEP 1. Combine Train & Test Datasets
Data_All <- rbind(Data_train, Data_test)

# Remove duplicate columns
Data_All <- Data_All[, !duplicated(colnames(Data_All))]

# Check dimensions
dim(Data_All)[1]
dim(X_train)[1] + dim(X_test)[1]

# STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# These contain mean() and std()
a1 <- grep("mean()", colnames(Data_All))
a2 <- grep("std()", colnames(Data_All))
a3 <- grep("Activity", colnames(Data_All))
a4 <- grep("Subject", colnames(Data_All))
Data_All <- Data_All[ ,c(a1,a2,a3,a4)]

# STEP 3. Uses descriptive activity names to name the activities in the data set.
Data_All <- inner_join(Data_All, Act_names, by = c("Activity" = "V1"))
colnames(Data_All)[length(colnames(Data_All))] <- "Activity_Desc"

# STEP 4. Appropriately labels the data set with descriptive variable names.
# Done at Train/Test data sets creation stage.

# STEP 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

temp <- length(colnames(Data_All))

# Melt the Data_All dataset using Response (Activity), Response_Desc and Subject as variables
Data_All_molten <- melt(Data_All, id = c((temp-2):temp))

# Re-cast the molten dataset by averaging each variable (for each Response/Subject combination)
Data_All_reshaped <- dcast(Data_All_molten, Subject + Activity + Activity_Desc ~ variable, mean)

#Remove activity (Id)
Data_All_reshaped <- Data_All_reshaped[,-2]

# Save tidy dataset to working directory
write.table(Data_All_reshaped, file = "Tidy_dataset.txt", row.names = FALSE)
