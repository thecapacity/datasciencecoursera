## Help: http://rpubs.com/kiichi/31791

## Q1
?shuttle
library(MASS)

fit <- glm(use ~ wind - 1, data=shuttle, family = binomial)

shuttle$wind = shuttle$wind == "head"
# TRUE == HeadWind

# Tail Wind: -0.2831
# Head Wind: -0.2513

# Give Odds Ratio:  (signs are wrong)
## > exp(coef(fit))
## windFALSE  windTRUE 
## 0.7534247 0.7777778 

## > exp(-coef(fit))
## windFALSE  windTRUE 
## 1.327273  1.285714 

# Give Odds(Head) / Odds(Tail)
1.285714 / 1.327273

## Q2

## As above but Give estimated odds ratio for autolander use adjusting for wind strength (magn)

fit2 <- glm(use ~ wind + magn - 1, data=shuttle, family = binomial)
exp(-coef(fit2))

## windFALSE   windTRUE magnMedium    magnOut magnStrong 
## 1.4851533  1.4383682  1.0000000  0.6841941  0.9376181 

1.4383682 / 1.4851533

## Q3
fitQ31 <- glm(use ~ wind, data=shuttle, family = binomial)
fitQ32 <- glm(1 - use ~ wind, data=shuttle, family = binomial)

## Q4

Q4fit <- glm(count ~ spray - 1, data = InsectSprays, family="poisson")
summmary(Q4fit)

exp(coef(Q4fit))
# sprayA    sprayB    sprayC    sprayD    sprayE    sprayF 
# 14.500000 15.333333  2.083333  4.916667  3.500000 16.666667 

14.5 / 15.333

## Q5

Q5fit <- glm(count ~ x + offset(t), family="poisson")
# Where x is a factor variable comparing treatment (1) to control (0)
# t is the natural log of a minoring time.

# What is the impact of the coefficient for x if we fit the model:
### glm(count ~ x + offset(t2), family = poisson) where t2 <- log(10) + t
## In other words what happens to the coefficients if we change the units of the offset variable
# Note adding log(1) on the log scale is multiplying 10 on the original scale

## OK First fit converts 'units' into / t (e.g. hits per day / 24 => hits per hour)
## So changing "hours per day" (i.e. 24) to be log(10) + 24... means 24 hrs + 2.3...
## i.e. we're skewing (or increasing) the magnititude of the offset by log(10).
## So we'd go from hits per hour to something more granular, e.g. hits per 45 min.
# which means our coeddicient is smaller (i.e. divided) by the log(10) effect.

## Actually that changes the _UNITS_ of the coefficient but not the # itself

## Q6

# Using a knot point at 0, fit a linear model that looks like a hockey stick with two lines meeting at x=0.
# Include an intercept term, x and the knot point term. What is the estimated slope of the line after 0? 

# x <- -5:5
x <- c(-5   ,-4   , -3,  -2  ,   -1,    0,    1,    2,    3,     4,   5)
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

knots<-c(0)
splineTerms<-sapply(knots,function(knot)(x>knot)*(x-knot))

Q6fit1 <- lm(y ~ x + splineTerms)
Q6fit2 <- lm(y ~ x + splineTerms - 1)

yhat1<-predict(Q6fit1)
yhat2<-predict(Q6fit2)

plot(x,y,frame=FALSE,pch=21,bg="lightblue",cex=2)

## Alternate
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
knots<-c(0)
splineTerms<-sapply(knots,function(knot) (x>knot)*(x-knot))
xmat<-cbind(1,x,splineTerms)
fit<-lm(y~xmat-1)
yhat<-predict(fit)
(yhat[10]-yhat[6])/4