---
title: "CodeBook"
author: "Soundari Sureshanand"
date: "Saturday, May 23, 2015"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

##header2 Variables into which the file contents from both the training and test datasets  are copied 

feature_file from features.txt
activity_labels_file from activity_labels.txt
x_train_file from x_train.txt
y_train_file from y_train.txt
subject_train_file from subject_train.txt
x_test_file  from X_test.txt
y_test_file  from y_test.txt
subject_test_file from subject_test.txt

###header3 Data frames into which the raw data loaded into datasets in the same order as above

features 
activity_labels 
x_train 
y_train 
subject_train 
x_test 
y_test 
subject_test 


training_sensor_data is the training dataset 
test_sensor_data is the test dataset
sensor_data combined dataset of training_sensor_data, test_sensor_data

 
sensor_labels is a character vector of all the labels for column headers of the combined dataset sensor_data



sensor_data_mean_std is a subset of all the columns of the sensor_data that contains one of the following words as a substring of its column header 
mean
std
Subject
ActivityId


sensor_avg_by_act_sub is a tidy data set that provides the average of each Subject and each Activity


sensor_avg_by_act_sub.txt is the text file in which the tidy dataset sensor_avg_by_act_sub is written as a table 






```




