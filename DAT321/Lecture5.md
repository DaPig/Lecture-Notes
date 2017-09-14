# Software Quality
## Lecture 5
### Foundation of metrics
#### 2017-09-14
----------
There are some videos on the course webpage. They are quite recent and for the course mathematical statistics. These may be used. These give the foundations needed to develop statistical models.

-----
TOday we will discuss measurment theory, this have been critizised by scentists as it kinda "falls apart" when reviewing it. The theory resolves around finding relevant data that can be measure.

### Handling numerical data
Ususally one gathers "a shit ton" of data that one needs to be able to use, for example using means, variance and so forth. We can also tie this to probability models in order to make predictions and estimations.

As such we will discuss how me measure stuff in the empirical world and how we bring it into the theoretical world.


### Why do we need to talk about metrics?
A metric is a description on how the data looks like from our perspective, as data can be viewed with several viewpoints in mind, as such the data also needs to measurable, so it needs scale.

If one have a good model with many parameters it will probobly predict stuff very realistically, however the model is extremely complicated, and as such not very usable.   

There are different types of models in SQ at different abstraction levels,for example, performance, complexity, cost and so forth.


An example for effort calculation is the COCOMO equations, they are very simple and as such very usable, but has been critizised for being to simplistic. The equations are based on the number of lines of codes and what kind the project is embedded, semi-detatched or organic. Using these equations we gets the answer that it would take 0.95 months for 0.05 persons to do write the program that are in the beginning in the slides. Or one working day. The fixed values in cocomo takes into account that one does not only need to code, things like comments, documentation, meeting and such are included.

Comanies nowadays are investing more and more into creating their own metrics to be able to make accurate predictions about resource measurments.

In measurments theory we have a few building blocks that makes up the entire theory, like homomorphism and mapping. Check slides for more.


In order to be able to measure stuff (from the empirical world to the theoretical world (numbers)) we needs scales. These can be nominal, orthogal ratio, interval. THis is used by taing some real world thing measuring it via models and using the scales.

Nominal are labeling. Like male = 1, female = 2, (I'm not going to go in to a discussion surrounding whether this is a good example for a nominal scale, i do not have time, so please bugger of mate)

Ordinal, things can be ordered.

Interval: Missed this one

Ratio: THis is a quantification of the difference of measurments, for example length.

Absolute, like ratio kinda. Barely used.

As such, the model is largely determined by the measurments chosen. FOr example,for  nominal measurments a (chi)-squared curve is usually good.

If we have a mix, for example a nominal and ratio measurments, we can use the ANOVA approach.

THe anova test purpose is to determine whether there is a difference.

If we want to determine how much better something is than something else we can du an effect test.

If we have two ratio measurments, we can measure the correlation between these. That will yield a value between -1<r<1.

Remember that correlation != causation

if we have |r| > 0.8 we have a strong association, and as such there is strong evidence for causation. 
