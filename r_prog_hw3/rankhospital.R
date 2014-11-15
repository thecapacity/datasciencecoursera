## HW3.3
## https://class.coursera.org/rprog-009/assignment/view?assignment_id=7
## https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf
## 
## source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
## submit()
##

rankhospital <- function(state, outcome, num = "best") {  
    valid_states <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID",
                      "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO",
                      "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", 
                      "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY", "GU")
    if (! state %in% valid_states) { stop("invalid state") }
    
    valid_outcomes <- data.frame( row.names=c("heart attack", "heart failure", "pneumonia"), 
                                  reference=c(11, 17, 23) )
    
    if (! outcome %in% row.names(valid_outcomes)) { stop("invalid outcome") }
    outcome_index <- valid_outcomes[outcome,1]
    
    care_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    suppressWarnings({care_data[, outcome_index] <- as.numeric(care_data[, outcome_index])})
    
    sel <- care_data["State"] == state
    name <- care_data['Hospital.Name'][sel]
    val <- care_data[outcome_index][sel]
    
    h1 <- data.frame(val, name)
    h2 <- h1[ complete.cases(h1), ]
    index <- with(h2, order(val, name))
    h3 <- h2[index,]

    rank <- num
    if (num == "best") {
        rank <- 1
    }
    else if ( num == "worst" ) {
        rank <- nrow(h3)
    }
    else if ( num < 1 || num > nrow(h3) )
    {
        return(NA);
    }

    as.character(h3[rank,2])
}

## > rankhospital("TX", "heart failure", 4)
##  [1] "DETAR HOSPITAL NAVARRO"
## > rankhospital("MD", "heart attack", "worst")
##  [1] "HARFORD MEMORIAL HOSPITAL"
## > rankhospital("MN", "heart attack", 5000)
##  [1] NA