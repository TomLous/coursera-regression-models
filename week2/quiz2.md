Tom Lous  
16 April 2016  

# Quiz 2
## Question 1

Consider the following data with x as the predictor and y as as the outcome.


```r
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
```
Give a P-value for the two sided hypothesis test of whether β1 from a linear regression model is 0 or not.

### Answer


```r
fit <- lm(y ~ x)
pval <- summary(fit)$coefficients[2,4]
pval
```

```
## [1] 0.05296439
```


---

## Question 2

Consider the previous problem, give the estimate of the residual standard deviation.

### Answer


```r
residualStandardError <- summary(fit)$sigma
residualStandardError
```

```
## [1] 0.2229981
```

---

## Question 3

In the 𝚖𝚝𝚌𝚊𝚛𝚜 data set, fit a linear regression model of weight (predictor) on mpg (outcome). Get a 95% confidence interval for the expected mpg at the average weight. What is the lower endpoint?

### Answer


```r
data("mtcars")
fit <- lm(mpg ~ wt, mtcars)
pr <- predict.lm(fit, data.frame(wt=mean(mtcars$wt)), interval="confidence")
pr[,"lwr"]
```

```
## [1] 18.99098
```

---

## Question 4

Refer to the previous question. Read the help file for 𝚖𝚝𝚌𝚊𝚛𝚜. What is the weight coefficient interpreted as?

### Answer

```r
?mtcars
```

> [, 6]	wt	Weight (1000 lbs)
>> The estimated expected change in mpg per 1,000 lb increase in weight.


---

## Question 5

Consider again the 𝚖𝚝𝚌𝚊𝚛𝚜 data set and a linear regression model with mpg as predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. What is the upper endpoint?

### Answer


```r
xVal <- 3
pr <- predict.lm(fit, data.frame(wt=xVal), interval="prediction")
pr[,"upr"]
```

```
## [1] 27.57355
```

---

## Question 6

Consider again the 𝚖𝚝𝚌𝚊𝚛𝚜 data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.


### Answer



```r
shortTonWt <- mtcars$wt / 2
fit2 <- lm(mpg ~ shortTonWt, mtcars)
mean <- summary(fit2)$coefficients[2,1]
stdErr <- summary(fit2)$coefficients[2,2]
interval <- mean + c(-1,1) * qt(0.975, df=fit2$df) * stdErr
interval[1]
```

```
## [1] -12.97262
```

---

## Question 7

If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?

### Answer


It would get multiplied by 100.
---


## Question 8

I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=β0+β1X+ϵ to obtain β^0 and β^1. What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c?



### Answer

The new intercept would be β^0−cβ^1

---

## Question 9

Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the the sum of the squared errors, ∑n i=1(Yi−Y^i)2 when comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)?



### Answer



---

## Question 10






### Answer




---

