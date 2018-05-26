# Exam Prep - Lecture 8
## Support Vector Machines and Kernel
methods
### 2018-05-23
---
A support vector machine (SVM) finds the decision boundary that maximizes the margin, the margin is the distance from the DB to the support vectors, the support vectors are the datapoints closest to the DB. We want to select the desicion boundary such that the line of a datapoint times the DB weights + the bias correctly classifies a given point.  WE define the classes via -1 and 1 here instead. 

To minimize w (which the maximization for the margin becomes), we can use lagrange multipliers. Derivating this expresssion for b and w and inserting into our initial problem yields a new expression which needs to be maximized. However, as we have multiple parameters in this one we need to use quadratic programming. 

The primal problem is minimizing ||w||/2  and the dual problem is maximizing the above described problem. 

The optimization will yield a bunch of lagrange multipliers, (one per support vector) which will ebeuntually yield w and thus b. We have our DB.

We can instead of a hard margin allow a soft margin, such that we accept some error in the approximation if this better fits the data's shape. We add a new term to the constraints.  This changes the dual such that we get an upper bound on the lagrange terms.  Choosing this upper bound is somewhat tricky, to high and we overfit and too low we underfit. We can choose it using cross validation.  

We can also extend this to cover more dimensions. 

# Performance Evaluation
We have now seen a bunch of different algorithms. But which one is the best? WE need some performance indicators. 

## 0/1 Loss
This is porportion of times the classifier is wrong. i.e. the number of times it is wrong / number of datapoints. BVery easy to compute but does not take class imbalance into account, i.e. if the classes have a different set of points, might be higher loss then. 

## ROC analysis
ROC, or sensitivity and specificity is more exact than the above indicator as it takes into accout all four types of outcomes, (false positives, true positives, false negatives and true negatives), the sensitivity is the true positives divided by (true pos + false meg), i.e. the porportion of correct predictions (people that are actually sick). Specitivity can be calculated via (true negs) / (TRUE NEGS + FALSE POS), i.e. the true in one class (true healthy people )

We want theese both to be as high as possible, but one needs to make a prioritization given what field we are in. 

ROC means taking a curve and checking predictions to this. The area under this curve AUC, can be calculated, the higher the better. 

# Confusion matrix
Matrix showing the number of correct and incorrect predictions. 

# Misc.
For exampel the SVM cannot always be used if the data is not formed in a specific way (perhaps if it follows a gaussian fashion), we can transform the data insted and change the dimenstions. These projections are called kernels and there exist a multitude of such kernels.
 



