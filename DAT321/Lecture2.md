# Software Quality
## Lecture 2
### External software quality
#### 2017-09-04

External software quality is measured when the software is running, as such what the user can enjoy. Such as reliability and accuracy.

The alternative is the internal quality that we as developers usually see, such as simplicity and such.

The ISO9126 standard contains quality characterisitics for both internal and external software quality.

According to this standard there are various words for what a problem in a software may depend on

* A Fault is related to the code,
* Failures are errors that occur when the program runs. (As such, one or more fault may lead to one or more failures)
* Errors are related to the users. When they have caused the defect.

In industry all these are usually seen simply as a defect or a 'bug'.

During development, defects can exist in several states, submitted, assigned ... validated, closed. These states change during the development cycle.

As such, all defects have a lifecyle, from open to closed.

## How do we measure software quality?
* Defect Density: Can be calculated as * DD = # of defects / LOC(Lines of code) * However this may not be a clear definition since lines of codes are a crude variable and that LOC is dependant on programmer language. THe main disadvantage is that once a software is released and users start finding bugs, metric will look very different from the development data.

* Defect Inflow: Can be measured as * DI = #of defects reported during a week*. This is not reliable as it depends on humans.

* Fault Slip Through(FST): A set of measures describing effectiveness of testing. Once a fault is found one looks whether the fault could have been found, the fault latency is the amount of time from when the bug was introduced untill it was found. This allows the company to distinguish where they need to focus resources in order to combat these kinds of faults.

* Backlog and backlog management index: * BMI = #defects closed / #defects opened*. Is widely used during maintenence phase. Gives a good indication of the support of a product. Not applicable in some industries, such as the autonomous industry, given saftey.

--------Sidebar----------

Verification: "Are we building the product right?"

Validation: "Are we building the right product?"

A defect can be anything that is wrong in any artifact surrounding the software development, for example a typo in the requirements, or a syntax error in the code.

## Software Reliablity Growth models
This is basically statistical models in order to try to "predict the future"
### Software Reliablity
How well a system performs its intended functions without experiencing failures.

One can calculate the reliability using modelling. Check slides for equation and more info.

There are different types of reliability growth models, such as concave or s-shaped etc.

When developing a model for determine software reliability we can use the mean square error metric. THis is one way to determine how goo the data supports our model. However, what happens if we hava datapoints way off? We get a poor value, as such we shoukd use the absolute value instead of squaring the errors. As such, focusing on the median may be a better approach.

We could use the AIC(Akaike Information criterion) to measure the complexity of a model.

When developing a model we need to make a tradeoff on how much of the available data we want to use as a traning and testing data set. Larger training set=better original model.

If we sample from a sample enough times, the data will follow a normal distribution.

When using a k-fold cross validation we devide the data into subsets. Train using one subset and test the model using the other data sets. THen we do the same for each subset.

### Bootstrap
Bootstrapping is used to asses models. Basically using random sampling with replacement.
This is very hard

### Isikawa's seven basic tools
This contains seven standard tools to determine software quality. Such as histograms, checklists etc.

Tip: Outliers can be handled by doeing the experiment more than once and seeing whether the outliers are consistent. If not, there is usually some reason behind it. As long as there is a valid explanataion for the outliers, they can be removed.  
