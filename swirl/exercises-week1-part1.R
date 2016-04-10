install.packages("swirl")
install.packages("manipulate")
packageVersion("swirl") # should be > 2.2.21
library(swirl)
library(manipulate)
install_from_swirl("Regression Models")
swirl()

#1
  plot(child ~ parent, galton)
  plot(jitter(child,4) ~ parent,galton)
  regrline <- lm(child ~ parent, galton)
  abline(regrline, lwd=3, col='red')
  summary(regrline)
  # .64629
  # .04114
  
  
#2
  fit <- lm(child ~ parent, galton)
  summary(fit)
  mean(fit$residuals)
  cov(fit$residuals, galton$parent)
  # mch = ic + slope*mph
  ols.ic <- fit$coef[1]
  ols.slope <- fit$coef[2]
  lhs-rhs
  all.equal(lhs,rhs)
  varChild <- var(galton$child)
  varRes <- var(fit$residuals)
  varEst <- var(est(ols.slope, ols.ic))
  all.equal(varChild, varRes+varEst)
  # is less than the variance of data
  
  mean(efit$residuals)
  cov(efit$residuals, attenu$mag)
  cov(efit$residuals, attenu$dist)
  
#3
  # manipulate
  # .64
  # 5.0
  cor(gpa_nor,gch_nor)
  # It is the same.
  l_nor <- lm(gch_nor ~ gpa_nor)
  # The correlation of the 2 data sets
  # correlation(X,Y) * sd(X)/sd(Y)
  
  