## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##creates a special "matrix", which is really a list containing a function to
    ##1. set the value of the matrix
    ##2. get the value of the matrix
    ##3. set the value of the inverse
    ##4. get the value of the inverse (using solve)

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

##calculates the inverse matrix of the special "matrix" created with the above function
##first checks to see if inverse has already been calculated
    ##if so, gets inverse from cache
    ##if not, calculates inverse and sets value to the cache in the setinverse function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m    
}
