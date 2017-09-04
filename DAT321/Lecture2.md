# Software Quality
## Lecture 2
### External software quality
#### 2017-09-04

External software quality is measured when the software is running, as such what the user can enjoy. Such as reliability and accuracy.

The alternative is the internal quality that we as developers usually see, such as simplicity and such.

The ISO9126 standard contains quality characterisitics for both internal and external software quality.

According to this standard there are various words for what a problem in a software may depend on

* A Fault is related to the code,
* Failures are errors that occur when the program runs. (As such, one or more fault may lead to one or more failures)
* Errors are related to the users. When they have caused the defect.

In industry all these are usually seen simply as a defect or a 'bug'.

During development, defects can exist in several states, submitted, assigned ... validated, closed. These states change during the development cycle.

As such, all defects have a lifecyle, from open to closed.

## How do we measure software quality?
* Defect Density: Can be calculated as * DD = # of defects / LOC(Lines of code) * However this may not be a clear definition since lines of codes are a crude variable and that LOC is dependant on programmer language. THe main disadvantage is that once a software is released and users start finding bugs, metric will look very different from the development data.

* Defect Inflow: Can be measured as * DI = #of defects reported during a week*. This is not reliable as it depends on humans.

* Fault Slip Through(FST): A set of measures describing effectiveness of testing. Once a fault is found one looks whether the fault could have been found, the fault latency is the amount of time from when the bug was introduced untill it was found. This allows the company to distinguish where they need to focus resources in order to combat these kinds of faults. 
