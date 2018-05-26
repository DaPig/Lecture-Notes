# Lecture 9
## Clustering and Mixture Models
### 2018-05-09
---
We have so far only focused on supervised learning, where we know the label given some data, this hís however only the "icing" on the cake in machine learning. We often do not have the corresponding label. We can group some aspects of the data together, known as clustering. 

We will in this lecture cover two algorithms for this. K-means and mixture models.

# K means
In k-means we assume that there are K clusters where each cluster is defined by some position in the space. Each data point x is then defined by the closest cluster. Distance used is often euclidian distance. Finding the point for the cluster can either be done by guessing the points through a iterative algorithm. You then sum over the results of the algorithm untill the points do not change. 

The problems with this algorithm is that it might be hard to guess what value of K we want to use and how to pick the initial centers. We can also generalize the function to use other kernels, for example a gaussian kernel. 