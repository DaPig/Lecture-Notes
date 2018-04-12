# Lecture 3
## Modelling the noice
### 2018-03-27
---
The whole language of machine language is matrices and min/max thus we need linear algebra and 


# Errors
We should model the errors as we do not want to ignore them. This would tell us how confident our predictions should be. We assume that the noice is addative. It is different for each n and positive and/or negative. People in deeplearning often forget to model the values, and only return one value. You should return a set of values in a confindence interval. 

We need to choose the distribution for the random variale which is the error parameter. A good one is the Gaussian distribution. 

# Gaussian Noise Model
Model the errors via $tn = W^t * x + epsilon_n$

# Likelihood
The higher the likelihood, the better the model is. For each input response pair, wes have a gaussian likelyhood. Optimizing the the likelehood can be done to create a better model. The logarithm is here(machine learning) the natural logarithm. 

One shortcut one can take is to use the multi-variate gaussian distribution. 

# Optimum Parameters 
Our aim is to make predictions. THe noice renders us unable to make exact predictions. Taking a lower prder model we often get more noice. Taking a complex model we do not define the prameters right. 

# Going Bayesian
The problem with point estimates is that there may be more than one best value, different values give different predictions etc. We can use bayers rule as a base for creating a good approximation.


