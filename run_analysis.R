# Start the plyr package

library(plyr)

# Load the activity names 
activities <- read.table("./activity_labels.txt")

# Load all the data (previously organized in one folder)

x_train <- read.table("./X_train.txt")
y_train <- read.table("./y_train.txt")
subject_train <- read.table("./subject_train.txt")

x_test <- read.table("./X_test.txt")
y_test <- read.table("./y_test.txt")
subject_test <- read.table("./subject_test.txt")

  # Bind new datasets

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

  # Read subject datasets
subject_data <- rbind(subject_train, subject_test)

  # Check for the mean and std values

features <- read.table("features.txt")

  # does the column has mean or std ?

mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

  # subset the desired columns
x_data <- x_data[, mean_std]

  # correct the column names
names(x_data) <- features[mean_std, 2]

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column names

names(y_data) <- "activity"
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# New tydy dataset

average <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(average, "average.txt", row.name=FALSE)