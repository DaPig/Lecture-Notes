# Availability
Availability refers to the property of a system that an element is there when it needs to be. The availability of a system can ba calculated via (Mean Time between failures / (mean time between failures + mean time to repair)). 

## Tactics 
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

## Design Checklist for availability
* Allocationg of Responsibility: Determine what needs to be highly available, reassure that responsibilities have been allocated to keep the availability
* Coordinatination model: Determine what needs to be highly available, and make coordination mechanism to detect faults, log, supports relacements and determine whether the model will work under unavailability
* Data model: The system parts needed to be highly available, and what data abstractions these include, ensure that they can be recovered 
* Mapping amongst architectural elements: Make sure that the mapping is flexible enough to be reallocated
* Resource managment: Determine what critical resources are needed to continue operation in case of a failure. 
* Make sure that availabilitystratergy covers faulures doe to many different artifacts in the system. 
* Choice of technology: Choice of technology for availability, eg. component technology. 

