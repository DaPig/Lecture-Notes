# Lecture 9
## Experimental Design: Blocking
### 2017-11-29
---
# Block Design
Lets hypothetically create an experiment where we want to chose a javascript framework.
### Setting up the experiment 
* Purpose: Find the javascript levels with fastest commits. 
* Factors: Framwork
* Levels: Angular, React, Jquery. 
* Dependant Variables: Time to commit (minutes)
* Parameters: Module we want to build (coding task), devlopment platform
* Blocking variables: Experience of developers 

We want to block out the experience of the developers. Thus we can remove the varience dependant on this blocking variable. 

When looking at the R results for the test. We can see that there might be a difference in languages, but to be sure we can use a post-hoc test. When doing this we want to look at the p adj. 

However what if we want to check if junior developers code faster with angular etc. 

We want to do a full factorial experiment.
When doing the anova test we use a * instead of the +, beacause then we also look at interaction effects. We can see significant results. And run a post hoc test. 

# Nested Design
