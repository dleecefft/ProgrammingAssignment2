mcmat <- function(x = matrix()) {
    m <- NULL
    # Not really needing a set function but good that we have it
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

cread <- function(x){
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