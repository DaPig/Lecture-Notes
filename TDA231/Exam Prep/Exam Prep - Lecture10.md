# Exam Prep - Lecture 10 
## Mixture models and expectation maximization algorithm
### 2018-05-24
---
If we have the K means algorithm we can relax the constraints so that the assignments can be between zero and one, i.e. a percentage to each cluster. 

We can explain the data by a probabilistic model by learning the parameters of the model for the given data. The focus is the gaussian mixture model.  

# Mixture models 
A mixture model is a mixture of a number of probabilistic densities. Each distribution is a component of the total model. In the gaussian case the component is given by the mean and covariance.  Each component is complemented by a mixture coefficient mu that gives the probability of each component. 

As the task is to learn the unkown parameters, in the gaussian case this corresponds to learning mu, covariance matrix and the mixture coefficient such that it maximizes the liklihood for the given data. The total likelihood for a datapoint is then the product for all the components. 

As we want to maximize this we take the log-likelihood and use expectation maximization. We introduce latent variable like a assignemnt vector to be able to maximize it. 

We first take some initial values for the means and mixing coefficiant, and then alternate between computing posterior and estimate the model parameters. 