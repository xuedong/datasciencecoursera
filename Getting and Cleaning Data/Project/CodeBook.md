CodeBook
========

Data
----
* The original website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Data url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variable list
-------------

Variable name     | Description
------------------|------------
xtrain            | xtrain is the data set from the X_train.txt file, which contains the training set
xtest             | xtest is the data set from the X_test.txt file, which contains the test set
x                 | x is the merge of the previous two data sets
ytrain            | ytrain is the data set from the y_train.txt file, which contains the training labels
ytest             | ytest is the data set from the y_test.txt file, which contains the test labels
y                 | y is the merge of the previous two data sets
strain            | strain is the data set from the subject_train.txt file, which contains the subjects who performed the corresponding activity for the training set
stest             | stest is the data set from the subject_test.txt file, which contains the subjects who performed the corresponding acitvity for the test set
s                 | s is the merge of the previous two data sets
features          | features is the data set from the features.txt file in which we could find all features
required_features | we then extract the required mean and std rows from the previous data set, and we call it required_features
activities        | activites is the data set from the activity_labels.txt file, which contains the six different labels of activity 
cleaned_set       | finally we bind s, y, x, and we call it cleaned_set
subjects          | subjects contains all the subjects we have, the unique function is quiet helpful here
num_subjects      | num_subjects is the number of subjects, which is 30 indeed
num_activities    | num_activities is the number of activities, which is 6 indeed
num_cols          | num_cols is the number of columns of cleaned_set, which is 68 indeed
result            | result is the final tidy data set we have