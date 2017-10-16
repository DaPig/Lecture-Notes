# Exam Prep; 
## Lecture 4
## Quality Assurance

Summary: 

---

We need quality assurance plans as the longer we stay in a development cycle, the cost increases.

The purpose of software quality assurance plans is to find the right balance between cost and the desired level of extenal quality.

IEEE and ISO both have varying definitions for software quality assurance, however, they both focus on tasks needed to provide adequate confidence that a system upholds the expected quality.

### Software Quality assurance plan
This contains the procedures, tools and techniques to reach a the requirements specified in the SRS. 
This is to contain the following
* A introduction specifying the purpose and scope for the SQAP
* A section containing management, that is the roles (who and why are various people involved) what tasks people have, description about implementation in various phases.
* A section describing Documentation 
* A section describing Requirments What measures and so forth.
* A section desctibing training 

During coding SQA refers to documentation and conformance to standards, this can be the MISRA(set of guidelines for programming in C) standard, Hungarian standard(identifier convention where name specifies the type of variable, for example long integer = lNameSomething) or Java Standard (Coding conventions)

### TEsting in SQAP
Deciding on how many test cases shall exist, what functionality shall be tested, when are testing done etc.

### Change Control Boards
Manages the process of software maintenence 

### Statistical QA
We have frevious defect data that we use to take relative measures to fix to next year. 

So for a set of faults for a given time, we can calculate a method with standard errors, use Rsquared and R^2adj to find godness of fit and finally a t test 

# Additional Book notes on QA
## Preparation Phase: 
THe first phase, one needs to understand the project. Can be based on positive indicators from the requirements and so forth. Initiial design process. The following product releases and their qualitative data follows:

## PR2
Common parameters: Design status, Estimated defect removal effectiveness, Code integration etc.

### PR3
Plan churn, FVT S curve - planned, attemped, actual etc.

### PR4 
System test and beta test : System test progress, system stability, critical problems etc.

## Evaluathion Phase
This is where we analyse the data we have selected. Can be simple like pareto diagrams or hard like multivariable equations.

## Summarization Phase
 The summaration phase is when everything is put together. Was the product satisfactory, wat was done well, what coukd be learnt to the next project and so forth.