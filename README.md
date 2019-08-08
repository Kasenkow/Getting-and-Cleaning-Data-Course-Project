## Getting-and-Cleaning-Data-Course-Project
This repository is created for educational purposes of collecting, working with and cleaning data sets in R. The assignment is from Coursera's [**"Getting and Cleaning Data" course**](https://www.coursera.org/learn/data-cleaning).

## Contents of the repository:
- [**"README.md"**](https://github.com/Kasenkow/Getting-and-Cleaning-Data-Course-Project/blob/master/README.md) markdown file (the current file) – contains description of the repository, main purpose of the project, the assignment’s description, the process of files’ creation and additional information.
- [**"run_analysis.R"**](https://github.com/Kasenkow/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) script. R-script to process the data.
- [**"CODEBOOK.md"**](https://github.com/Kasenkow/Getting-and-Cleaning-Data-Course-Project/blob/master/CODEBOOK.md) markdown file. Indicates all the variables and summaries calculated, along with units and other relevant information.
- [**"LICENSE"**](https://github.com/Kasenkow/Getting-and-Cleaning-Data-Course-Project/blob/master/LICENSE) MIT-license file.
## Assignment description:
The main goal of the assignment is to prepare tidy data that can be used for later analysis.
The data that is used is from an experiment conducted for the purpose of human activity recognition using smartphones’ tracking sensors (accelerometer and gyroscope).
The assignment’s description:

*“… You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. …*

*… A full description is available at the site where the data was obtained:*
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*Here are the data for the project:*
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*You should create one R script called run_analysis.R that does the following.*

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps performed (via R-script) :
1.	The archive is **downloaded** from the [following ULR](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (addressed 7th of August, 2019).
2.	Files extracted from an **archive**.
3.	Data were **loaded** into R:
	- features’ labels,
	- subjects’ IDs,
	- main features,
	- target features, and
	- activity labels from both training and testing datasets.
Since the assignment required only the measurements on the mean and standard deviation for each measurements, data on main features were loaded only for the variables that contain the pattern “-mean()” or “-std()” (this was done in accordance with the description provided in “features_info.txt” file from the original archive).
4.	In each training and testing datasets data **merged** by columns in the following order: subjects’ IDs, main features, target feature (activity type).
5.	Training set and testing set **combined** row wise (training set first).
6.	**Column labels** assigned (“subject”, original features’ names, and “activity”). Original features’ names considered descriptive enough, their extensive description is in the “features_info.txt” file from the original archive.
7.	Instead of numeric representation, appropriate **activity names** assigned to “activity” variable (target feature) i.e., “LAYING, SITTING”, “STANDING”, “WALKING”, “WALKING_DOWNSTAIRS”, and “WALKING_UPSTAIRS”.
8.	The resulting dataset **arranged** by the subject’s id in increasing order (from 1 to 30) and named “dataset1”.
9.	From dataset1 **independent data set** was created with the average of each variable (means and standard deviations of the initial observations) for each activity and each subject: instances were grouped by activity type and subject's ids and summarized for each variable via mean() function.
10.	Both datasets (from steps 8 and 9) **written** as txt-files (“dataset1.txt” and “dataset2.txt”).

## Additional Information:

**Software version used:**
R version 3.6.0 (2019-04-26)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 17134)
dplyr_0.8.1
data.table_1.12.2

**Original source of the dataset (as mentioned on Coursera):**
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universitа degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

**Citation (as mentioned in original “README” file):**
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
