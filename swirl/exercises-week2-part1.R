library(swirl)
library(manipulate)
swirl()

#4
  fit <- lm(child ~ parent, galton)
  sqrt(sum(fit$residuals^2) / (n - 2))
  summary(fit)$sigma
  sqrt(deviance(fit)/(n-2))
  
  # Yi-mean(Yi)
  # Yi-Yi_hat
  
  mu <- mean(galton$child)
  sTot <- sum((galton$child - mu)^2)
  sRes <- deviance(fit)
  1-sRes/sTot
  summary(fit)$r.squared
  cor(galton$child, galton$parent)^2

#5
  ones <- rep(1, nrow(galton))
  lm(child ~ ones + parent - 1, galton)
  lm(child ~ parent, galton)
  
  # True
  # The constant, 1
  
  lm(child ~ 1, galton)
  View(trees)
  
  # > Open elimination.R
  # Volume ~ Girth - 1
  
  fit <- lm(Volume ~ Girth + Height + Constant -1, trees)
  trees2 <- eliminate("Girth", trees)
  
  # True
  
  View(trees2)
  
  # The constant, 1, has been replaced by its residual when regressed against Girth.
  
  fit2 <- lm(Volume ~ Height + Constant -1, trees2)
  lapply(list(fit, fit2), coef)
  
  # Pick any regressor and replace the outcome and all other regressors by their residuals against the chosen one.

  
  
#6 
  # Obesity
  
  all <- lm(Fertility ~ ., swiss )
  
  summary(all)
  
  # 0.05
  
  summary(lm(Fertility ~ Agriculture, swiss))
  
  # 0.19420 
  # They would be correlated
  
  cor(swiss$Examination, swiss$Education)
  
  cor(swiss$Agriculture, swiss$Education)
  
  # > Open swissLMs.R
  
  makelms()
  
  # Education
  
  ec <- swiss$Examination + swiss$Catholic
  
  efit <- lm(Fertility ~ . + ec,swiss)
  
  all$coefficients - efit$coefficients
  
  # NA
  # Adding ec doesn't change the model
  
  
  