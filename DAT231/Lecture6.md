# Requirements Engineering
## Lecture 6
## MRDE, Bespoke RE, Prioritization RP, Interdependencies
### 2017-09-19

---
## Todays Lecture
Today we will talk about MRDE, Bespoke RE, how to prioritize and so forth.

---
There are multiple sources for requirements, key customers, distributors etc (external sources) and market analyst, support etc (Internal sources) . All of these may have required functionality that the product shall have.  When we have these we prioritize and split into different releases.


### Market Driven Requirements Engineering.
In market driven development we need to invent requirements, where as in bespoke (customer driven) RE we "collect" them from the customer. Further, these projects will have a continuous inflow of requirements as the market is continuously shifting. In MDRE we need to make sure that this kind of feature has some market values, as in it needs to generate profit and future revenue. As such we need to assess the potential customers, competitors and so forth. In planning these we need to define "time to market" and split the software into iterations.

MRDE gives some challenges.
1. Balancing market pull and technology push. Customers want something so we need to develop that, where as something there is no need for ATM can wait.
2. Chasm between marketing and dev. Continuous battle
3. The market is unstable, we need to be aware of this.
4. Simple tools for basic needs.
5.  Managing req. dependencies.
6. WE need to estimate the cost/value conundrum.


We can use the "square thingies" in the slides to determine whether our decision are good.

### Requirements Prioritization
We prioritize to focus on the most important issues and to save money and time. And also implementing the most important requirements firstly and then add on to this. However, its hard to find a good abstraction level, and it is hard to predict the future.

#### Prioritization Criteria
Why would we prioritize something over something else? There are several criteria that can be selected, check slides. And we can choose to maximize or minimize these criteria.

We can chose a priority scale, these can be categorization (nominal), ordinal or ratio and so forth.
THese can be combined with different prioritization techniques to determine the order of the requirements.

### Release planning
This is determining what requirements should be in the next release, goes hand in hand with agile software development. This is determined by the release plan. This should provide maximum business value by offering the best possible blend of features. Also satisfy the most important stakeholders, and so forth.

### Interdependencies
This describes different features that are dependent on one another and as such should be shipped together. WE can then create a dependency graph to plan which features to implement first.
