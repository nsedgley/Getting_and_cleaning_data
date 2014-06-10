#this script requires the package "doBy" to be loaded in the library
#read test data
X_test <- read.table(file.path("UCI HAR Dataset", "test","X_test.txt"),header=FALSE,sep="")
y_test <- read.table(file.path("UCI HAR Dataset", "test","y_test.txt"),header=FALSE,sep="")
subject_test <- read.table(file.path("C:","Users","nsedgley","My Documents", "GitHub","Getting and cleaning Data","UCI HAR Dataset", "test","subject_test.txt"),header=FALSE,sep="")

#read training data
X_train <- read.table(file.path("UCI HAR Dataset", "train","X_train.txt"),header=FALSE,sep="")
y_train <- read.table(file.path("UCI HAR Dataset", "train","y_train.txt"),header=FALSE,sep="")
subject_train <- read.table(file.path("UCI HAR Dataset", "train","subject_train.txt"),header=FALSE,sep="")

#combine test and training data
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

#Descriptive names for variables
features <- read.table(file.path("UCI HAR Dataset", "features.txt"),header=FALSE,sep="",stringsAsFactors=FALSE)
names(X) <- c(features$V2)
names(y) <- c("activity")
names(subject) <- c('subject')

#recode activity as a factor with labels from activity_labels.txt
activity_labels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header=FALSE,sep="",stringsAsFactors=FALSE)
y <- factor(y[,1], labels=activity_labels[,2])
y <- as.data.frame(y)
names(y) <- c("activity")

#put it all together in 1 data frame 
data <- cbind(subject,y,X)

#keep data on means and SD 
data <- data[, c(1,2,3:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,255,256,268:273,347:352,426:431,505,506,531,532,544,545)]
names <- names(data)
names(data) <- c("v1","v2","v3","v4","v5","v6","v7",'v8',"v9","v10","v11","v12","v13","v14","v15","v16","v17","v18","v19","v20","v21","v22","v23","v24","v25","v26","v27","v28","v29","v30","v31","v32","v33","v34","v35","v36","v37","v38","v39","v40","v41","v42","v43","v44","v45","v46","v47","v48","v49","v50","v51","v52","v53","v54","v55","v56","v57","v58","v59","v60","v61","v62","v63","v64","v65","v66")
# collapse the data on means by subject and activity           
data <- summaryBy(v3 +v4 + v5 + v6 + v7 + v8 + v9 + v10 + v11 + v12 + v13 + v14 + v15 + v16 + v17 + v18 + v19 + v20 + v21 + v22 + v23 + v24 + v25 + v26 + v27 + v28 + v29 + v30 + v31 + v32 + v33 + v34 + v35 + v36 + v37 + v38 + v39 + v40 + v41 + v42 + v43 + v44 + v45 + v46 + v47 + v48 + v49 + v50 + v51 + v52 + v53 + v54 + v55 + v56 + v57 + v58 + v59 + v60 + v61 + v62 + v63 + v64 + v65 + v66 ~ v1 + v2,data=data)
names(data) <- names
write.csv(data, file="project_data.csv")