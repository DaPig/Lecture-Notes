# Lecture 5
## Logistic Regression 
### 2018-04-13
---
In bayes classifier we built a model for each of the classes and then used bayes rule to compute. 

We can model the first term in bayes rule as $f(x_{new};w)$ for some parameters w. We can use a squash function h here to compute probability. For logistic regression, the sigmoid function is used. We squash the function such that the output lies between 0 and 1 to be able to use it as a probability.

In bayesian logic we compute a prior. We can choose a gaussian prior. 

Problems however arise when trying to model the posterir. We cannot compute this. But we can compute the prior*likleyhood. We wish to maximise the posterior to find the best w^hat. This is known as maximum a posteriorin MAP. Once we have that we can make predictions with the squashibg function. Examples for algorithms to estimate w^hat are gradient descent. 


