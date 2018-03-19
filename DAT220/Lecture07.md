# Lecture 7
## Software archetecture patterns 
### 2018-02-08
---
When creating software architecture, two key questions arise, how can we describe the architecture, and what is the process to create it. 

Software engineering consists of abstraction, modularity and separation of concerns. 

# Styles and patterns 
Software architecture can be split into different styles & patterns.

## DSSA (Domain specific software architecture)
Focus the architecture into different domains to constrain the problem space. for example by splitting a Robot software into different layers such as user interface planning etc, 

## PAtterns
There are also a bunch of architecture patterns one can use when creating a software architecture. Examples include
* State-Logic-Display: Cluster elements that change at the same rate. 
* Model View Controller
* Presenter View: Different views can be used for the same content
* Interoperability: Enable communication between different platforms by introducing a adapter in between. 
* Proxy Adapter Wrapper: Enable comminucation between different platforms by introducing a proxy in between.
* Sense Compute Control: Strucure enbedded control applications
* Sense-Plan-Act and MAPE: Self adaptive system based on sensors
* Three-Layer: Split into planning, sequence and reactive layers. 
* Facade
* Load Balancer


## Styles
There are also a bunch of styles, i.e. an collection of architectural design decisions. Benefits of these include reuse, increased understandability etc. Examples include.
* Client-Server
* Peer-to-peer: 
* Layered
* Blackboard
* Publish-Subscribe
* Event based

Patterns solve common architectural challenges/problems 