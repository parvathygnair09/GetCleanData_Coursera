---
title: "CodeBook.md"
author: "Parvathy"
date: "27 December 2015"
output: html_document
---


DATA DICTIONARY - SMARTPHONE DATASET

The data contains information on an experiment on 30 subjects. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

The variables in the dataset are a summary of the readings collected from the accelerometer and gyroscope 3-axial raw signals. The variables have prefix 't' to denote time and 'f' to indicate that it is a frequency domain signal.

The raw data was provided as a test and train set. This was combined along with the files for subject and activity (numbers changed to label in course) to produce a single dataset. Then, variables pertaining to mean and standard deviation were retained and others removed. Next, all the variables were renamed as descriptive of the measurement. Fianlly the data was reshaped to get a summary for each of the variables (here, mean) for each subject and each activity. The final tidy form of the data set has 180 rows and 68 columns.  

--------------------------------------------------------------------------------------------------------------
VARIABLE DESCRIPTION

Subject
       Subjects in the experiment. Ranges from 1- 30. 

Activity 
      Six activities performed :
         Walking
         Walking_Upstairs
         Walking_Downstairs
         Sitting
         Standing
         Laying

The following variables are means (summarized (means and standard deviations) from the readings collected as mentioned above) of the readings collected irrespective of the presence SD in their names. The variable description indicates the source of the vatiable reading. Variables repeated over X, Y, Z to denote 3-axial signals in the X, Y and Z directions.Again, note the variables have prefix 't' to denote time and 'f' to indicate that it is a frequency domain signal. 
    
       
t.Body_Acceleration-Mean()-X
t.Body_Acceleration-Mean()-Y
t.Body_Acceleration-Mean()-Z
t.Gravity_Acceleration-Mean()-X
t.Gravity_Acceleration-Mean()-Y
t.Gravity_Acceleration-Mean()-Z
t.Body_Acceleration_Jerk-Mean()-X
t.Body_Acceleration_Jerk-Mean()-Y
t.Body_Acceleration_Jerk-Mean()-Z
t.Body_Gyroscope_Signal-Mean()-X
t.Body_Gyroscope_Signal-Mean()-Y
t.Body_Gyroscope_Signal-Mean()-Z
t.Body_Gyroscope_Jerk-Mean()-X
t.Body_Gyroscope_Jerk-Mean()-Y
t.Body_Gyroscope_Jerk-Mean()-Z
t.Body_Acceleration_Magnitude-Mean()
t.Gravity_Acceleration_Magnitude-Mean()
t.Body_Acceleration_Jerk_Magnitude-Mean()
t.Body_Gyroscope_Magnitude-Mean()
t.Body_Gyroscope_Jerk_Magnitude-Mean()
f.Body_Acceleration-Mean()-X
f.Body_Acceleration-Mean()-Y
f.Body_Acceleration-Mean()-Z
f.Body_Acceleration_Jerk-Mean()-X
f.Body_Acceleration_Jerk-Mean()-Y
f.Body_Acceleration_Jerk-Mean()-Z
f.Body_Gyroscope_Signal-Mean()-X
f.Body_Gyroscope_Signal-Mean()-Y
f.Body_Gyroscope_Signal-Mean()-Z
f.Body_Acceleration_Magnitude-Mean()
f.Body_Acceleration_Jerk_Magnitude-Mean()
f.Body_Gyroscope_Magnitude-Mean()
f.Body_Gyroscope_Jerk_Magnitude-Mean()
t.Body_Acceleration-SD()-X
t.Body_Acceleration-SD()-Y
t.Body_Acceleration-SD()-Z
t.Gravity_Acceleration-SD()-X
t.Gravity_Acceleration-SD()-Y
t.Gravity_Acceleration-SD()-Z
t.Body_Acceleration_Jerk-SD()-X
t.Body_Acceleration_Jerk-SD()-Y
t.Body_Acceleration_Jerk-SD()-Z
t.Body_Gyroscope_Signal-SD()-X
t.Body_Gyroscope_Signal-SD()-Y
t.Body_Gyroscope_Signal-SD()-Z
t.Body_Gyroscope_Jerk-SD()-X
t.Body_Gyroscope_Jerk-SD()-Y
t.Body_Gyroscope_Jerk-SD()-Z
t.Body_Acceleration_Magnitude-SD()
t.Gravity_Acceleration_Magnitude-SD()
t.Body_Acceleration_Jerk_Magnitude-SD()
t.Body_Gyroscope_Magnitude-SD()
t.Body_Gyroscope_Jerk_Magnitude-SD()
f.Body_Acceleration-SD()-X
f.Body_Acceleration-SD()-Y
f.Body_Acceleration-SD()-Z
f.Body_Acceleration_Jerk-SD()-X
f.Body_Acceleration_Jerk-SD()-Y
f.Body_Acceleration_Jerk-SD()-Z
f.Body_Gyroscope_Signal-SD()-X
f.Body_Gyroscope_Signal-SD()-Y
f.Body_Gyroscope_Signal-SD()-Z
f.Body_Acceleration_Magnitude-SD()
f.Body_Acceleration_Jerk_Magnitude-SD()
f.Body_Gyroscope_Magnitude-SD()
f.Body_Gyroscope_Jerk_Magnitude-SD()
 
Notes: 
      1) The above variables are readings from accelerometer broken down into Body Acceleration and Gravity Acceleration.
      2) Body Gyroscope Signal reading.
      3) Measurements on magnitude and jerk on acceloremeter and gyroscope signals