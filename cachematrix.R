## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#These functions can create a matrix from scratch,
#but also it can check if a given matrix was
#already created, call it from the cache and
#save a lot of running time

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){ #set matrix 
        x <<- y
        m <<- NULL #stores matrix in cache
    }
    
    get <- function(){ #get matrix
        x
    }
    setInverse <- function(solve){ #set inverse matrix
        m <<- solve # solve function to calculate the inverse
    }
    getInverse <- function(){ #get inverse matrix
        m
    }
    
    #Creating list of functions
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

# This function takes an input matrix from the makeCacheMatrix
# function and input its inverse. However, it first checks if 
# these calculations have been previously performed and stored in 
# the cache. If so, it will just retrieve this information and
# save a lot of computational effort and processing time.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getInverse() #storing in m if there is an inverse matrix
    
    if(!is.null(m)){ #if m is not empty (it exists)
        message("Getting cached data!")
        return(m) #retrieves the matrix from the cache
    }
    
    #If not ...
    data <- x$get() #get the matrix from makeCacheMatrix
    m <- solve(data, ...) #compute its inverse
    x$setInverse(m) #store this inverse matrix in cache
    
    m #retrieve the inverse matrix!
}
