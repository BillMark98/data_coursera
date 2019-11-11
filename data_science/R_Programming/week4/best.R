best <- function(state, outcome) {
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # vector of possible outcomes
    vecOutcome <- c("heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    ## match() returns the matched number, if there's no match return NA
    if(is.na(match(state, outcomeData$State))) {
        stop("invalid state")
    }
    if(is.na(match(outcome, vecOutcome))) {
        stop("invalid outcome")
    }
    ## determine the corresponding column of the outcomeData 
    if(outcome == "heart attack") {
        colNum <- 11
    }
    else if(outcome == "heart failure") {
        colNum <- 17
    }
    else {
        colNum <- 23
    }
    ## subset the outcomeData according to the state
    stateData <- outcomeData[(outcomeData$State == state),]
    ## Return hospital name in that state with lowest 30-day death rate and suppress warnings
    stateData[,colNum] <-  suppressWarnings(as.numeric(stateData[,colNum]))
    ## using order() function first sort according to the mortality rate, then alphabetical
    ## order of the hospital name(the 2-nd column), removing NA
    stateData <- stateData[order(stateData[,colNum],stateData[,2],na.last = NA),]
    stateData[1,2]
}