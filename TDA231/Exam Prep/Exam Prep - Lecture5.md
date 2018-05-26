# Exam Prep - Lecture 5
## Logistic Regression
### 2018-05-22
---
Continuing on the topic of classification. Where in the previous bayesian classifiers we built a model and calculated the posterior using bayes theorem, we can directly model the posterior using some parameters w. 

We've previously seen one example for this (linear), but the output from that is unbounded and thus not a probability. WE can, however, squash the output from that function to retain a number between 0 and 1 and thus get a probability. 

One example of one of these "squashing functions" is the sigmoid function. 

# Logistic Regression
Recalling the bayesian approach we define a prior, maybe the gaussian prior,  and we also have the liklihood which is the sigmoid function. But we cannot calculate the posterior as the prior is not conjugate and the marginal liklihood cannot be computed.  If we define "prior*liklehood" as a new function with the respective functions we can approximate the posterior by either doing point estimation, pure approximation via simple maths or sample from the posterior (i.e. our test data). 

#  MAP Estimate
Find the value of w that maximizes the posteror PDF. I.e. derivate with regards to w. Once we have that we can make predictions using the sigmoid function. But we cannot devivate either, meaning we have to resort to numerical optimization, for example gradient decent. A single line w can be called a decision boudary. 

If we can compute a sample of example w's we can average over these predictions to approximate the posterior density.  One example algorithm for doding this is the metropolitan hastings algorithm. 

## Metropolitan Hastings
The metropolitan hastings algorithm produces a sequence of samples for w. w_1,...,w_{n-1}. Then given the previous sample proposes a new w_n and decides whether to accept this.  The step is called proposal, maybe by modelling the sample via a gaussian distribution based on the previous sample.  The acceptance is then based on a fraction of the g-function mentioned earlier for the sample and the new point. This becomes a markov chain that will eventually end at the convergance. 