## Q1

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

#Give a P-value for the two sided hypothesis test of whether 
#       B1 from a linear regression model is 0 or not.

fit <- lm(y~x)
summary(fit) #look for p-value (last line)
summary(fit)$coefficients
"0.05296"

#Confirmed R's p-Value is two sided
# https://stat.ethz.ch/R-manual/R-patched/library/stats/html/summary.lm.html

# Note Q asked about B1 which is slope (B0 is intercept)

# OR
n = length(x)
beta1 <- cor(y,x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
e <- y - beta0 - beta1 * x
sigma <- sqrt(sum(e^2) / (n-2))
ssx<-sum((x-mean(x))^2)
seBeta0<-(1/n+mean(x)^2/ssx)^.5*sigma
seBeta1<-sigma/sqrt(ssx)
tBeta0<-beta0/seBeta0
tBeta1<-beta1/seBeta1 
pBeta0<-2*pt(abs(tBeta0),df=n-2,lower.tail=FALSE)
pBeta1<-2*pt(abs(tBeta1),df=n-2,lower.tail=FALSE)
coefTable<-rbind(c(beta0,seBeta0,tBeta0,pBeta0),c(beta1,seBeta1,tBeta1,pBeta1))
colnames(coefTable)<-c("Estimate","Std.Error","tvalue","P(>|t|)")
rownames(coefTable)<-c("(Intercept)","x")

## Q2
# Consider the previous problem, give the estimate of 
#   the residual standard deviation.

## Wrong: sd(resid(fit)) -- I think
## Also think wrong: (1/(n-2))* sum(resid(fit))
    ## Forgot to square

# From Binder1.pdf page 76
sqrt(sum(resid(fit)^2)/(n-2))
summary(fit)$sigma
"0.222"

# I should have watched video 01_06_c before attempting

## Q3
library(datasets)
data(mtcars)

# take lm() of mpg ~ I(wt-mean(wt)), then confint(fit). 
# You will get the answer.

## Confidence Intervale Binder1.pdf page 89

car_fit <- lm(mpg ~ I(wt-mean(wt)), mtcars)
confint(car_fit, level=.95)

#Gets us close
predict(car_fit, newdata=data.frame(wt=mean(mtcars$wt)))

"18.991"
# Interval for expected MPG at Average Wgt means intercept

## Q4
?mtcars # [, 6]    wt	Weight (lb/1000)

"The estimated expected change in mpg per 1,000 lb increase in weight."

## Q5

# Problem 5: Use predict function in R with parameter setting 
#   interval=("prediction"). 
#   Also refer to Slide 10/14 
#   http://bcaffo.github.io/courses/07_RegressionModels/01_07_inference/#10

predict(car_fit, newdata=data.frame(wt=3000/1000), interval=("prediction"))
#   fit      lwr      upr
#1 20.09062 13.77366 26.40759

#Not sure why mine does not align, potential answers are 21.24 & 27.57
"27.57"

## Q6

#   lm() with mpg ~ I(wt / 2).
#   don't need newdata, set data=mtcars
# Just did the transform, oriignal example is mpg/1000lbs
#   So multiply that by 2,000lbs/1Short_Ton to get mpg/ST
#   becomes 2*previous
fit6 <- lm(mpg~ I(wt/2), data=mtcars)
confint(fit6, level=.95)
"-12.973"

library(datasets)
Cars <- mtcars
Model <- lm(mpg ~ wt, Cars)
predict(Model,newdata = data.frame(wt=mean(Cars$wt)), interval='confidence')
#Try interval='prediction', level=0.95.
newdata=data.frame(wt=mtcars$wt) 
#or newdata=data.frame(wt=3)

confint(object, parm, level = 0.95, ...)
I also used the coef[row,col]+c(−1,1)∗qt(1−α/2,df)∗coef[row,col] format from the slides to double check my answer.

## Q7
# X * .01 (to convert CM to M we're dividing by 100)
# which means means S is divided by .01
# So in this case Slope goes up by 100
"It would get multiplied by 100."

## Q8

# Adding the constant doesn't change the slope, just the intercept
# Compare Intercept for:
lm(mpg~I(wt), mtcars)
lm(mpg~I(wt-10), mtcars)

#I got this wrong the first time: Adding C to X makes the intercept change B0-C*B1

"The new intercept would be β^0−cβ^1"

## Q9
# anova(fit)

car_fit1 <- lm(mpg~I(wt), mtcars)
summary(car_fit1)
yhat <- predict(car_fit1, newdata=data.frame(wt=mtcars$wt))
ymean <- mean(yhat)

sum((mtcars$mpg-yhat)^2) / sum((mtcars$mpg-ymean)^2)
"0.25"
# yhat <- predict(car_fit1, newdata=data.frame(wt=mtcars$wt))
# Then get ymean. 
# The result is sum of (mtcars$mpg-yhat)^2 over sum of (mtcars$mpg-ymean)^2.

# Typically, when one says "what is the ratio of x to y?",
# the ratio is xy, but they identified the denominator and numerator in the reverse 
# order. Just be mindful of this when submitting your final answer, because I got 
# tripped up by it

# Without giving the answer away -- if you understand those 2 concepts, 
# you can answer this question by just looking at either the summary() or the anova() 
# of the full model. 
"""
You might want to google 'Relationship between SST, SSR, and SSE' or something similar.
The first result (a Word doc I couldn't link to) includes an explanation of 
SST = SSR + SSE, 
R2=SSRSST
, et al.  I think that it presents a more conventional approach
to introducing these topics, one that even students without quantitative backgrounds
can understand.
"""

## Q10
"If an intercept is included, then they will sum to 0."

## Answered based on the slides