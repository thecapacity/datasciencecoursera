complete <- function(directory, id = 1:332) {
    data <- data.frame(id=seq(1,length(id)), nobs=c(0))
    for (num in seq(1, length(id))) {
        in_f <- read.csv(paste0(directory, "/", sprintf("%03d", id[num]), ".csv"))
        nobs <- sum(complete.cases(in_f))
        data[num,] <- c(id[num], nobs)
    }
    data
}