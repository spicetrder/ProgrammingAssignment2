## cachematrix.R
##
## This R.script provides two functions:
## makeCacheMatrix - given an input matrix, provides functions for use elsewhere 
## cacheSolve - returns matrix inverse of matrix input
##
##
## This function will store a matrix and its' inverse and provide functions
## to access matrix and inverse

makeCacheMatrix <- function(x) {
  cachedMXT <- x
  cachedINV <- solve(x)
  #
  getMTX <- function() x
  getINV <- function() cachedINV
list(getMTX = getMTX, getINV = getINV)
}
##
##
## This function will take an input matrix created with the makeCacheMatrix function
## and, if the inverse exists, return its' inverse, otherwise the inverse is calculated
## within the function and returned.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getINV()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  INV <- solve(data, ...)
  x$setINV(x)
  INV
}
##