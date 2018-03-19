# Exam Prep - Lecture 4
## Quality Requirements
### 2018-02-28
---
Requirements can often be split into two different categories, functional and quality requirements. Quality requirements are related to how well the system is to handle it's own functional requirements. The quality requirements/attributes determines the functionality of the system and in an extension, the architecture of the system. 

As software architect you should be able to elicit the relevant quality requirments. It is almost impossible to maximize all the QA, so tradeoffs needs to be made. 

# Different QUalities
Different quality attributes have different types. Such as system qualirties, such as availability, modifyability. Can also be business qualities; cost, time to market and Architectural QUalities; Conceptual integrity, correctness and completeness.

Quality attributes needs to be measurable to be verifyable.

# Types of qualities
Each community has it's own taxonomy of different terms in software quality. IEEE does the following: 
* Portability; Installability, Replaceability etc
* Functional Suitability; functional correctness etc
* Security; INtegrity, COnfidentiality etc
* Performance Efficiency: Capacity, Resource utilization etc
* Usability; Operability etc
* Reliability: Availability, recoverability
* Maintainability; Modularity etc
* Compatability; Interoperability

Performance and Usability are ususally large drivers, i.e. important for the architecture 

# Quality Attribute Scenarios
To put the quality attributes in a context, we can often use QAS to get a "story" to follow. These include
* Source; what the source of the QAS is, for example a human
* Stimulus; conditions that must be considered
* Arfifact; Which part of the system is stimulated
* Enviroment; Type of enviroment, standard/ heavy load etc
* Response; What measures are undertaken 
* Response measure; To measure the respinse and verify the quality. 
---
# Quality Design Decitions 
You can guide the quality attribute design by introducing quality decitions, there are seven different categories of these: 

## Allocation of Responsibility
Allocation of Responsibility means identifying the different important responsibilities such as the basic system functions, architectural infrastructure and allocating these in the system at non-runtime and runtime.  

## Coordination Model
Coordingation model means determining which system elements interact(coordinates) with one another and their communication channels and the properties for the communication

## Data Model 
The data model decisions determines how the data in the applocation will be handled, this include; choosing major data avstractions with their operations, properties etc, how these are intialized and manipulated. Along with compiling the metadata, organizing the data etc

## Management Of Resources
Management of resources is somewhat self-explanatory, managing the available resources depending on their liits, what manages what in the system and what happens att high loads of resources.

## Mapping amongst architectural elements
The mappings in the architecture are between elements and units of execution and units of development.

## Binding Time Decitions
Binding time decitions means introducing allowable ranges of variations, for example bound by different times of the software architecture lifecycle

## Choice of Technology 
Choice of technology means, crudely, determining what technology will be used for an element.

---
# Different quality attributes for the design decitions
Translating these into the different quality attributes can be the following. 

## Availability
Availability refers to the property of a system that an element is there when it needs to be. The availability of a system can ba calculated via (Mean Time between failures / (mean time between failures + mean time to repair)). 

### Tactics 
Some tactics can be ointroduced to combat availability, these are split into the detecting phase, recover phase or prevent phase. 

* Ping/Echo: Ping between nodes to determine availability
* Heartbeat: Periodic message exchange to a monitor to check sanity
* Time stamp: Check incorrect sequences of messages 
* Sanity Checking: Check the validity of different outputs for a component. 
* Condition Monitoring: checking assumptions made during architecture design agains actual behaviour
* Voting: Check output betweeen replicas, the majority wins of the simular output
* Replication: Replicating the component, specialization of voting
* Functional Redundancy: Should give the same output but components are diversily implemented. 

Recovering from faults can include the following
* Active Redundancy
* Passive Redundancy
* Cold Spare
* Exeption Handling
* Rollback
* Software Upgrade
* Retry
* Ignor faulty behaviour

Preventing the faults can include
* Removal from service
* Transactions
* Predictive model
* Exception Prevention
* Increase Competence set

### Design Checklist for availability
* Allocationg of Responsibility: Determine what needs to be highly available, reassure that responsibilities have been allocated to keep the availability
* Coordinatination model: Determine what needs to be highly available, and make coordination mechanism to detect faults, log, supports relacements and determine whether the model will work under unavailability
* Data model: The system parts needed to be highly available, and what data abstractions these include, ensure that they can be recovered 
* Mapping amongst architectural elements: Make sure that the mapping is flexible enough to be reallocated
* Resource managment: Determine what critical resources are needed to continue operation in case of a failure. 
* Make sure that availabilitystratergy covers faulures doe to many different artifacts in the system. 
* Choice of technology: Choice of technology for availability, eg. component technology. 

