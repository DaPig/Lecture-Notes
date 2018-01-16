# Lecture 1
## Introducction
### 2018-01-16
---
# What is Intellegence?

## Strong and weak AI
Weak AI is to "act" intellegent. I.e. we can create machines that act intellegent.
Strong AI is that we can create machines that really are intellegent. I.e. "think".

Researchers really dont care, as they believe that the question is unessecary. 

## What is an AI system? 
Either the system thinks like a human, or act like a human. Or think or act rationally 

### Examples:
* Thinking Humanly: Should precieve and think in a same manner as a human. 


* Acting Humanly: Turing test, i.e. Computer is indistinguishable from a regular human in the way it behaves. Should be able to process questions, represent knowledge, reason and learn.
	- Total turing test, in addition to the above requirements it should also have computer vision to precieve objects and robotics to move and manipulate objects to pass the *Total Turing Test* 

* Thinks rationally: Theory provers, Should be able to rationally think. I.e. solve rational problems.

* Acts rationally:  (this is what we will mainly talk about), Acting appropriately (rationally) in different domains. 


## History of AI
The history of AI reaches back to the forties, turing released a very important paper in the fiftees. Thus, the field of AI is vey old. Many different events to further the AI field has taken place since then and are today a large field in computing. 

## Three waves of AI
AI can be split into three distinct "waves" in regards to their approach to the algorithms and learning. 

### First Wave
Handcrafted knowledge (Most AI is this, we woll mostly focus on this.)
### Second Wave
Statistical Learning (deep learning)
Most second wave AI have components containing first wave AI. 
One example of Second wave AI is image recognition of a cat. It will probobly give you the result that it can "see" a cat 

### Third Wave
Brings together first and second wave. Third wave does not only give a result to the question like second wave, but also tries to justify why the result was given. 

For example (the previous example of image recognition), it olsy tries to justify why it is a cat(it has paws, ears, etc)

## Course content
Check slides for deliverables and deadlines. Note; Exam is early. The project is the biggest part of the course.

# Agents 
An agent is something that does something (acts), for example a automated vacuum cleaner cleaning floors
## Rationality
In order to determine whether a agent function is "good" we use rationality. For this we define a performance measure which is used as a criterion for success. For example for a vacuum cleaning agent, one point for each cleaned square, minus one per movement (we want it to be efficient at cleaning, not moving). 

A rational agent maximizes the expected value of the performnance measure basing this on the history of percepts and built in knowledge. However, rational might not be successfull. 

## PEAS
This is used to specify the task enviroment. 
* Performance measure: Criterion for success
* Enviroment: Outside interactions with the agent
* Actuators: What the agent uses.
* Sensors: What sensors are included

For an example regarding an autonomous car. Check slides.

### Enviroment Types
We can categorize different enviroment types by different dimensions of complexity. For example if the entire enviroment are observable, etc.

## Quality of Solutions
* Optimal: The best possible solution one can possibly reach.
* Satisficing: Good enough solution 
* Approximately optimal: We know how close it is to the optimal solution. 
* Probable: It is likely a solution. 

## Types of agents 
* Simple Reflex: Ignores history, selects action based on current perception
* Model-based: Bases actions on models (has internal state that changes)
* Goal-based: Has internal state but has idea of what goal it wants to reach
* Utility-based: Has some way of measuring performance , i.e. how well did we do
* Learning: learns from previous experience.

# Philisophy of AI
There are a bunch of philosophical questions regarding AI.

## Is it possible?  (Strong AI)
Different opinions exist here. Some are very positive while some are very negative towards the success of strong AI. 
It is all in the definitions, what actually is "Thinking" and "Intellegence"

The most important paper of AI is "Computing Machinery and INtellegence" by Alan Turing. We should read this. 

### Brain Replacement
Can we replace a brain with AI, i.e. change the neurons to computers.

### The chinese room
If a machine can translate into chinese by a rulebook. Does the system actually understand chinese? 

## The technological singularity
Will we reach a point where the machines gets self aware and can improve themselves? 

## Ethical Issues with AI
There are multible ethical issues with AI. For example, a superintelligent AI might start a nuclear war. That is bad.


