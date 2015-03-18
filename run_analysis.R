run_analysis <- function() {
    # save data directory
    data_dir <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/"    
    
    # load dpylr library 
    library(dplyr)
    
    # Read activity labels
    act_label = read.table(paste(data_dir,"activity_labels.txt", sep=""))

    # Read features
    features = read.table(paste(data_dir,"features.txt", sep=""))
    
    # Read training data
    subject = read.table(paste(data_dir,"train/subject_train.txt", sep=""))
    y = read.table(paste(data_dir,"train/y_train.txt", sep=""))
    x = read.table(paste(data_dir,"train/X_train.txt", sep=""))
    activity = cbind(subject,y,x)

    # Read test data then merge with training
    subject = read.table(paste(data_dir,"test/subject_test.txt", sep=""))
    y = read.table(paste(data_dir,"test/y_test.txt", sep=""))
    x = read.table(paste(data_dir,"test/X_test.txt", sep=""))
    activity = rbind(activity, cbind(subject,y,x))
    
    # Assign column names: Subject, Activity then features values
    names(activity) <- c("Subject","Activity", as.character(features[,2]))
    
    # Filter activities measures to include only means and standard deviations
    cols <- grepl("mean", names(activity)) | grepl("Mean", names(activity))
    cols <- cols | grepl("std", names(activity))
    cols <- cols & (!grepl("meanFreq", names(activity)))
    cols[1:2] = TRUE
    activity <- activity[,cols]
    
    # Convert activity factor column and assign levels from act_label
    activity[,"Activity"] = as.factor(activity[,"Activity"])
    levels(activity[,"Activity"]) <- as.character(act_label[,2])

    # Compute feature means by subject and activity and save to file
    grp <- group_by(activity, Subject, Activity)
    smr <- summarise_each(grp, funs(mean(.,na.rm=TRUE)))
    write.table(smr, "activity_summary", row.name=FALSE)
    
}