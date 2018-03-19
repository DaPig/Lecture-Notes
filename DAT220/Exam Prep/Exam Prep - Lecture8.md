# Lecture 8 
## Top down architectural decomposition
---
# Architecturally Significant Requirements (ASAs)
ASAs are the most significant requirmeents for when creating a software architecture, as such these are the most important to uphold, and drive the architecture development. These should usually be fewer than 10 and can be both functional and non functional where quality usually dominates. Identifying these usually consists of interviews with stakeholders and ordering their importance. Ususally novice architects focus on implementing these one group at a time. 

# Attribute driven domain (ADD)
In an attribute driven domain we do not treat all requirments as equals, we only focus on fulfilling the most important ones and the less important are thus fulfilled via the constraints on the mosrt important ones. The process is to pick a module, select ASAs, decompose these, allocate functiomnality etc, then refining the scearios and start over again. the output is a draft in which the main design approaches have been selected. If early design decitions prohibit us from fulfilling new requirementsd we can backtrack and reconsider the design. 