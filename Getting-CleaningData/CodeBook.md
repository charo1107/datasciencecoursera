
Codebook
========
Codebook was generated on 2018-03-25 18:30:23

Process
------------------------------
The `run_analysis.R` performs the following steps to clean the data:

 1. Read X_train.txt, y_train.txt and subject_train.txt to *TrainData*, *TrainLabel* and *TrainSubject*.       
 2. Read X_test.txt, y_test.txt and subject_test.txt to *TestData*, *TestLabel* and *Testsubject*.  
 3. Concatenate *TestData* to *TrainData* to get, *Data*; concatenate *TestLabel* to *TrainLabel* to get, *Label*; concatenate *TestSubject* to *TrainSubject* to get, *Subject*.  
 4. Read the features.txt file to a variable called *Features*. Extract the mean and standard deviation. 
 5. Remove the "()" and "-" symbols in the names, make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.   
 6. Read the activity_labels.txt file to a variable called *Activity*.  
 7. Clean the activity names in the second column of *Activity*. Make all names to lower cases.  
 8. Transform the values of *Label* according to the *Activity* data frame.  
 9. Combine the *Subject*, *Label* and *Data* by column to get, *DataClean*. Name the first two columns, "subject" and "activity".   
 10. Write the *DataClean* to "data_clean.txt".  
 11. Generate a second data set with the average of each measurement for each activity and each subject. Calculate the mean of each measurement with the corresponding combination.
 12. Write the *x* from the calculation out to "data_finish.txt". 
