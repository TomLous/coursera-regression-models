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
  
  