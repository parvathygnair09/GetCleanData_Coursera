## Course Project - Getting and Cleaning Data
## Read the data collected from the accelerometers from the Samsung Galaxy S smartphone. Perform actions to clen ## and reshape the dataset and get a tidy, summarized version of the data.

## Ignore this part if the UCI folder is already in the working directory - Assign a working directory (edit the working directory path if required) and download the zip folder. Unzip and extract the data. 

setwd( "C:\\Users\\Parvathy\\Desktop\\Coursera\\Data Science Specialization\\Getting and Cleaning Data\\")
con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
library(downloader)
download(con, dest = "projectdata.zip")
unzip("projectdata.zip" )

## Assign the data path to the folder and get the column names file for the dataset.Read in the test and train files and assign column names simultaneously. Assuming the working directory has the 'UCI HAR Dataset' intact.

data_path <- paste0(getwd(),"/UCI HAR Dataset/")
vars <- read.table(paste0(data_path,"features.txt"),colClasses = c("integer","character"))
vars <- vars[ ,"V2"]

readfunc <- function(fname,dname){                             
        temp <- read.table(paste0(data_path,fname,"/",dname,".txt"))
        if(dname %in% c("subject_test","subject_train")) {
                colnames(temp) = "Subject"
        } else if (dname %in% c("X_test","X_train")) {
                colnames(temp) = vars
        } else {
                colnames(temp) = "Activity"
        }
        
         assign(dname, temp,envir = .GlobalEnv)
}

readfunc('test','subject_test')    ## subject file
readfunc('train','subject_train')
readfunc('test','X_test')          ## test set 
readfunc('train','X_train')
readfunc('test','y_test')          ## activity file 
readfunc('train','y_train')

## Step 1: Merges the training and the test sets to create one data set.

tidy <- rbind(cbind(subject_test, y_test, X_test), cbind(subject_train, y_train, X_train))

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

varlist <- c(grep("mean()",colnames(tidy), fixed = TRUE),grep("std()",colnames(tidy), fixed = TRUE))
tidy <- tidy[ , c(1,2,varlist )]

## Step 3: Uses descriptive activity names to name the activities in the data set.

tidy$Activity = factor(tidy$Activity, levels = c(1:6), labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))

## Step 4: Appropriately labels the data set with descriptive variable names.

names(tidy)
tmp <- colnames(tidy)
tmp <- gsub("tBodyAcc-"             ,"t.Body_Acceleration-" ,tmp)
tmp <- gsub("tGravityAcc-"          ,"t.Gravity_Acceleration-",tmp)
tmp <- gsub("tBodyAccJerk-"         ,"t.Body_Acceleration_Jerk-" ,tmp)
tmp <- gsub("tBodyGyro-"            ,"t.Body_Gyroscope_Signal-" ,tmp)
tmp <- gsub("tBodyGyroJerk-"        ,"t.Body_Gyroscope_Jerk-",tmp)
tmp <- gsub("tBodyAccMag-"          ,"t.Body_Acceleration_Magnitude-" ,tmp)
tmp <- gsub("tGravityAccMag-"       ,"t.Gravity_Acceleration_Magnitude-",tmp)
tmp <- gsub("tBodyAccJerkMag-"      ,"t.Body_Acceleration_Jerk_Magnitude-" ,tmp)
tmp <- gsub("tBodyGyroMag-"         ,"t.Body_Gyroscope_Magnitude-" ,tmp)
tmp <- gsub("tBodyGyroJerkMag-"     ,"t.Body_Gyroscope_Jerk_Magnitude-",tmp)
tmp <- gsub("fBodyAcc-"             ,"f.Body_Acceleration-" ,tmp)
tmp <- gsub("fBodyAccJerk-"         ,"f.Body_Acceleration_Jerk-" ,tmp)
tmp <- gsub("fBodyGyro-"            ,"f.Body_Gyroscope_Signal-" ,tmp)
tmp <- gsub("fBodyAccMag-"          ,"f.Body_Acceleration_Magnitude-" ,tmp)
tmp <- gsub("fBodyBodyAccJerkMag-"  ,"f.Body_Acceleration_Jerk_Magnitude-" ,tmp)
tmp <- gsub("fBodyBodyGyroMag-"     ,"f.Body_Gyroscope_Magnitude-" ,tmp)
tmp <- gsub("fBodyBodyGyroJerkMag-" ,"f.Body_Gyroscope_Jerk_Magnitude-" ,tmp)
tmp <- gsub("mean()","Mean",tmp)
tmp <- gsub("std()","SD",tmp)
tmp

colnames(tidy) <- tmp

## Step 5: From the data set tidy, creates a second, independent data set (which follows rules of tidy concept) with the average of each variable for each activity and each subject.

new <- melt(tidy, id.vars= c("Subject", "Activity"))
library(plyr)
rslt <- dcast(new, Subject + Activity ~ variable, mean)
dim(rslt)        

## Final tidy data stored in rslt. Write the tidy dataset as a text file in the work folder.

write.table(rslt, file = "TidySmartphoneData.txt", row.names = FALSE)
