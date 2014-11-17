## HW3.4
## https://class.coursera.org/rprog-009/assignment/view?assignment_id=7
## https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf
## 
## source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
## submit()
##

rankall <- function(outcome, num = "best") {  
    valid_states <- c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU",
                      "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", 
                      "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", 
                      "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", 
                      "VA", "VI", "VT", "WA", "WI", "WV", "WY") 
    
    valid_outcomes <- data.frame( row.names=c("heart attack", "heart failure", "pneumonia"), 
                                  reference=c(11, 17, 23) )
    
    if (! outcome %in% row.names(valid_outcomes)) { stop("invalid outcome") }
    outcome_index <- valid_outcomes[outcome,1]
    
    care_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    suppressWarnings({care_data[, outcome_index] <- as.numeric(care_data[, outcome_index])})
    
    'hospitals <- lapply(valid_states, function(state) { 
                            sel <- care_data["State"] == state
                            name <- care_data["Hospital.Name"][sel]
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
                    })
    
    data.frame(hospital=hospitals, state=valid_states, row.names=valid_states)'
    
    r <- data.frame(hospital=NA, state=valid_states, row.names=valid_states)
    
    for (state in valid_states) {
        sel <- care_data["State"] == state
        name <- care_data["Hospital.Name"][sel]
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
        r[state, "hospital"] = as.character(h3[rank,2])
    }    
    r
}

## head(rankall("heart attack", 20), 10)
## tail(rankall("pneumonia", "worst"), 3)
## tail(rankall("heart failure"), 10)
