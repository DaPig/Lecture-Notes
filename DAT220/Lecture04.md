# Lecture 4
## Software architecture and quality requirements
### 2018-01-29
---
Today we will talk about the importance of quality requirements, and understand how to characterize these. 
There is a set of video lectures one can watch on the topic if one wants to. 

# Requirements 
Requirements defines the project, these can be split into 

## Functional Requirement 
The functionality a product should have
## Quality Requirement
How well the product fulfills it's functionality, such as efficiency and usability etc. 

## Task one; Write quality requirements for a studend admission system
The connection to the system should be encrypted such that potential security flaws are reduced to a minimum. 
THe system should be stable under heavy load and have a high uptime even in situations of many connections. 
The system should save data intermediately so that connection lost does not mean that the progress of a user is lost. 

## What drives software architecture? 
System requirements and constraints, constraints should not be overlooked. 

# Why are quality requirements important? 
Quality attributes determines the components of the software. 

# As a software architect
You are expected to design architecture that includes the important functionality while also being coherent with the expected qualities. 

# Types of qualities
Examples of qualities are system, business and architecture qualities. 

# Functionality and quality are realated
Quality requirements specifies constraints witch places limits on metrics which defines the attributes of a function in a functional requirement.  A quality attribute should be measurable and testable, thus defines the acceptable values of the quality attribures that should be present in the system. 

Read chapter 5, 8 and 9 before lab