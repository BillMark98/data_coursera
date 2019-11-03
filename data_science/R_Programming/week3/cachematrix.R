## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# this function creats a "matrix",(actually a list of four functions)
# just like the example given in the introduction. 
# the returned object has four functions
# 1. set the matrix value
# 2. get the matrix value
# 3. set the matrix inverse
# 4. get the cached matrix inverse
# combined with the cacheSolve function, example usage:
# x <- matrix(c(1,2,3,4),nrow = 2, ncol = 2)
# xMatrix <- makeCacheMatrix(x)
# xInv <- cacheSolve(xMatrix)
# prove xInv %*% x == "Identiy matrix"
makeCacheMatrix <- function(x = matrix()) {
    xInv <- NULL
    # set matrix value
    set <- function(y) {
        x <<- y
        xInv <<- NULL
    }
    get <- function() x
    setinverse <- function(invMatrix) xInv <<- invMatrix
    getinverse <- function() xInv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function
# return the matrix inverse of the matrix x created
# by the function  makeCacheMatrix
# if the inverse was not calculated before, use solve() to calculate the inverse
# if the inverse was already calculated, return the cached inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    xInv <- x$getinverse()
    if(!is.null(xInv)) {
        message("getting cached data")
        return(xInv)
    }
    data <- x$get()
    xInv <- solve(data)
    x$setinverse(xInv)
    xInv
}
