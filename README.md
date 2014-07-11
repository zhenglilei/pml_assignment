pml_assignment
==============
This is the assignment work for the coursera course "Practical Machine Learning". This code is in R programming. A support vector machine (SVM) classifier is used to do the prediction.

This code is quite simple, I did not try to make complex analysis on the provided data. I only take two steps to do the prediction:

(1) omit useless data (NA values and some factor variables): number of variables is reduced from 160 to 53  
(2) an SVM classifier is trained on the training data, and then the model is used to predict the testing data

All the details are in the .r file, you can find important comments accompanying the codes.
