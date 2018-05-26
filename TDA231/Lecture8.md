# Lecture 8
## Support vector machines and Kernel methods
### 2018-04-27 && 2018-05-04
---
Several of the algorithms we've seen so far intend to maximize something, like the likelihood or posterior, or minimize the loss. A support vector machine intends to maximize the margin.

## What the hell is a margin? 
A margin is the perpindicular distance from a decisions boundary to the closest points on each side. I.e. a dicision boundry splits data points that can be classified into two different labels into two by a straight line $w^Tx + b = 0$. The distance from this line to the closest points are the margin. In regards to the margin there is going to be one best boundary. The margin can be computed via $2\gamma = \frac{1}{||w||}w^T (x_1 - x_2). Refining this eventually yields 
\[\gamma = \frac{1}{||w||}\].

We as such want to maximize this. I.e. minimize ||w||. Langrange multipliers can be used for the minimization. This yields a very complex optimization problem which can be solved via quadratic programming. 

THe closest vectors to the margin are called support vectors. This may cause sparseness. I.e. tight margins. However, we can relax constraints to combat this. 

We get a new optimization problem which is reliant on C, c is very importatn, to high and we overfit, too low and we underfit. 

# Performance Evaluation 
WE need to be able to select which of the classification algorithms are most suitable for a given case. As such we need performance evaluation, three different approaches to this are 0/1 loss, ROC analysis and Confusion matrices. 
 0/1 loss
This is an indication of the porportion of times the classifier is wrong. i.e times wrong / total cases. Simple to calculate but does not take account class imbalance into account. 

## Roc analysis (Sensitivity and specificity)
This analysis is based on true and false positives and (TP, FP) true and false negatives (TN, FN). And states S_e = TP/TP+FN. i.e. the porportions of the population fulfilling the trait that we correctly diagnose. and S_p = TN / TN+FP i.e. the porportion of people not having a trait we classify as not having trait. Goal is to optimize these two. 

## Confusion Matrices
The two fractions mentioned above can be inserted into a table to see the error and such. 

# Kernels

## Projections
SO our support vector machine can find linear decision boundaries, but what if our data requires something else? What if the data can only be bounded by a circle? In that case we can transform the data, for example by placing a coordinate system in the middle and classify the data based on their distance to origo. Then the decition boundary can be classified by a straight line. We an use kernel functions (that are dot products in some space) to not have to project the data. There are several off the shelves kernels that we may utalize. 

