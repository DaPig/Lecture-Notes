# Lecture 6
## Multiclass Regression and introduction to neural networkss
### 2918-04-19
---
For logistic functions we use the sigmoid function. called "sigma". THis is used to squash the output of W to lie between 0 and 1, i.e. become a probability. 

A perceptron takes a set of inputs and percieves this into an output. 

For likelihood function the likelihood for label 0 is sigma and 1-sigma for label 1. The total liklihood is the multiplacative sum of the sigmoid function for the two labels. 

## Multiclass representation
Moving into multiclass representation, i.e. more than one labels might become more difficult than for the binary representation. We can represent the K classes as a vector of K parameters, each having value [0,1] if it is "active". Softmax Regression algorithm can be used to predict the prob. of label k. 

## Feed Foward Neural Networks
In this kind of networks, a hidden layer node is computed from the previous layers, i.e. there are a depth to the network.  

## Back Propagation
In back propagateion we have a set of operations in a neural network and go back by deriving on a selection of parameters. The chain rule is very usable here. 

