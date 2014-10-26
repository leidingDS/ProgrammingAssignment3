##Cook Book for "Getting and Cleaning Data" Course Project
##

###Variable names of the data set

The final dataset is called finalData. There are 68 variables in it.

The 1st 33 variables are the measurements on the mean for each measurement.

The 2nd 33 varilables are the measurements on the stabdard variation for each measurements.

The 67th variable is the ID of subject.

The 68th variable is the name of the activity.

1. "tBodyAcc-mean()-X"
2. "tBodyAcc-mean()-Y"
3. "tBodyAcc-mean()-Z"
4. "tGravityAcc-mean()-X"
5. "tGravityAcc-mean()-Y"
6. "tGravityAcc-mean()-Z"
7. "tBodyAccJerk-mean()-X"
8. "tBodyAccJerk-mean()-Y"
9. "tBodyAccJerk-mean()-Z"
10. "tBodyGyro-mean()-X"
11. "tBodyGyro-mean()-Y"
12. "tBodyGyro-mean()-Z"
13. "tBodyGyroJerk-mean()-X"
14. "tBodyGyroJerk-mean()-Y"
15. "tBodyGyroJerk-mean()-Z"
16. "tBodyAccMag-mean()"
16. "tGravityAccMag-mean()"
18. "tBodyAccJerkMag-mean()"
19. "tBodyGyroMag-mean()"
20. "tBodyGyroJerkMag-mean()"
21. "fBodyAcc-mean()-X"
22. "fBodyAcc-mean()-Y"
23. "fBodyAcc-mean()-Z"
24. "fBodyAccJerk-mean()-X"
25. "fBodyAccJerk-mean()-Y"
26. "fBodyAccJerk-mean()-Z"
27. "fBodyGyro-mean()-X"
28. "fBodyGyro-mean()-Y"
29. "fBodyGyro-mean()-Z"
30. "fBodyAccMag-mean()"
31. "fBodyBodyAccJerkMag-mean()"
32. "fBodyBodyGyroMag-mean()"
33. "fBodyBodyGyroJerkMag-mean()"
34. "tBodyAcc-std()-X"
35. "tBodyAcc-std()-Y"
36. "tBodyAcc-std()-Z"
37. "tGravityAcc-std()-X"
38. "tGravityAcc-std()-Y"
39. "tGravityAcc-std()-Z"
40. "tBodyAccJerk-std()-X"
41. "tBodyAccJerk-std()-Y"
42. "tBodyAccJerk-std()-Z"
43. "tBodyGyro-std()-X"
44. "tBodyGyro-std()-Y"
45. "tBodyGyro-std()-Z"
46. "tBodyGyroJerk-std()-X"
47. "tBodyGyroJerk-std()-Y"
48. "tBodyGyroJerk-std()-Z"
49. "tBodyAccMag-std()"
50. "tGravityAccMag-std()"
51. "tBodyAccJerkMag-std()"
52. "tBodyGyroMag-std()"
53. "tBodyGyroJerkMag-std()"
54. "fBodyAcc-std()-X"
55. "fBodyAcc-std()-Y"
56. "fBodyAcc-std()-Z"
57. "fBodyAccJerk-std()-X"
58. "fBodyAccJerk-std()-Y"
59. "fBodyAccJerk-std()-Z"
60. "fBodyGyro-std()-X"
61. "fBodyGyro-std()-Y"
62 "fBodyGyro-std()-Z"
63" "fBodyAccMag-std()"
64." "fBodyBodyAccJerkMag-std()"
65. "fBodyBodyGyroMag-std()"
66. "fBodyBodyGyroJerkMag-std()"
67. "Subject"
68. "Activity"

###Summary choice

The summary is the result of using sapply() the mean() function for each activity and each subject.
Since there are 6 activties, 30 subjects, and 66 variables that are valid for mean(), the summary is a 180 x 66 data frame. 

###Experimental study design

1. Read the data

 The actual data is in the file X_test/train.txt. They are saved in testData (2947 x 561) and trainData (7352 x 561).

 For each data set (test/train), file y_test/train.txt contains the activity ID for each observation. They are saved in testLable (2947 x 1) and trainLabel (7352 x 1). 

 For each data set (test/train), file subject_test/train.txt contains the ID of subjects. They are saved in testSubject (2947 x 1) and trainSubject (7352 x 1). 

 Avtivity name look up tables is in file activity_labels.txt. It is saved in activityName (6 x 2).

 Feature names (i.e Label Names) is in file features.txt. It is saved in features. (561 x 2)

2. Merge the training data and test data sets to create a new data set using rbind(): data (10299 x 561)

3. Merge the activity labels of trainingg and test data, provides a descriptive column name by using rbind() and colnames(): activityDayta (10299 x 2)

4. Merge the subject ID of training and test data, provides a descriptive column name by using rbind(0 and colnamens(): subjectData (10299 x 2)

5. Use descriptive activity names to name the activities in the data set (activityData)

6. Extract the mean and std columns from feature 

7. Select data only having mean and STD from merged data set (data), save the results into meanData (33 x 1) and STDData (33 x 1)

8. Merge the meanData, STDData, sunjectData and activityData into a new data set finalData (10299 x 68).

9. Perform the aggregation (mean) on the data (finalData) for every activity and for every subject. Save the result in results (180 x 66)

10. Save the results in local file results.txt by using write.table with row.names = FALSE.
