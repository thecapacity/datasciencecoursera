## Q1
fitQ1 <- lm(mpg ~ factor(cyl)+wt, mtcars)
summary(fitQ1)
"-6.071"

## Q2
data(mtcars)
fit1 <- lm(mpg~factor(cyl) + wt, data=mtcars)
fit2 <- lm(mpg~factor(cyl), data=mtcars)
summary(fit1)
summary(fit2)
" Holding weight constant, cylinder appears to have less of an impact on mpg than 
    if weight is disregarded."

## Q3
Q3fit1 <- lm(mpg~factor(cyl)+wt, mtcars)
Q3fit2 <- lm(mpg~factor(cyl)+wt+factor(cyl)*wt, mtcars)
anova(Q3fit1, Q3fit2)

## WRONG Guess:
"The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, 
        which suggests that the interaction terms is necessary."

#CORRECT: 
"The P-value is larger than 0.05. So, according to our criterion, we would fail to reject,
        which suggests that the interaction terms may not be necessary."

## Q4
Q4fit1 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
"So we're dividing weight by 2, which changes the _UNITS"
## ?mtcars -> [,6] wt is Weight (lb/1000)
## 1 (short ton) is == 2000 lbs
## So previous units were mpg change per 1/2 ton, now we're making it per 1/4 ton?
## options were either per 1/2 ton increase or per ton increase - for specific cylinders

#Guess:
"The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4, 6, 8)."

## Q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
Q5fit <- lm (y~x)
hatvalues(Q5fit)
max(hatvalues(Q5fit))
"0.9946"

## Q6
dfbetas(Q5fit)
#point 5 has the max value from above Q, slope (i.e. X) is -133.822 so answer is:
"-134"

## Q7
"It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment."
