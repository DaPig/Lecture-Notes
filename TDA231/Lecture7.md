# Lecture 7
## Convolutional and Recurrent
Neural Networks
### 2018-04-24
---
Deep learning corresponds to neural network with many layers of cabstractions, these are very good for tasks such as image classification, NLP and speech recognition. 

The history of deep learning is somewhat old, however it has become more fesable in the later years. 

# Convolutional Layer
If we have an image of some porportions we can convolve a filter over the image by "sliding" over the image and computing the dot products. Doing such will yield a activation map of depth 1 (filter has the same depth as the image), you can do this for multible filters to yield a set of activation maps that can be stacked. You can also slide with a stride higher than 1 and as such yield a smaller output. If the stride does not fit we can zero pad the border. 

In 2015 the deep neural network image classification surpassed the human error rate. 

