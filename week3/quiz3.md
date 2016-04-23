Tom Lous  
23 April 2016  

# Quiz 3
## Question 1

Consider the 𝚖𝚝𝚌𝚊𝚛𝚜 data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as confounder. Give the adjusted estimate for the expected change in mpg comparing 8 cylinders to 4.



### Answer


```r
data("mtcars")
mtcars$cyl <- factor(mtcars$cyl)
fit <- lm(mpg ~ cyl + wt - 1, mtcars)
coefs <- summary(fit)$coef
cylDiff <- coefs["cyl8","Estimate"] - coefs["cyl4","Estimate"]
cylDiff
```

```
## [1] -6.07086
```

---

## Question 2

Consider the 𝚖𝚝𝚌𝚊𝚛𝚜 data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as a possible confounding variable. Compare the effect of 8 versus 4 cylinders on mpg for the adjusted and unadjusted by weight models. Here, adjusted means including the weight variable as a term in the regression model and unadjusted means the model without weight included. What can be said about the effect comparing 8 and 4 cylinders after looking at models with and without weight included?.

### Answer


```r
fit2 <- lm(mpg ~ cyl -1, mtcars)
rbind(summary(fit)$coef[1:3,1],summary(fit2)$coef[,1])
```

```
##          cyl4     cyl6     cyl8
## [1,] 33.99079 29.73521 27.91993
## [2,] 26.66364 19.74286 15.10000
```

> Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.

---

## Question 3

Consider the 𝚖𝚝𝚌𝚊𝚛𝚜 data set. Fit a model with mpg as the outcome that considers number of cylinders as a factor variable and weight as confounder. Now fit a second model with mpg as the outcome model that considers the interaction between number of cylinders (as a factor variable) and weight. Give the P-value for the likelihood ratio test comparing the two models and suggest a model using 0.05 as a type I error rate significance benchmark.


### Answer


```r
fit3 <- lm(mpg ~ cyl * wt - 1, mtcars)
anova(fit, fit3)
```

```
## Analysis of Variance Table
## 
## Model 1: mpg ~ cyl + wt - 1
## Model 2: mpg ~ cyl * wt - 1
##   Res.Df    RSS Df Sum of Sq      F Pr(>F)
## 1     28 183.06                           
## 2     26 155.89  2     27.17 2.2658 0.1239
```

>The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.

---

## Question 4

Consider the 𝚖𝚝𝚌𝚊𝚛𝚜 data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight inlcuded in the model as


```r
fit4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
```

How is the wt coefficient interpretted?


### Answer

> The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4, 6, 8).


---

## Question 5

Consider the following data set


```r
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
```

Give the hat diagonal for the most influential point



### Answer


```r
fit5 <- lm(y ~ x)
hatVals <- hatvalues(fit5)
max(hatVals)
```

```
## [1] 0.9945734
```

---

## Question 6

Consider the following data set



```r
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
```

Give the slope dfbeta for the point with the highest hat value.

### Answer


```r
maxHatValPos <- as.character(which.max(hatVals))
dfbetas(fit5)[maxHatValPos,"x"]
```

```
## [1] -133.8226
```

---

## Question 7
Consider a regression relationship between Y and X with and without adjustment for a third variable Z. Which of the following is true about comparing the regression coefficient between Y and X with and without adjustment for Z.




### Answer

>It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment.
