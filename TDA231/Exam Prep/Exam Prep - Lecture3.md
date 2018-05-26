# Exam Prep-Lecture3 
## Linear Regression: Modelling the noice
### 2018-05-19
---
We can now create a linear model for the data described by w_o + w_1x or more complex polunomials by w^Tx. But we often have a set of residuals, or errors that makes up our noice. It is important to be able to take these into account as they serve to give us an approximation on just how exact our model is. The residuals should be randomely distributed, independant, not follow a trend and be both positive and negative. These are ususally good to be modelled by the gaussian(normal) distribution with mean mu and variance sigma^2. 

When we evaluate this density function we get the likelihood for some t. It is not a probability for continous random vars. As we know what t_n we are looking for we can maximize the function with reagards to w and sigma^2. We do this by the log-likelihood. 

We can manipulate aour parameters a bit to get an even better result. We can also compute the variance, a larger variance equal more uncertainty in our predictions. 

# Going bayesian
A way to silplify and make the calculations more streamlined and simple, we can start using bayesian quantifiers and calulations, based on bayes theorem. 

Selecting a set of w_s summing these together with a porportianal to the loss may yield a good w. 

Extending with bayes rule will allow us to get the posterior given a prior and a likleyhood. The prior is the key element to select. If we select a conjugate prior th ecomputations becomes easier. The idea is that this will yield a probability density rather that a set value for predictions, i.e. a range of values. 