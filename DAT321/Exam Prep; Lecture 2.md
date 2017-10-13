# Exam Prep;
## Lecture 2

---
SUmmary:  This lecture is all about measuring external quality on a high level, as well as some growth models and tools for determining quality.

Keywords: 
External software quality: External quality mean all the properties of the software as a project that customers can enjoy, that is Conformaty to their expectations. For example, reliability accuracy and so forth.

Internal QUality: Internal quality mean all the properties of a product that the developers see, so for example, coupling, cohesion and so forth. 

We as a developer look at defects of the product. THis is something that does not behave as expected, can be due to a fault or an error or other cause. THe defect can be in several different states, depending on where it is in the "patching"-cycle. The different stages are: 
	* Submitted (S) - The bug have been discovered and are submitted to be fixed
	* Assigned (A) - Some developer has started looking into the defect
	* Investigated (I) - THe developer have finished looking into the defect
	* Resolved (R) - The defect have been resolved
	* Verified (V) - 
	* Validated (Z) - 
	* Closed (C) - The defect is solved and finished

The status of the defect changes over time, and can change forward and backwards. 

### Externac Quality Metrics
In measuring external quality, we have some different metrics we can use to measure the overall quality, examples include 
	* Defect inflow - Hom many defects are subbmitted per time unit 
	* Defect Density - Defects/LOC
	* Defect Backlog - How many defects are yet to be resolved.
	* Mean time to failure - Expected time to be in production untill next failure.
	* Customer Problems - Tickets kinda
	* Customer Satisfaction - Is the customer satisfied with the product, can be elicited via questionaires.
--- 
Fault slip through: How long a defect manages to stay "hidden" during development untill it is found.So that is, from when it is expected to be found untill it is actually found.
Backlog management index: number of defects closed / number of defects opened * 100%. Gives a good indication on the quality of fixing bugs

## Software Reliability & Growth models
Software Reliability: The system can perform it's tasks without crashing. THis is a parametric statistical model describing the discovery of defects. For this we do some assumptions. 

Examples of growth model are: Convex (early defect inflow), Concave (late defect inflow) and S-shaped (defect inflow is are the highest in the midst of the project.) There are a bunch of different software reliability growth models one can use.

Additional useful SRGM terms: 
	* MSE - Mean Square Errors, the sum of the difference for the actual value and projected value squared devided by number of data points. Not good for outliers
	* MAE - Mean absolute error, the sum of all the absolute differences divided by number of point.
	* R^2 Can be used to validate models, 
	* K - fold cross validation. Split into k sets, use one for training and the rest for testing.
Which model is best is dependant on the project, there is no overall answer.

# Isikawas Seven basic tools.
These can be used to get data for external quality. THey are vary basic and consists of
	* Checklist - Customer checks boxes if they are fulfilled.
	* Pareto diagram - Number of defects per module ordered by decending. Y = number of defects, X = module
	* Units Histogram - Determines the percentage of defects in determined intervals, for example serverity. Y = number(percentage) X = interval
	* Run chart - The percentage of number of defects inflow per unit of time.
	* Scatter diagram - Illustrate co-dependancy between data series, for example number of defects at a day.
	* Control chars - Kinda like scatter but to show what data points lies outside a pre determined limit.
	* Fishbone - Shows potential causes and their influence on outcomne. Used for ROot cause analysis.

--- 
# Other keywords from the book
## Chapter 4: Software QUality Metrics Overview
### Project metrics - Project characteristics, number of software developers, life cycle of software etc


### Intrinsic Product quality = number of defects (bugs)

Function points are also a measure of size. Simular to LOC, however, this is based upon measuring functions and their parameters.
