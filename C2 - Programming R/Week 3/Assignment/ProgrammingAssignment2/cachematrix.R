# Creates a Matrix object
#
# Param Matrix x
# Return set/get functions for both matrix and cache

makeCacheMatrix <- function(x = matrix()) {
    # Clear cache
    m <- NULL
    
    # Defines the set function to create matrix
    set <- function(y) {
        # Set matrix and clear cache
        x <<- y
        m <<- NULL
    }
    
    # Defines the get function to get matrix
    get <- function() x
    
    # Defines the set function to create inverse
    setInverse <- function(inverse) m <<- inverse
    
    # Defines the get function to return the inverse
    getInverse <- function() m
    
    # Returns list of defined functions
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


# This function returns the inverse of matrix by checking first if there is
# an existing in cache. If not, the inverse in stored in cache and returned
#
# Param Matrix x
# Return Inverse of Matrix x

cacheSolve <- function(x, ...) {
    
    # Gets the inverse value in cache
    m <- x$getInverse()
    
    # If not empty, return inverse from cache
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    # If empty, get the matrix
    data <- x$get()
    
    # Calculates its inverse
    m <- solve(data, ...)
    
    # Stores in cache
    x$setInverse(m)
    
    # Returns inverse
    m
}
