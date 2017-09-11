# Software Quality
## Lecture 4
### Quality Assurance
#### 2017-09-11

The main problem we have with quality Assurance is that customer want a high quality product, but that costs money. As such Software quality Assurance is how a company handles this tension. And how they balance the cost/quality conundrum.

IEEE and ISO9000 have their own definitions of quality Assurance.

Collecting metrics for assuring quality are very expensive, as such companies may be reluctant to collect these as the return of investments are very low.

"Every system has a bug, even those you pour a shitload of money on it"
- -Lecturer

A software quality assurence plan covers development testing and maintenence for the software, also covers management, documentation, SQA requirements, training etc..

There are a multitude of different parameters and measurments of quality one needs to consider when doing quality assurence on a large scale, for example. resource use, learnability etc.

There are some different source code standards. MISRA, hungarian and JAVA - notations

Testing in SQAP requires answering to several questions, for example how many test cases one need ands so forth, however, these questions might be hard to answer. One needs to remember that once a software
has been released it is tested again (in production).



-----------

## Statistical Quality Assurance
We can use statistics in quality assurance. As such we collect a bunch of data during some span of time, categorize and classify them on severity, then we check how the number of defects have changed once solutions have been made to reduce the number of defects. If the p-value is lower than 0.05 then there is a Statistical significance. That is good.


## Models
Why do we use statistical models in software quality. To try to predict the future. We can see that there is almost a linear correlation between lines of code and # of defects.

We check if there are any outliers and if there are cases for them we can remove them. We also check if the data is normally distributed. Otherwise we can create a model. For that we need to calculate some sums.  A typical model is

y(hat) = alpha(hat) + x*beta(hat) + epsilon
For the formulaes, check slides.

For calculating the epsilon we check the standard deviation for the regression.  
