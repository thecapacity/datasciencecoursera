pollutantmean <- function(directory, pollutant, id = 1:332) {
    data <- vector()
    
    for (num in id) {
        in_f <- read.csv(paste0(directory, "/", sprintf("%03d", num), ".csv"))
        data <- append(data, in_f[pollutant][!is.na(in_f[pollutant])] )
    }
    round(mean(data, na.rm = TRUE),3)
}