##################################################
# Getting and Cleaning Data                      #
# Week 4 Project                                 #
# Tim J. Annable                                 #
# 5/23/2017                                      #
##################################################


library(dplyr)


#load data sets
xtest<-data.frame(read.table("X_test.txt"))
xtrain<-data.frame(read.table("X_train.txt"))

#load activities
ytest<-read.table("y_test.txt")
ytest<-ytest$V1
ytrain<-read.table("y_train.txt")
ytrain<-ytrain$V1
activitylabels <- read.table("activity_labels.txt")

#load subjects
subjecttest<-read.table("subject_test.txt")
subjecttest<-subjecttest$V1
subjecttrain<-read.table("subject_train.txt")
subjecttrain<-subjecttrain$V1

#load column names
features<-read.table("features.txt")
features<- features$V2

#assign column names to data sets
colnames(xtest) <- features
colnames(xtrain) <- features

#add activity and subject to data frames
xtest <- cbind("Activity" = ytest, "Subject" = subjecttest, xtest)
xtrain <- cbind("Activity" = ytrain, "Subject" = subjecttrain, xtrain)



#merge the data frames
xmerged <- rbind(xtest, xtrain)

#update activity labels
xmerged <- merge(xmerged, activitylabels, by.x = "Activity", by.y = "V1")
xmerged$Activity <- xmerged$V2



#clean up memory before tidying
rm(list=setdiff(ls(),"xmerged"))

#identify columns contatining a standard deviaiton or mean

stdcols<- grepl("std()", colnames(xmerged), fixed=TRUE)
meancols<- grepl("mean()", colnames(xmerged), fixed=TRUE)


#create merge column list
selectedcols<- stdcols | meancols

#keep activity and subject
selectedcols[1:2] = TRUE

#finalize the column selection and save
xmerged <- xmerged[,selectedcols]
write.table(xmerged,"part1.txt",row.name=FALSE)

#group by activity with the mean and save
xbyActivity<-aggregate(xmerged[,3:68],list(xmerged$Activity), mean)



#group by subject and save
xbySubject<-aggregate(xmerged[,3:68],list(xmerged$Subject), mean)
xbySubject$Group.1 <- paste("Subject", xbySubject$Group.1, sep = " ")

xGrouped <- rbind(xbyActivity, xbySubject)
write.table(xGrouped, "Part2.txt", row.name=FALSE)

#clear memory
rm(list=ls())

