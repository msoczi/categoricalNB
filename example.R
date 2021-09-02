# Clean Environment
remove(list=ls())

# Load R script with categoricalNB
source('categoricalNB.R')

# Read the data
data <- read.csv("data\\agaricus-lepiota.csv", header = TRUE)

# Train-test split
test_indx <- sample(1:dim(data)[1], round(dim(data)[1]/3))
y_train = data$target[-test_indx]
y_test = data$target[test_indx]
X_train <- data[-test_indx, -1]
X_test <- data[test_indx, -1]

# Create Naive Bayes model
NBmodel <- naive_bayes(X_data = X_train, y_data = y_train, lambda = 0)

# Predictions on test data
preds <- predict.nb(X_data = X_test, model = NBmodel)

# Accuracy evaluation
cat('ACCURACY\n',
'TRAIN:',sum(NBmodel$preds == as.character(y_train))/length(y_train),
'\n  TEST:',sum(preds == as.character(y_test))/length(y_test)
)

