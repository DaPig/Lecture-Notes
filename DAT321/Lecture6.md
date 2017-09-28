# Software Quality
## Lecture 6
### Foundation of metrics
#### 2017-09-21
----------
Today we will discuss the difference between product and process quality, briefly look into process maturity models and look at some metrics.

A quality process does not directly mean that the product will be of quality. There is no definite way to implement a quality process.
However, a bad process usually lead to bad products.  

There are multiple different strategies for processes. For example Waterfall, RAT, SEI.

Further, it has been shown that diversity usually leads to good software in more cases that homogeneous groups of people.

One of the most used "tool" to develop process quality is called CMMI (Capability Maturity Model). This splits the quality measure of the process in levels. However, staying on a high CMMI level is very expensive as it for example requires much documentation. So often companies strives to reach this level, and once they do they drop everything. The different levels determine how mature the process is, how many KPA they have. CHecking what CMMI level a company is on is done manually.


The idea with CMMI is that you compare things. One compares to other organizations who are more or less mature. CMMI does not tell you how to fix stuff, only that you will have to.

---
TO measure test process, one could measure the fault slip through, the time from the when the error was inserted until it was found, and in which phase of the development. The later you find a bug the more expensive it gets.
---
WHen testing embedded system one usually tested all control paths, however this sucks as the entropy will be total before one is done writing test cases. As such there are other well defined and used test methods. ONe example is the ISO 26262 standard that gives good outlines for the automotive industry.


Testing can be error injection and mutation testing
In mutation testing we usually change operator and see if it fails.
For example (i==1) -> (i!=1)
