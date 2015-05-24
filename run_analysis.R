require(dplyr)

# Directories and files
uci_hard_dir <- "UCI\ HAR\ Dataset"
feature_file <- paste(uci_hard_dir, "/features.txt", sep = "")
activity_labels_file <- paste(uci_hard_dir, "/activity_labels.txt", sep = "")
x_train_file <- paste(uci_hard_dir, "/train/X_train.txt", sep = "")
y_train_file <- paste(uci_hard_dir, "/train/y_train.txt", sep = "")
subject_train_file <- paste(uci_hard_dir, "/train/subject_train.txt", sep = "")
x_test_file  <- paste(uci_hard_dir, "/test/X_test.txt", sep = "")
y_test_file  <- paste(uci_hard_dir, "/test/y_test.txt", sep = "")
subject_test_file <- paste(uci_hard_dir, "/test/subject_test.txt", sep = "")

# Load raw data into datasets
features <- read.table(feature_file, colClasses = c("character"))
activity_labels <- read.table(activity_labels_file, col.names = c("ActivityId", "Activity"))
x_train <- read.table(x_train_file)
y_train <- read.table(y_train_file)
subject_train <- read.table(subject_train_file)
x_test <- read.table(x_test_file)
y_test <- read.table(y_test_file)
subject_test <- read.table(subject_test_file)

##################################################################
# 1. Merges the training and the test sets to create one data set.
##################################################################

# Binding sensor data
# there are 561 col in x_train and x_test. subject_train and y_train are added as the column 562 and column 563 respectively
training_sensor_data <- cbind(cbind(x_train, subject_train), y_train)
test_sensor_data <- cbind(cbind(x_test, subject_test), y_test)
sensor_data <- rbind(training_sensor_data, test_sensor_data)

# Label the last 2 columns of the combined sensor data columns
# Inorder to do this we first combine features dataset and 2 character vectors with column number and the labels 
sensor_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]

# we assign these 563 sensor_labels as column headers to sensor_data
names(sensor_data) <- sensor_labels

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################

sensor_data_mean_std <- sensor_data[,grepl("mean|std|Subject|ActivityId", names(sensor_data))]

#################################################################################################################################################
 #Get the Activity names corresponding to ActivityId.
#################################################################################################################################################

sensor_data_mean_std <- join(sensor_data_mean_std, activity_labels, by = "ActivityId", match = "first")
sensor_data_mean_std <- sensor_data_mean_std[,-1]

######################################################################################################################
 #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################################################################

sensor_avg_by_act_sub <- ddply(sensor_data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(sensor_avg_by_act_sub, file = "sensor_avg_by_act_sub.txt")
