pollutantmean <- function(directory, pollutant, id = 1:332) {
    cumSum = 0
    dataSize = 0
    for(index in id) {
        fileName <- convertString(index)
        fileName <- paste(directory,"/",fileName,".csv",sep='')
        myData <- read.csv(fileName)
        pollutData <- myData[,pollutant]
        rawData <- pollutData[!is.na(pollutData)]
        dataSize <- dataSize + length(rawData)
        cumSum <- cumSum + sum(rawData)
    }
    cumSum/dataSize
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