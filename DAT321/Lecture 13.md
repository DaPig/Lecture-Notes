# Lecture 13
### Exam Prep I
### 2017-10-16
---

This lecture we will talk about the summary of the course, that is what we have covered during the course. Further, we will go a bit deeper into statistics.

We've talked about quality characteristics.


Functionality = What the system does


Quality = How well the system performs its functionality

Quality in a professional view is quantifiable and verifyable. 

We have different versions for determining quality


### IEEE

### ISO 9126 Consists of
* Internal Metrics
* External Quality
* Quality in use: Consists of Criterias (Seen from the developers), Factos (Seen by users), Metrics
(Used as a scale for measurment.)

A *defect is the* nonfulfillment of a intended user requirement
A *nonconformaty* is a nonfullfilment of specified requirements

The different aspects of this standard: 
* Functionality
* Reliability : MAturity, fault tolerance, recoverability and compliance (what paperwork is required), the standard does not stipulate any standards for recoverability and fault tolerance.
* Usability: Understandability, Learnability, Operability, Attractiveness, Compliance
* Efficiency: Time behaviour, resource utilization, compliance {Worst case exxecution time and so forth}
* Maintainability: "A shitload of metrics". Analyzability, Changebility, Stability, Testability, Compliance
* Portability: Adaptability, Installability, Co-Existnace, Replaceability, Compliance

### Glass

# External / Internal Quality
External quality are any property that a end user will experience, reliabilitym accuracy etc

Internal quality is the properties seen by a developer, complexity, coupling etc.

## Defect Density
\# of defects / LOC
Well known property, but have undesired properties. Fault slippage is better.

### Software reliability growth modelling

F(t) = s* e ^(-t/c). Far fetched to have a general model that can be abblied out of the box to predict things. Is better to create your own model. 

When building statistical models we need to take correlation into account, OVerfitting is based on creating an almost perfect statistical model, however the predictions for this model is shit for predicting. 


### Information Criteria
How "good" a model is, weve talked about R^2, Correlation, adjusted R^2(above seven is goodish)
But as these are crude, Information criteria is nice. Like tha Aikike Information Criteria, this says how well your statsitical model will work in the future.

He expect us to know how to create linear regression, learn it lel. Takes liek 30 min. 

Process is an indication, bad process often mean bad software, but not always and vice versa. 

Sustainability. Greenability = "Degree to which product lasts over time "

26262 And 9126 we should keep track of. However focus on 9126.
