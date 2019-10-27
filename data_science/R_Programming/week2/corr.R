corr <- function(directory,threshold = 0) {
    #rawData <- data.frame(matrix(ncol = 2,nrow = 0))
    #colnames(rawData) <- c("sulfate","nitrate")
    v <- vector(mode = "numeric", length = 0)
    for(index in c(1:332)) {
        fileName <- paste(directory,"/",convertString(index),".csv",sep = '')
        myData <- read.csv(fileName)
        completeString <- subset(myData,!is.na(sulfate) & !is.na(nitrate))
        #rawData <- rbind(rawData,completeString[,c("sulfate","nitrate")])
        if(nrow(completeString) > threshold) {
            v[length(v) + 1] = cor(completeString$sulfate, completeString$nitrate)
        }
    }
    v
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