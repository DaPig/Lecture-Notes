# Requirements Engineering
## Lecture 4
### Specification I
#### 2017-09-12

-----

When specifying data requirements we usually specify what input & output a module shall have.

Usually the functional/non-functional requirements distinction are a "conceptual mess" as they are often intertwined. Ususally functional describes the functionality and behaviour of the product and the non-functional describes evertything else.

When specifying product requirements one needs to select what abstraction level is suitable, product,feature,function or component - level.

In agile it is ordinary to split inteo themes , epics, user stories and tasks, where
  * Themes: Product level requirements
  * Epics: High level descriptions of a features the product will have
  * User stories: Low level functionality needed to provide the functionality of the epics.
  * Tasks: Detailed descriptions of functionality for the user stories. Functions, etc.

A good req. spec needs to fulfill various criterias, such as correctness etc. (check slides for details) However, the difficulty when eliciting these might be various misunderstandings when communicating with the customer.

A simple rule for requirements is that perfectionism is troublesome in the early stages of eliciting, it is better to have a crude sketch initially that is enough for overview. Also simple voice sentences, "The shystem should be able to...", identify the user for this task and specify verifyable criteria in order to measure the success for this task.

When doing this one needs to avoid ambiguities, words like 'or' and pronouns should be avoided, concatinations should be avoided and split, exceptions should be stated on their own. Requirements should be as short as possible, avoid drifting into design choices and low level details, and avoid unclear and unmeasurable words.


### Data Requirements
A data model is related to the data that is handeled in the application, examples are 'ER-diagrams', 'data-dictionary' and so forth. Very easy for experts to grasp, might be hard for users, depending on type.
