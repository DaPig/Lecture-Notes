# Security
---
Security is a measure to detrmine a systems capability of combating actions with a harmful intent by any user. The simplest form of characterizing security are 

* Confidentiality: Protect information fom unauthorized parties
* Integrity: Data should not be subject to unauthorized manipulation
* Availability: System will be availkable during harmful attacks such as DDoS.

Other aspects can also be
* Authentication: Users must be authenticated so that we know who they are
* Repurdation: Stuff must be logged
* Authorization: User should only be able to do certain task they have the correct access to do. 

Handling secuirity can either be preventive, corrective or resisting
 
These include, but are not limited to
* Detect intrusion: Based on known patterns
* Detect Service Denial: Known history of DDSO
* Verify message integrity: verify messegaes with a checksum, for example.
* Detect Message Delay: Detecting when a man-in-the middle are modifyign correct messages. 

Resisitng these attacts can be of the following: 
* identify actors: Identify source
* Authenticate actors: Ensure that actor is who they claim
* Authorize actors: Check that actors are authorized to modify data
* Limit access: 
* Limit exposure: split critical resources such that attacks can only access some parts of the system. 
* Encrypt Data
* separate enteties
* Change Default Settings: Changing public settings such that patterns can be seen

React to the attacks can include
* Revoke access
* Lock Computer
* Inform actors

# Design Decitions

* Allocation of Responsibilities: 
Make sure that resources that needs to be secure have the corrfect responsibilities assigned to them. 

* Coordination Model: 
Make sure that cooperation are done via encrypted maessages etc

* Data model: Make sure that relevant data is secure, for example via encryption 

* Mapping among Architectural Elements 
Check how the mappings influence actors way of reading/accessing data. 

* Resource management: 
Assess needed resources to keep data secure


* Binding Time: Determine where late-bound components may be untrusted

* Choice of technology: Check available technlologies for for example encryption etc.



