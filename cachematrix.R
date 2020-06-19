## The first function, makeCacheMatrix creates a special "matrix", which is reall a list containing a function to

## 1. set : set the value of the matrix
## 2. get: get the value of the matrix
## 3. setinverse : set the value of the inverse of the matrix
## 4. getinverse : get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	iv <- NULL
	set <- function(y) {
		x <<- y
		iv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) iv <<- inverse
	getinverse <- function() iv
	list(set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)
}

## The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
	iv <- x$getinverse()
	if (!is.null(iv)) {
		message("getting cached data")
		return (iv)
	}
	data <- x$get()
	iv <- solve(data, ...)
	x$setinverse(iv)
	iv
}

