## HW3 
## https://class.coursera.org/rprog-009/assignment/view?assignment_id=7
## https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf
## 
## source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
## submit()
##

best <- function(state, outcome) {
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
    h2 <- h1[ !is.na(h1), ]
    ## Consider: h2 <- h1[ complete.cases(h1), ]
    index <- with(h2, order(val, name))
    h3 <- h2[index,]
            
    as.character(h3[1,2])
}

## Sample tests:
## best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")