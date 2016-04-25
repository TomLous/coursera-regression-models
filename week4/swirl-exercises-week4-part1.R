library(swirl)
library(manipulate)
swirl()

#10
  # x1
  # x1, x2, and x3 are uncorrelated in rgp1(), but not in rgp2().
  # Computes the variance of each row

  rgp1()
  
  # x3
  
  View(swiss)
  mdl <- lm(Fertility ~ ., swiss)
  vif(mdl)
  mdl2 <- lm(Fertility ~ Agriculture + Education + Catholic + Infant.Mortality , swiss)
  vif(mdl2)
  
  # VIF is the square of standard error inflation.
  # Excluding it might bias coefficient estimates of regressors with which it is correlated.
  # Using converted regressors may make interpretation difficult.
  
  
#11
  # x1 and x2
  # 1
  
  x1c <- simbias()
  
  apply(x1c, 1, mean)
  
  fit1 <- lm(Fertility ~ Agriculture, swiss)
  fit3 <- lm(Fertility ~ Agriculture + Examination + Education, swiss)
  
  anova(fit1, fit3)
  
  # 20.968
  # 6283.1 and 3180.9
  
  deviance(fit3)
  d <- deviance(fit3)/43
  n <- (deviance(fit1)-deviance(fit3)) / 2
  n/d
  
  pf(n/d, 2, 43, lower.tail=FALSE)
  shapiro.test(fit3$residuals)
  
  anova(fit1, fit3, fit5, fit6)
  
  # Correlated regressors
  # True
  # Model residuals should be tested for normality.
  
#12
  # Any of these
  # 23
  
  View(ravenData)
  mdl <- glm(ravenWinNum ~ ravenScore, "binomial", ravenData)
  lodds <- predict(mdl,data.frame(ravenScore=c(0, 3, 6)))
  exp(lodds)/(1+exp(lodds))
  
  summary(mdl)
  
  exp(confint(mdl))
  
  # 0.005674966
  # They will decrease slightly
  
  anova(mdl)
  qchisq(0.95, 1)
  
#13
  var(rpois(1000, 50))
  # The Central Limit Theorem
  
  #Yes
  nxt()
  
  View(hits)
  class(hits[,'date'])
  as.integer(head(hits[,'date']))
  
  mdl <- glm(visits ~ date, poisson, hits)
  summary(mdl)
  
  exp(confint(mdl, 'date'))
  
  which.max(hits[,'visits'])
  hits[704,]
  
  lambda <- mdl$fitted.values[704]
  
  qpois(.95, lambda)
  
  mdl2 <- glm(formula = simplystats ~ date, family = poisson, data = hits, offset = log(visits + 1))
  
  qpois(.95, mdl2$fitted.values[704])
  
  # lambda
  # The log of the mean
  # offset
  
  
  
  