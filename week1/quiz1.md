Tom Lous  
10 May 2015  

# Quiz 1
## Question 1

Consider the data set given below


```r
x <- c(0.18, -1.54, 0.42, 0.95)
```
And weights given by


```r
w <- c(2, 1, 3, 1)
```

Give the value of μ that minimizes the least squares equation 
$\sum\limits_{i=1}^n w_i(x_i−\mu)^2$

### Answer


```r
values <- sum(x*w)
count <- sum(w)
μ <- values / count
μ
```

```
## [1] 0.1471429
```
---

## Question 2

Consider the following data set

```r
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
```

Fit the regression through the origin and get the slope treating y as the outcome and x as the regressor. (Hint, do not center the data since we want regression through the origin, not through the means of the data.)

### Answer

```r
linearModel <- lm(y ~ x - 1) # -1 forces lm though origin
coefficients(linearModel)[["x"]]
```

```
## [1] 0.8262517
```

---

## Question 3

Do 

```r
data(mtcars)
```

from the datasets package and fit the regression model with mpg as the outcome and weight as the predictor. Give the slope coefficient.


### Answer

```r
weight = mtcars$wt
mpg = mtcars$mpg

linearModel <- lm(mpg ~ weight) 
coefficients(linearModel)[["weight"]]
```

```
## [1] -5.344472
```

---

## Question 4

Consider data with an outcome (Y) and a predictor (X). The standard deviation of the predictor is one half that of the outcome. The correlation between the two variables is .5. What value would the slope coefficient for the regression model with Y as the outcome and X as the predictor?

### Answer

```r
σy <- 1
σx <- .5 * σy
correlation <- .5
coefficient <- correlation * (σy / σx)
coefficient
```

```
## [1] 1
```

---

## Question 5

Students were given two hard tests and scores were normalized to have empirical mean 0 and variance 1. The correlation between the scores on the two tests was 0.4. What would be the expected score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1?

### Answer

```r
correlation <- 0.4
quiz1ScoreNormalized <- 1.5
quiz2ScoreNormalized <- quiz1ScoreNormalized * correlation
quiz2ScoreNormalized
```

```
## [1] 0.6
```

---


## Question 6
Consider the data given by the following


```r
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
```

What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?

### Answer


```r
normalizedX <- scale(x)
normalizedX[1,1]
```

```
## [1] -0.9718658
```

---


## Question 7

Consider the following data set (used above as well). What is the intercept for fitting the model with x as the predictor and y as the outcome?

```r
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
```

### Answer


```r
linearModel <- lm(y ~ x) 
coefficients(linearModel)[["(Intercept)"]]
```

```
## [1] 1.567461
```

---


## Question 8

You know that both the predictor and response have mean 0. What can be said about the intercept when you fit a linear regression?

* It must be exactly one.
* It is undefined as you have to divide by zero.
* Nothing about the intercept can be said from the information given.
* **It must be identically 0.**


---


## Question 9

Consider the data given by


```r
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
```

What value minimizes the sum of the squared distances between these points and itself?


### Answer


```r
μ <- mean(x)
μ
```

```
## [1] 0.573
```


---


## Question 10

Let the slope having fit Y as the outcome and X as the predictor be denoted as β1. Let the slope from fitting X as the outcome and Y as the predictor be denoted as γ1. Suppose that you divide β1 by γ1; in other words consider β1/γ1. What is this ratio always equal to?

### Answer

β1 = Corr(y, x) * σy / σx

γ1 = Corr(x, y) * σx / σy

β1/γ1 = (Corr(y, x) * σy / σx) / (Corr(x, y) * σx / σy)

β1/γ1 = (Corr(y, x)/Corr(x, y)) * (σy / σx) / ( σx / σy)

β1/γ1 = ( 1 ) * (σy / σx) / ( σx / σy)

β1/γ1 = ( 1 ) * (σy)^2 / ( σx) ^2

β1/γ1 = Var(σy) / Var(σx)

---







