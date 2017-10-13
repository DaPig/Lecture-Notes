# Exam prep
## Lecture 3
### Extrernal Quality II

Summary:

---
# Keywords 
 * Software Inspection: Inspecting the softwareto assess its' quality.


## SOftware Inspections 
Provides a way of structured Reviews in order to find anomalies and defects.This do not require execution and can be used for all kind of sotware artefacts.

Software Inspections are very structured and contain several people with different roles. 
* Authors: They are responsible for the document to be reviewd and to fixing the defect after the review.
* Inspector: Finds erros, inconcistancies and so forth in the document, can also find defects outside the scope of the review.
* Reader; presents the document during inspection meeting 
* Scribe: Records the results for the meeting.
* Moderator: Moderates the work and facilitates the inspection.

The software inspection consists of several steps.

### Planning
Moderator selects inspection team, organizes materials and selects room etc.

### Overview & Preparation.
Author/Owner presents the document and describe the intention and purpose of the meeting.

Preparation is where each individual studies the the document to find defects.

### Inspection Meeting
This is where the formal inspection takes place, the team discusses defects found, conformance to standards, document quality etc. However, the team should not present solutions or changes. 

### Rework & Follow up
The owner fixes the document to remove defects and for the follow up the moderator decides whether a reinspection is needed. otherwise the moderator allowes the release for the final release.


### Techniques 
In order to find defects in preparation one can provide the readers with tools such as checklists, grouping common problems to check, examples and so forth. The outcome of the inspection is a list of faults needed to be corrected. 

This is a very expensive process as developers are expensive as fuck and it is very time consuming.

## Code Reviews
Another way of inspecting software can be code review, where people review code before it is submitted, for example on GIt. It is crucial to have clear merge stratergies so that everything follows the same guidelines.

## Capture Recapture
Another way of inspecting software is capture recapture. Where statistics is used to try to approximate how many defects a software artifact will have at a given time. Here two independant reviewers review software and find defects, we calculate how many defects overlap and can as such approximate the total number of defects.

## Statistical Defect Prediction
We can use statistics to approximate the total number of defects at a given time for a software artefact. THis is done by mathematical modelling. Where we use data (like defects/LOC) to generate a model which is used to approcimate the number of defects on a given time. 

## Ortogonal Defect Classification
The goal of this method is to classify the defects in order to distinguish them early. That is *Time ti pinpoint* the the solution, the correctness of the solution and he time to provide the solution. ODC have two fundamentals, *Opening*, when the defect was detected, and *Closing* when the defect was investigated. This can be split into two modes, in process and in field

In process you determine what effect the defect *would have* on the customer, in field, *what* effect it had.

## Root cause analysis
RCA is used to find the root cause of defect, and thus prevent the defects from reappearing. Consists of the steps: 

* Define the defect and understand it 
* Collect data for defect; proof, how long it did exist
* Identify contributing factors 
* Identify the root cause 
* Remove cause, implement improvement.

There are different techniques for RCA:
* Barrier analysis: Based on tracing energy flows and find barriers and distinguish why these barriers did not prevent the energy from causing harm.
* Casual factor Tree analysis - Display causal factors in tree structures to find cause-and effect factors.
* Change Analysis - Compare alternative timeline where defect did not occur with the one that it did and see the differences that occured and thus why the defect occured, 
* IShikawas diagram - Causes are grouped into categories and linked together. The relatiomships are then used to backtrack to find cuase.
* FMEA, Fault tree, Pareto diagram, 5 whys - asking why 5 or more times to find root cause.