complete <- function(directory,index = 1:332) {
    n = length(index)
    completeData <- data.frame(id = index,nobs = rep(0,n))
    for(i in seq_along(index)) {
        fileName <- convertString(index[i])
        fileName <- paste(directory,"/",fileName,".csv",sep='')
        myData <- read.csv(fileName)
        completeString <- subset(myData,!is.na(sulfate) & !is.na(nitrate))
        completeData[i,2] = nrow(completeString)
    }
    completeData
}

# convert a numeric to a 3-digit string e.g 1 -> 001
convertString <- function(x) {
    if( x <10) {
        y <- paste("00",as.character(x),sep ='')
    }
    else if( 10 <= x && x < 100) {
        y <- paste("0", as.character(x),sep = '')
    }
    else {
        x
    }
}