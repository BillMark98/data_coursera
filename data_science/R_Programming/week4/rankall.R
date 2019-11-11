source("rankhospital.R")
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # vector of possible outcomes
    vecOutcome <- c("heart attack", "heart failure", "pneumonia")
    ## all the name of states that appear in the data and in ascending order 
    nameOfStates <- sort(unique(outcomeData$State))
    ## the length of the nameOfStates
    lengthVec <- length(nameOfStates)
    hospitals <- vector(mode = "character", length = lengthVec)
   
    ## For each state, find the hospital of the given rank
    ## iterate the name of states
    for(i in c(1:lengthVec)) {
        hospitals[i] <- rankhospital(nameOfStates[i], outcome, num)
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data.frame(hospital = hospitals,state = nameOfStates)
}