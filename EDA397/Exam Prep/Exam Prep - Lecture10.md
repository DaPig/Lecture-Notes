# Exam Prep - Lecture 10
## Lean and Agile practices in real software development environment 
### 2018-05-26
---
> These notes will only contain notes taken during lecture and should be complemented with the lecture slides
--- 
Ericsson uses measurments to determine how well their process is coming along. These measure system goes to the various databases and fetches data that is crunched to create the various progress measurments. 

# Agile framworks
The lecture follows by discussing various agile frameworks. Agile can be seen as a "direction", i.e. a way of thinking on project management. 


## Lean 
Lean is about maximizing customer value by minimizing waste. Waste is defined as all unnessecery enteties that hinder a project from advancing or make this advancement unnessesary slow. This advancement is called flow efficiency. 

## Kanban 
Kanban is about minimizing concurrency and tasks in progress to reduce the potential risks surrounding having many concurrent tasks all at once. One of the main differences to scrum is that it is not time boxed. Thus not forcing the team to deliver on a specific date. 

# Ericssons measures
Ericsson initially did a very manual measur labour once a month, that would take 4-5 days to summarize for the person in charge (each month created a 40-something page report).  Thats a lot of time each month. 

If we fast foward a number of years into lean agile the approach have minimized the measures from about 100 to only 5 while still being more confident that the initial 100 measures. This also increased transparancy as each engineer could install a gadget showing the progress on his/her computer. 90-95% of this was automated, reducing the manual labour. Nowadays, ericsson measures everything and all is automated, they use a open source gui kit called DashingIO to visualize the measures. 

Further, the entire management approach have been changed by using an agile approach, back in the days the managment would go out to the programmer with a "black book" and ask them about how much they have contributed, which was not very good as the programmers would become "scared" of the management. The approach now adays is better when the management instead ask "What can I do to help", and is as such not a "scary" management stratergy anymore. 

# Bottlenecks
Bottlenecks creates queues which means money and revenue lost. Lean hates this (reduce waste is the core idea of lean).Two different measures related to bottlenecks are throughput and queue. I.e. how much is delivered and how much is in the various queues (for example integration queue).

# Integration
Integration is without a doubt the most important part of the entire software development cycle. One can often distinguish a good software company from a bad via asking "Can you please describe your integration process", if they cannot give you a good answer, move on. There are several powerful measures for integration one can use
* INtegration effectiveness = How much is delivered can sucessfully be integrated to the main branch by the integration team. This should be 100% anything below that is bad
* INtegration waste [INtegration queue]:  How much time is spend from a new addition is delivered from the development teams untill the integration team can start integrating it. 
* Integration Speed: Time from devlifery from dev team to existance on main branch

Problems with the first measure can be because of crap code or errors with the intregration machinery (can not handle large files for example).

PAGE 34 ON SLIDES ARE APPERANTLY IMPORTANT. 

# Cross functional teams
Cross functional teams consist of all members required to deliver a functionality, for example both designers and coders such that a team can be self sufficient without intervention from other teams.  Originally teams were locked in in a sense, they should develop without outside interaction, today we are more flexible


BurnUP charts are a way of measuring disturbances


Ericsson uses KANBAN (or scrumban more correctly) because they are a support company so they cannot have fixed time boxes. 

Ericsson use 