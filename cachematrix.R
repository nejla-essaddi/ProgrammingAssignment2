
makeCacheMatrix <- function(x = matrix()) {
        ## Here we assign the inverse code by NULL - ing the i the term
        i <- NULL
        
        ## With set and get we create and return the matrix
        set <- function (matrix) {
                t <<- matrix
                i <<- NULL
        }
        get <- function() {
                m
        }
        ## With set inverse and get inverse we pass through the t*x = s where
        ## t is our matrix and we try to calculate the inverse to multiply in the 
        ## future
        setInverse <- function(inverse) {
                i <<- inverse
        }
        getInverse <- function() {
                
                i
        }
        
        ## Return a list of the methods
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}
## If after this calculation your matrix has not changed than initialize "cachesolve"
## to retrieve the inverse from the cache. 
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
        
        t <- x$getInverse()

        ## Just return the inverse if its already set
        if( !is.null(t) ) {
        message("getting cached data")
        return(t)
}

        ## Get the matrix from our object
        data <- x$get()

        ## Calculate the inverse using matrix multiplication
        t <- solve(data) %*% data

        ## Set the inverse to the object
        x$setInverse(t)

        ## Return the matrix
        t
        }

