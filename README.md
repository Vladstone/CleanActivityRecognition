# Getting and Cleaning Data Project

## Contents

* README.txt
* run_analysis.R: R script file 
* CodeBook.md: Code Book for tidy dataset 

## Overview

Project reads mean and standard deviation measures from accelerometer and gyroscope readings on wearable devices. These devices record movement and acceleration for various activities.  There are 30 subjects, 6 activities and 75 device measurements. The subjects are split between a training and data group. These are merged in the tidy data.  Running the script run_analysis against the the raw dataset produces a tidy dataset named activity_summary.txt. The Code Book describes it's variables.

## Steps to Create Tidy Data File activity_summary.txt

1. Download raw zipped dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip dataset to current working directory.
3. Make sure dplyr library is available in your R environment. Install from CRAN.
4. Load script: load(run_analysis.R).
5. Run script: run_analysis(). File activity_summary.txt is created in your working directory.

## Notes

1. Measures with mean and std are included in tidy data. Ignored those with Mean as they are angle measurements between means.
2. Used names in features.txt as column names for the tidy data, but renamed columns 516-554 to remove the duplicate "Body" from the label (fBodyBodyAccJerkMag to fBodyAccJerkMag).