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
manipulate(myHist(mu), mu = slider(.1471, .3, step = 0.001))

