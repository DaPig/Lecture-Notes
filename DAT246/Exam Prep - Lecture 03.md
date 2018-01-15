Exam Prep - Lecture3
---
# Basics of Statistics.
Population mean = Expected value 
Mode = the number that appears the most time in a poplulation or sample, ex: [1,2,2,3,5] has a mode of 2
Range of a population = Largest - smallest
Variance for population = sigma squared (1/n)*SUM(X-E[X])^2
Standard deviation = Square root of variance


## Normal Distribution
BEll shaped curve, 68% within one standard deviation. If curve is not shaped it can be:
* unimodal = one peek (sharp)
* Bimodal = Two peeks
* Multimodal = multiple peeks

### Skewness
IF the peek is off center, one tail will be longer than the other, in that case we say the curve is "Skewed", skewness can be measured as: (Mean-median)/Standard deviation
Positively skewed = long right tail: Mode < median < mean
Negatively Skewed = Long left tail: Mode>Median>mean

### Kurtosis
Kurtosis is a measure of the bell of the curve is normal, peaked or flat, a normal dist have kurtosis of 0 

### QQ-Plots
A qq plot can be used to visualize whether something is of a npormal distribution. If the dots fall on a k-line (straight) we have a normal distribution, if the curve is convex, we have a positive skew, if it is concave, we have a negative skew

### Shapiro-Wilk
A shapiro wilk text can be used to measure normality and shit.
It can be confusing and should always be used with graphical analasys.

### Hypothesis.
Once we know the characteristics about the data we can make hypothesis testing, we create a null hypothesis and alternative hypothesis and check the data, 

# Linear Regression 
When conducting linear regression we have four assumptions that we assume
1. Linearity - The dependant variable falls on a line
2. Independance of residuals - We cannot see a trend on the residuals based on the other, sine curve like = bad
3. Homoscedacity - The residuals do not follow a trend (increases as independant increases)
4. Normality of residuals - The actual values should be normally distributed to our predicted value