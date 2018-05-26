# Exam Prep - Lecture 7
## Convulutional and Recurrent Neural Networks
### 2018-05-23
---
Deep learning uses artificial neural networks with many layers of abstraction, can be used for image classification, speech recognition etc. 

Basically, neural networks with hidden layers are multi layer perceptrons,  where each layer have some activation function.  

# Convolution layers
Convolution neural networks follow the same principles of a standard neural network, but with the assumption that the input is an image. A convolutipon layer is a filer that "slides" over the image, computing dot products. The depth of the filter must be the same as the image. When sliding over the image, this will yield an activation map of depth 1, and a smaller area than the initial image. If we combine several filters we get several activation maps that will yield a new image of smaller dimensions and larger depth. 

The slide speed, called stride can also be increased to minimize the number of dot products. To be able to have a larger stride and still be able to cover the image if the dimensions do not work, one can add padding to the image. with zeroes,  

The output size of a slide is equal to (N-F) / Stride +1 where N = size of image (assuming equal hight and width) F = size of filter (same assumption)

# Deep Neural Networks Applications
The applications for these kinds of deep neural networks are many, image classification and recognition, and localization.  Games, cancer detection,  autonomous driving etc. 