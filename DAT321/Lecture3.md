# Software Quality
## Lecture 3
### External Software Quality II
Today we will talk more about external software quality

## Software Inspections
Software inspections provide a way of structured reviews to find *anomalies and defects*, this can be used on all kinds of artifacts, such as the documentation, tests, code etc.
"Inspection is when you systematically review quality"

"Anything related to the software development is a artifact".

Inspections are very structured, they, for example, have roles such as Author/owner, inspector, reader etc. Inspections also follow a 6-step process.
  * Planning
  * Overview
  * Individual Preparation
  * Inspection meeting
  * Rework
  * Folow-Up
we need individual sessions in order to combat bias.

The actual inspections take place during the inspection meeting, everything before is preparation. The different steps are described below:

### Planning
During the planning phase the moderator selects the team, organizes rooms and ensures that the needed materials are present.

### Overview
During this phase the author presents the document
### preparation
Each member looks at the documents themselves.
### Inspections meeting
Here the team discusses the found defects, conformance to standars, quality of the documents etc. However, solutions are NOT discussed here.
### Rework
The auther makes changes to the document to remove the defects.
### Follow-Up
The author decides whether a re-inspection one is needed, if not the document is the *final relase*.



## Finding Defects
During the preparation, defects can be found by using checklists, grouping common problems that can be found and look at examples from books. An example of a checklist can be found in the lecture slides page 12.


The inspection is supposed to lead to a list of defects.

## Pre Conditions
THe inspection must have a precise specification, the members should be familior with the standars and the document must be syntactically correct.

## Efficiency and cost
Time is inportant, since inspections take time they can be very expensive. As such a well designed process is needed so that time is effiecient.

### Code review
Code reviews and pull requests are very important when developing to make sure that the additions does not break anything.

### Capture-Recapture
Is a strategy to estimate how many defects a software may have using statistics. We check how many faults we found that overlap, using that we can calculate an estimation of the number of total faults in the software.

## Statistic Defect Prediction

### Basics
Creating model(formula) describing the dependecy between two variables. We create a model and determine how good it is by measuring the mean square error. However, this is bad as outliers gives a large mean square error even if the model is a good approximation otherwise.

However, the further into the future one wants to predict, the less acurate the model becomes. As such one needs to remodel the model once in a while.

We can also create confidence intervals for our models. If they fall within this interval, the model is still okay. 
