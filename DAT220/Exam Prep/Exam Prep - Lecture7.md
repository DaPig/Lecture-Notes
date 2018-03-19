# Lecture 7
## Styles & Patterns
This lecture is all aboit the styles and patterns a Software architect can use to create a good software architecture, as such these are valuable tools that the architect should have in his/her toolbox. 

The architectures can either be from a methodology, creativity or previous work in simular systems. The basic principles are modularity (break down architecture in valid subsystems), abstractions (Separate important from non-important) and Separation of concerns (modules should only concern what needs to be concerned) 

# Styles and patterns

## Domain specific software architecture 
This is used when the architecture is focused on a specific domain, to limit the scope in a sense. This is usable when we have deep knowledge in the domain and want to create a large scale architecture. (high level)

## Architectural Patterns  
We use these patterns to combat reocurring architectural problems. Has a narrower scope and are mor program specific than DSSA. Some examples follows below: 

### State-Logic Display
Cluster elements that change at the same pace (UI with client etc)

### MVC
Separate model from view and controller. 
View calls controller which updates the model

### Presenter View
Different views can be used for the same context.

### Interoperability
Enables communication between different platforms by introducing adapters.

### Proxy adapter wrapper
Instead of components talking to one another, they talk to a proxy

### Sense-Compute-Control
Structure embedded control units

### Sense plan act /MAPE
Self adaptive systems that change based on sensory input

### Three-Layer
Split the applications into three layers, the planning, sequencing and reactive layer which in turn have the sensors/actuators etc.

### Facade
Provide other components with a simple interface to limit communication channels.

### Load Balancer
Split the load between mirror replicas

## Architectural styles
Architectural styles are simular to patterns, but more low level and program specific. These are named collections of design decitions. Gives good foundations for reuse, understandability and interoperability. Some styles: 

### Client-Server
The client speaks to a server whih provides it with the service.

### Peer to Peer
The states are split between all clients so that they both act as clients and servers.

### Layered
Split the application into layers where each layer is responsible for a specific role. Each layer acts as a client and a server, servicing layers above and client for the layers below.

### Blackboard
The blackboard style is when knowlegde sources make changes to a central reposatory which means collaborativeley reaching a solution to a problem. Common in the field of AI

### Publis-Subscribe
A publisher publiches something that each subscriber will be notified about. 

### Event Based
Component, idependantly from one another emits events to one another that is communicated via an event bus.

## Use of patterns and tactics
So, how would one go about using these in a real life context? Patterns solve common problems, so if these arises a pattern is there for you.