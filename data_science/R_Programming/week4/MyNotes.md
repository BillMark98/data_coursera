### create a vector of given size
for example
```
X <- vector(mode="character", length=10)
```

### suppress warnings
e.g.
```
stateData[,colNum] <- suppressWarnings(as.numeric(stateData[,colNum]))
```  
### create a certain data frame
e.g
```
data.frame(hospital = hospitals,state = nameOfStates)
```

### switch statement
it seems in R there is no switch statement, just use `if-else`

### sort a data frame with respect to a certain column
e.g
```
stateData <- outcomeData[(outcomeData$State == state),]
```

### check if a element is contained in a column of a data frame
use `match` function
