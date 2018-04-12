# Lecture 4
## Conjugate Priors & Classification.
### 2018-04-10
---
Note: Gaussian distributions are the same as Normal Distributions.

The more points we gather from a gaussian distribution, the more normal it will look (Central limit theorem)

## Univariate Gaussian
The univariate Gaussian is the distribution of a single random varuable.  And have the form $N(x | \mu, \sigma^2) = \frac{1}{\sqrt{2\pi\sigma} exp(\frac{-1}{2\sigma^2}(x-\mu^2))$

## The Multivariate distribution 
The multivar. gaus. drist. refers to the probability dist for a group of random variables. 

The  N-dimensional gaussian distribution is usually the product of the one dimenstional gaussians with parameters $(\mu_{1},\sigma_{1}),...{\sigma_{n},\mu_{n}}$

We can draw the iso contours of the distribution.

To calculate a distribution we ususally takes a prior, i.e. our beliefs about the distribution, collect the data and calculate a posterior. i.e. our beliefs after collecting the data. If we select a conjugate prior, the posterior will follow the same type of distibution as the prior with form:  posterior = prior * likelihood

# Classification
For some problems, for example text or images, these are represented by fixed dimenstions, called features. All objects gathered have some of these attribures, we give these a label, for example a binary label (0,1). Input to classification is called training data which we build our algorithm from, for example for deep learning. The algorithm is then used to classify new points/input. ONe example of this is bayes classifier.
