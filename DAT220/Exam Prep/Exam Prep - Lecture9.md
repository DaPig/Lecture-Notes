# Lecture 9
## Security-Aware-Design
---
Security is very important when it comes to software architecture, the security goal is to protect a comppnent from harm or malicious intents. Threats are the causes of harm which migh affect the component. The role of a software architect is to identify the potential causes of harm and implement countermeasures to combat these. 

# Security Concerns
The different concerns one might have for a system can be of the folloowing; 
## Confidentiality
User information is disclosed to non-secure partners. Preventing this is important
## Integrity
Absense of alteration of information. Information should not be able to be changed unless authorized to do so. 
## Availability
The service is ready and and can be used by authorized parties. 
## Accountability
We should be able to identify people/parties accountable for decisions and actions

We can use different security building blocks (for example encryption) to meet these security concerns. 

# Building blocks
The different common building blocks are: 
## Encryption
To meet confidentiality concerns, integrity and authenticity. It's important to note that the encryption keys should themself be stored securely.

## Authentication
To meet; integrity, limit changes to people with user credentials which are valid.

## Authorization
We have permissions so that users can be limited. 

## Auditing 
Logging all interactions and actions that are in the system. 

## Monitoring
Observing and analyzing networks, user activities etc, we need to place the sensors in smart places. 


We can use security patterns and tactics to meet this in the same way as architectural patterns.

# Countermeasures
Countermeasures we can take are *Preventive*(try to prevent incidents before they occur), *Reactive* (respond while attacs occur) or Correcting (Fix after attack).

When assesing threats we need to concider the impact if it occurs and the threat that it does occur.