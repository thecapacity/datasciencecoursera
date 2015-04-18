## Q1
library(ggplot2)
library(manipulate)
myHist1 <- function(mu){
    x1 <- c(0.18, -1.54, 0.42, 0.95)
    w1 <- c(2, 1, 3, 1)
    
    mse <- mean(w1*(x1 - mu)^2)
    g <- ggplot( data.frame(x1,w1), aes(x = x1)) + geom_histogram(fill = "salmon", colour = "black", binwidth=1)
    g <- g + geom_vline(xintercept = mu, size = 3)
    g <- g + ggtitle(paste("mu = ", mu, ", MSE = ", round(mse, 2), sep = ""))
    g
}
#manipulate(myHist1(mu), mu = slider(.1471, .3, step = 0.001))
manipulate(myHist1(mu), mu = slider(.0025, 1.077, step = 0.001))
"0.1471"

## Q2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y~x - 1)	#<- omits intercept per ?lm (in examples)
sum(x*y)/sum(x^2)	Also Agrees

"0.8263"

## Q3
data(mtcars)
lm(mtcars$mpg ~ mtcars$wt)
"-5.344"

## Q4
"Guess 1"

## Q5
cor( c(1.5, 2.8, .9), c(.6, 1.1, 1.0) )
"> 1.5*.4
[1] 0.6"

"Guess: .6 otherwise maybe .4"

## Q6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
x <- ( x - mean(x) ) / sd(x)
"-0.9719"

## Q7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y ~ x)
"1.567"

## Q8
"It must be identically 0."

## Q9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)
"0.573"

## Q10
