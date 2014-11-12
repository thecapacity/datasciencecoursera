corr <- function(directory, threshold = 0) {
    data <- vector()
    files <- list.files(directory)
    for (f in files) {
        in_f <- read.csv(paste0(directory, "/", f))
        cc <- complete.cases(in_f)
        if ( sum(cc) > threshold) {
            data <- append(data, cor(in_f[cc,][['sulfate']], in_f[cc,][['nitrate']]) )
        }
    }
    data
}