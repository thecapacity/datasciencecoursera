myfunction <- function(x) {
	y <- rnorm(100)
	mean(y)
}

secondfunc <- function(x) {
	x + rnorm(length(x))
}