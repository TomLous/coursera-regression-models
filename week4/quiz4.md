Tom Lous  
26 April 2016  

# Quiz 4
## Question 1

Consider the space shuttle data ?𝚜𝚑𝚞𝚝𝚝𝚕𝚎 in the 𝙼𝙰𝚂𝚂 library. Consider modeling the use of the autolander as the outcome (variable name 𝚞𝚜𝚎). Fit a logistic regression model with autolander (variable auto) use (labeled as "auto" 1) versus not (0) as predicted by wind sign (variable wind). Give the estimated odds ratio for autolander use comparing head winds, labeled as "head" in the variable headwind (numerator) to tail winds (denominator).


### Answer


```r
library(MASS)
shuttle$auto <- as.integer(shuttle$use == "auto")
fit <- glm(auto ~ wind - 1 , "binomial", shuttle)
cf <- exp(coef(fit))
oddsratio <- cf[1]/cf[2]
oddsratio
```

```
##  windhead 
## 0.9686888
```

---

## Question 2

Consider the previous problem. Give the estimated odds ratio for autolander use comparing head winds (numerator) to tail winds (denominator) adjusting for wind strength from the variable magn.

### Answer


```r
fit2 <- glm(auto ~ wind + magn - 1 , "binomial", shuttle)
cf2 <- exp(coef(fit2))
oddsratio2 <- cf[1]/cf[2]
oddsratio2
```

```
##  windhead 
## 0.9686888
```

---

## Question 3

If you fit a logistic regression model to a binary variable, for example use of the autolander, then fit a logistic regression model for one minus the outcome (not using the autolander) what happens to the coefficients?


### Answer


```r
fit3 <- glm(I(1 - auto) ~ wind - 1 , "binomial", shuttle)
rbind(coef(fit),coef(fit3))
```

```
##        windhead   windtail
## [1,]  0.2513144  0.2831263
## [2,] -0.2513144 -0.2831263
```

> The coefficients reverse their signs.

---

## Question 4

Consider the insect spray data 𝙸𝚗𝚜𝚎𝚌𝚝𝚂𝚙𝚛𝚊𝚢𝚜. Fit a Poisson model using spray as a factor level. Report the estimated relative rate comapring spray A (numerator) to spray B (denominator).


### Answer


```r
fit4 <- glm(count ~ spray -1, poisson, InsectSprays)
cf4 <- exp(coef(fit4))
cf4[1]/cf4[2]
```

```
##    sprayA 
## 0.9456522
```

---

## Question 5

Consider a Poisson glm with an offset, t. So, for example, a model of the form 𝚐𝚕𝚖(𝚌𝚘𝚞𝚗𝚝 ~ 𝚡 + 𝚘𝚏𝚏𝚜𝚎𝚝(𝚝), 𝚏𝚊𝚖𝚒𝚕𝚢 = 𝚙𝚘𝚒𝚜𝚜𝚘𝚗) where 𝚡 is a factor variable comparing a treatment (1) to a control (0) and 𝚝 is the natural log of a monitoring time. What is impact of the coefficient for 𝚡 if we fit the model 𝚐𝚕𝚖(𝚌𝚘𝚞𝚗𝚝 ~ 𝚡 + 𝚘𝚏𝚏𝚜𝚎𝚝(𝚝𝟸), 𝚏𝚊𝚖𝚒𝚕𝚢 = 𝚙𝚘𝚒𝚜𝚜𝚘𝚗) where 𝟸 <- 𝚕𝚘𝚐(𝟷𝟶) + 𝚝? In other words, what happens to the coefficients if we change the units of the offset variable. (Note, adding log(10) on the log scale is multiplying by 10 on the original scale.)



### Answer

> The coefficient estimate is unchanged
---

## Question 6

Consider the data


```r
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
```

Using a knot point at 0, fit a linear model that looks like a hockey stick with two lines meeting at x=0. Include an intercept term, x and the knot point term. What is the estimated slope of the line after 0?

### Answer


```r
knots <- c(0)
splineTerms <- sapply(knots, function(knot) (x>knot)*(x-knot))
xMat <- cbind(1, x, splineTerms)
fit6 <- lm(y ~ xMat - 1)
yHat <- predict(fit6)

maxPos <- which.max(x)
minPos <- which(x == 0)
len <- maxPos - minPos


(yHat[maxPos] - yHat[minPos]) / len
```

```
##       11 
## 1.013067
```

