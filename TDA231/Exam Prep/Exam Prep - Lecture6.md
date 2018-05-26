# Exam Prep - Lecture 6
## Multiclass Regression and intro to neural networks
### 2018-05-23
---
In the previous lecture we talked about logistic binary regression, which uses the sigmoid function to squash the output. 

A preceptron is something that takes a bunch of inputs and gives one output. THe tital likelih ood is the product of the different likelihoods for the specific datas. The Cross entropy likelihood is the sum of the log sigmoid function for all the x corresponding to label one mnus the sum of the log for the likelihood for the xs corresponding to label 0.  Thre gradient  (matrix of partial derivatives) of the cross entropy is the sum for all the xs in the label vaklue for that x minus the sigmoid function for the weight and x times the x. 

# Multiclass Regression
In multiclass regression we have K labels instead of the binary representation we have previously talked about. Each label has a value of 1 or more.  The label can be represented via a k-vector where all corresponding labels are set to 1 and 0 otherwise. 

## Softmax Regression
Softmax regression is a generalization from the logistic regression when we want to handle data with more than 2 classes. This is used to calculate the probability of having one label. 

The cross entropy calculation is also extended to handle multiple classes which is the dual sum for the labels log softmax regression

The gradient is the negative sum for the labels of the label minus the softmac regression for that point and label. 

# Feed Foward Neural network 
A FFNN have hidden layers that are computet from the previous layer. using some regression function (like the sigmoid), the parameters to the network is the weights that are used as training data. Backpropagation are used to calculate the gradients. 

## Backpropagation. 
The backpropagation aims to gice the derivative of a neural network for some parameter in the network, i.e. se the impact for the network given that parameter. This may be very time consuming to derivate in larger networks. The graident is claculated via the local gradient * upstream gradient.  If we have dual upstream branches these are summed. 

There are multible activation functions one can use other than the sigmoid. 