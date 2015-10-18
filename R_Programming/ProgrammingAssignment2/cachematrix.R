## Put comments here that give an overall description of what your
## functions do


## In general, the inverse of the matrix is computed. However, the computation of inverse might be expensive.
## Therefore, I might use of cache. So, the functions checks whether the inverse has been already computed.
## If so, the result is taken from the cache.

## In order to do this, two functions are necessary: makeCacheMatrix and cacheSolve


## Write a short comment describing this function
## makeCacheMatrix is a function that stores a list of functions (set,get, setinverse and getinverse).
## get is a function that returns the matrix x stored in the main function. No input is required.
## set is a function that changes the matrix stored.
## setinverse is a function that basically stored the value of variable m (no inverse calculation).
## getinverse is a function that returns this stored value

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## cacheSolve is function that returns a inverse of the matrix stored in the main function.
## First, it checks if the inverse has been previously computed (getinverse). 
## If so, it returns the message ("getting cached data") and returns the inverse
## If no, the inverse is computed (solve), it is stored to the cache(setInverse) and returned.

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


