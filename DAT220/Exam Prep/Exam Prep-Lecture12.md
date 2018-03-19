# Lecture 12
## Systematic Threat Analysis
---
FInding vounarabilities and potential security flaws in a system is very important. As we want to provide a safe experience for both the user and stakeholders who might lose money if the system does not work. 

One example of a methodology one can use for this is Stride

# Stride
Stride is a model based technique to systematically discover security threats in a system design. 

# DFD
Dataflow diagrams (DFD) shows how data flows through the program, the destination source and channels.
These consists of some elements
* Process: The unit of work that operates the data
* Data Flow: Named flow of data through the system 
* Data Store: A logical representation of data
* Extenal Entities: External Agents to the data. 

Creating a DFD is ususally about drawing the external entities, then we map the nodes in the deployment diagram to the data stros or processes. 

# Stride cont.
Stride consists of different categories og threats:
* Spoofing: Prentending you are someone you are not - Related to authentication
* Tampering: Modifying something you should not modify - Integrity
* Repurdation; Claiming you did not do something - Non-Repurdation
* INformation Disclosure - Exposing info to unauthorized people - Confidentiality
* Denial of Service: Overloading the system by sheer request size - Availability
* Elevation of Privilige: A user is able to do something they shouln't  - Authorization

Usually only a subset of the categories are relevant as one cannot have a perfect secure system as there exists drawbacks