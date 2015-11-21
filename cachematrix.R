## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# you need to pass an invertable matrix as an argument to this function
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    # Not really needing a set function but used it to validate object changes
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m <<-solve
    getinv <- function() m
    # write functions to a list so they can be called for the object
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function
# This takes an object argument created by the makeCacheMatrix function.
  

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)){
        message("There is an existing inverse matrix object, contents below:")
        return(m)
    }
    thisMatrix <- x$get()
    m <- solve(thisMatrix)
    x$setinv(m)
    return(m)
}
