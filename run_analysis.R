#Loads necessary libraries.
library(dplyr)

#Reads the data and builds a data frame for the test and the training data set.
alltest<-cbind(
    read.table("UCI HAR Dataset/test/subject_test.txt"),
    read.table("UCI HAR Dataset/test/y_test.txt"),
    read.table("UCI HAR Dataset/test/X_test.txt")
)
alltrain<-cbind(
    read.table("UCI HAR Dataset/train/subject_train.txt"),
    read.table("UCI HAR Dataset/train/y_train.txt"),
    read.table("UCI HAR Dataset/train/X_train.txt")
)

#Combines the two data sets to one.
alldata<-rbind(alltrain,alltest)

#Labels the columns.
featurenames<-as.character(read.table("UCI HAR Dataset/features.txt")[,2])
colnames(alldata)<-c("subject","activity",featurenames)

#Extracts those features that calculate
#the average and the standard deviation of the measurements.
meanandstd<-alldata[,c(1,2,grep("mean\\(\\)|std\\(\\)",names(alldata)))]

#Replaces the numbers in the activity column with descriptive names
#from the activity_labels.txt file.
label<-read.table("UCI HAR Dataset/activity_labels.txt")
meanandstd<-mutate(meanandstd, activity=label$V2[meanandstd$activity])

#Groups the data set by activity and subject and
#calculates the average of the variables.
tidydata<-meanandstd %>% group_by(subject,activity)%>% summarise_each(funs(mean))

#Creates an output file.
write.table(tidydata, "final_dataset.txt", row.name=FALSE)