add2 <- function(x, y) {
    x+y 
}

above10 <- function(v) {
    v[v>10]
}

above <- function(v, n = 10) {
    v[v>n]
}

col_meanse <- function(df, removeNA = TRUE) {
    nc <- ncol(df)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean( df[,i], na.rm = removeNA )
    }
    return(means)
}

make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}