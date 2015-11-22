# Load required library
library("reshape")
# 1- Merges the training and the test sets to create one data set.
# 1-a) Read train data 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# 1-b) Read test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# 1-c) Get Feature Names List from features.txt
feature_Names_List <- read.table("./UCI HAR Dataset/features.txt")

# 1-d) Add column names to train data set
names(subject_train) <- "subject_ID"
names(X_train) <- feature_Names_List$V2
names(y_train) <- "activity"

# 1-e) Add column names to test data set
names(subject_test) <- "subject_ID"
names(X_test) <- feature_Names_List$V2
names(y_test) <- "activity"

# 1-f) bind all train data in one data set, bind all test data in one data set 
# then merge both in one comined data set
train_all <- cbind(subject_train, y_train, X_train)
test_all <- cbind(subject_test, y_test, X_test)
combined_Data <- rbind(train_all, test_all)

# 1-g) remove unneeded data to free more memory
rm(subject_train, X_train, y_train, subject_test, X_test, y_test, train_all, test_all)

# 2-Extracts only the measurements on the mean and standard deviation for each
#   measurement. 
# 2-a) Create logical vector with required column, i.e., activity, subject_ID, 
#      mean() and std()               
required_column <- grepl("activity", names(combined_Data)) | 
                               grepl("subject_ID", names(combined_Data)) |
                               grepl("mean\\(", names(combined_Data)) |
                               grepl("std\\(", names(combined_Data))
# 2-b) Remove everty thing and keep only required column
combined_Data <- combined_Data[ ,required_column]


# 3- Uses descriptive activity names to name the activities in the data set
combined_Data$activity <- factor(combined_Data$activity, labels=c("Walking","Walking Upstairs",
                            "Walking Downstairs", "Sitting", "Standing", "Laying"))

# 4- Appropriately labels the data set with descriptive variable names. 
# This step previously done in steps 1-d) and 1-e)
                            
# 5- From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
melted_data <- melt(combined_Data, id=c("subject_ID","activity"))
tidy_data <- cast(melted_data, subject_ID+activity ~ variable, mean)

rm(required_column, feature_Names_List, combined_Data, melted_data)
                            
write.table(tidy_data, file = "tidy_data.txt", quote = FALSE, row.names = FALSE)