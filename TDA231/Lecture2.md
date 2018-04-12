# Lecture 2
## Multivariate and non-linear models
# 2018-03-19
---
Last time we checked out a problem that consisted of predicting olympic winning time in 2012. We have severaö tupels of data (x,y) pairs. We wish to predict y_new given x_new. We build a Linear model and calculate the average loss which tells us how good the model is a s a function of w0 and w1. we want to find w0 and w1 such that the average loss is the smallest. Seeing as this is so simple we can find the exact solution. With more parameters it becomes harder. 

Linear models can be discussed via using vector forms. Linear algebra is important. In general, there are many variables in models, making them somewhat harder. 

---
Given a complex, polynomial model we define the loss, differentiate the loss with respect ti every parameter (k+1 for k x^k)
It is very tedious, a simpler way of calculating this is to use matrix or vector form instead. 

Vector form captures all types of model to the power of k.  Its general AF.

Matrix inverses are cool. However, sometimes a matrix does not have an exact matrix inverse. 

Choice of model is very important. Higher order models are not always better, predicting may be super bad. 

For example, Youtube have millions and millions dimensions they work with, we will see their predictions later in the course. 

It is hard to validate that a model works for predictions. For example via overfitting. To combat this we can cross valiadete. Ie use a section for training and a section for validating the model.


There are different approaches to cross validaiton. One of which is "leave one out"
