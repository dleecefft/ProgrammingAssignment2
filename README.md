### Introduction

This my completed version of second programming assignment.
To date I have not found the lectures and book align too closely with 
what we are supposed to do for the assignments. I am quite thankful there was a
simplified walk thru with some other functions within a function.

https://github.com/DanieleP/PA2-clarifying_instructions

Based on my understanding of object oriented programming, if this were Java the 
function within a function would be method within an object. Creating an object
with the function that calls functions is pretty much like instantiating an
object from a class definition. Blob = new(blob(arg1,arg2)) now Blob.method1()
means something.

Once I got my head around that it was fairly simple to do the assignment.

There are two other files in this repo, tracing my steps before I updated the 
official file to be handed in.

###Test Suite :-)

I tested with both an instantiated object and a new regular matrix
as expected a matrix created manually just errors out but works as expected 
providing the matrix used for the initial object creation is able to be inverted.

Declare a square matrix, this number set seems to work.
```
thisMatrix <- matrix(1:4,2,2)
tm <- makeCacheMatrix(thisMatrix)
cacheSolve(tm)
```
The first time it just prints the inverse but if you run the function a second
time the indication it's pulling from cache appears.
```
cacheSolve(tm)
There is an existing inverse matrix object, contents below:
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
```

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean
4.  get the value of the mean

<!-- -->

    makeVector <- function(x = numeric()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setmean <- function(mean) m <<- mean
            getmean <- function() m
            list(set = set, get = get,
                 setmean = setmean,
                 getmean = getmean)
    }

The following function calculates the mean of the special "vector"
created with the above function. However, it first checks to see if the
mean has already been calculated. If so, it `get`s the mean from the
cache and skips the computation. Otherwise, it calculates the mean of
the data and sets the value of the mean in the cache via the `setmean`
function.

    cachemean <- function(x, ...) {
            m <- x$getmean()
            if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
            }
            data <- x$get()
            m <- mean(data, ...)
            x$setmean(m)
            m
    }

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

In order to complete this assignment, you must do the following:

1.  Fork the GitHub repository containing the stub R files at
    [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2)
    to create a copy under your own account.
2.  Clone your forked GitHub repository to your computer so that you can
    edit the files locally on your own machine.
3.  Edit the R file contained in the git repository and place your
    solution in that file (please do not rename the file).
4.  Commit your completed R file into YOUR git repository and push your
    git branch to the GitHub repository under your account.
5.  Submit to Coursera the URL to your GitHub repository that contains
    the completed R code for the assignment.

### Grading

This assignment will be graded via peer assessment.
