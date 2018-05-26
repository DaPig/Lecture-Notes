# Exam Prep - lecture 9
## Clustering and Mixture Models
### 2018-05-24
---
All we've seen so far is supervised learning, but as we previously have mentioned, that is only the "cherry on top" of what is machine learning. Often you might not have a clear distinction of what data corresponds to a class.  Grouping this kind of data is called clustering and is a kind of supervised learning. 

There are several different algorithms, two of them are called K-means and Mixture models. 

# K Means
Starting of with the K-means algorithm. Each cluster is defined by a position in the input state (sorta like a mean point in 2D space). Each datapoint x_n is then assigned to the closest cluster in the input space. The distance is the euclidian distance. 

Finding the mean position for the clusters is the important thing, as it is unsupervised we cannot write these as a function. What we need to do is to use an iterative algorithm. 

The iterative algorithm works by firstly selecting random mean points (mu_k) (guessing), assigning each datapoint to the closest mean point, then recomputing the mean value and so forth untill the algorithm converges, i.e. when the assignments do not change. The assignment is based on an assignment vector where the z_k position is 1 if assigned to mean k and 0 otherwise. 

There are two issues with the k-means algorithm, firstly, selecting k might be difficult, how do we know how many clusters exist?  And also how should we pick the initial center points? These both introduce somewhat of a "bias" in the algorithm that changes the outcome. 

The first second can be combatted by seleicting k random points, take random from input or assign the data to k random groups and taking the center of these., etc



There is one specialization of this algoritm called kmeans++  where you start with a random point and then select points based on a probability distribution, gives a quick approximation. 

Selecting k can be done by eother intra-cluster variance, where you select k to minimize the variance. 

As Kmeans may be subject to local minimas we can use sum of norms convex relaxation to make a tradeoff between having k mu and the same mu. 

# When does it brake
Kmeans fail when you cannot select suitable clusters and the clusters cannot be described by a single point, for example when the data has a gaussian form, in the support vector machine we could do some transformation, the idea here is the same, use a kernel that specifies distance differently and mean summation differently. 

The algorithm now insted becomes to select a kernel and the nessecary paramters, start with a random assignment, assign points to nearest center by the new distance calculation, if the assignemnts have now changed, redo otherwise it has converge, cool beans. 

This makes the kmeans more flexible but has the drawback of setting more parameters that may influence the outcome significantly. 

