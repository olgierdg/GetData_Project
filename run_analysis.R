if(!dir.exists("UCI HAR Dataset")){
    
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    download.file(fileUrl, destfile = "./getdata-projectfiles-UCI HAR Dataset.zip")
    
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("featureid","featurelabel"))

wantedfeatures <- grepl("mean|std", features$featurelabel)

activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityid","activitylabel"))

subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subjectid")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
names(Xtest) = features$featurelabel
Xtest <- Xtest[,wantedfeatures]
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityid")

testset <- cbind(subjecttest, Xtest, ytest)
testset <- merge(testset,activitylabels)

subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subjectid")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
names(Xtrain) = features$featurelabel
Xtrain <- Xtrain[,wantedfeatures]
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityid")

trainset <- cbind(subjecttrain, Xtrain, ytrain)
trainset <- merge(trainset,activitylabels)

dataset <- rbind(testset,trainset)

to.remove <- c("activityid","activitylabel","subjectid")
`%ni%` <- Negate(`%in%`)
datasubs <- subset(dataset,select = names(dataset) %ni% to.remove)

tidyset <- aggregate(datasubs, by = list(activitylabel = dataset$activitylabel,subjectid = dataset$subjectid), mean)

write.table(tidyset, file='tidydataset.txt', row.names=FALSE)