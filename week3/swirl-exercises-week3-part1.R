library(swirl)
library(manipulate)
swirl()

#7
  length(levels(InsectSprays$spray))
  # B
  dim(InsectSprays)
  head(InsectSprays, 15)
  sA
  summary(InsectSprays[,2])
  sapply(InsectSprays, class)
  fit <- lm(count ~ spray, InsectSprays)
  summary(fit)$coef
  est <- summary(fit)$coef[,1]
  mean(sA)
  # 15.3333
  mean(sB)
  nfit <- lm(count ~ spray - 1, InsectSprays)
  # The means of all 6 levels
  # sprayC
  spray2 <- relevel(InsectSprays$spray, 'C')
  fit2 <- lm(InsectSprays$count ~ spray2)
  summary(fit2)$coef
  # 2.083333
  mean(sC)
  # 14.50000
  (fit$coef[2]-fit$coef[3])/1.6011
  
  
#8 
  dim(hunger)
  948
  names(hunger)
  fit <- lm(Numeric ~ Year, hunger)
  summary(fit)$coef
  # -0.30840
  # As time goes on, the rate of hunger decreases
  # the percentage of hungry children at year 0
  lmF <- lm(Numeric[hunger$Sex=="Female"] ~ Year[hunger$Sex=="Female"], hunger)
  lmM <- lm(Numeric[hunger$Sex=="Male"] ~ Year[hunger$Sex=="Male"], hunger)
  # lmM$coef[2]
  lmBoth <- lm(Numeric ~ Year + Sex, hunger)
  summary(lmBoth)
  # 635.431
  # the annual decrease in percentage of hungry children of both genders
  # they have the same slope
  lmInter <- lm(Numeric ~ Year * Sex, hunger)
  summary(lmInter)
  # 603.5058
  # 665.4535
  # -0.29340
  # -0.32340
  # Male
  # b2+b3*5
  
#9
  fit <- lm(y ~ x, out2)
  plot(fit,which=1)
  # No. There is a linear pattern involving all but one residual and the fit.
  # 1
  fitno <- lm(y ~ x, out2[-1,])
  plot(fitno,which=1)
  coef(fit) - coef(fitno)
  View(dfbeta(fit))
  resno <- out2[1, "y"] - predict(fitno, out2[1,])
  1-resid(fit)[1]/resno
  View(hatvalues(fit))
  sigma <- sqrt(sum(resid(fit)^2) / fit$df.residual)
  rstd <- resid(fit) / (sigma*sqrt(1-hatvalues(fit)))
  head(cbind(rstd, rstandard(fit)))
  plot(fit,which=3)
  plot(fit, which=2)
  # About -5
  sigma1 <- sqrt(deviance(fitno)/df.residual(fitno))
  resid(fit)[1]/(sigma1*sqrt(1-hatvalues(fit)[1]))
  head(rstudent(fit))
  dy <- predict(fitno, out2)-predict(fit, out2)
  sum(dy^2)/(2*sigma^2)
  plot(fit, which=5)
  
  
  