## Put comments here that give an overall description of what your
## functions do
### >>> Following 2 functions are related to Week-3 assignment of Coursera-R Language course
### >>> With these 2 functions we will try to keep a cache of a matrix inverse() 

## Write a short comment describing this function
### >>>> makeCacheMatrix function creates a matrix object that will store its inverse .
### >>> input to this function should be a squared matrix or else it will throw error.
makeCacheMatrix <- function(x = matrix(),...) {

## >> create object to store the inverse of a matrix. keep it NULL for verification.
  inverse_matrix <- NULL
  setMatrix <- function(userMatrix) {
    x <<- userMatrix
    inverse_matrix <<- NULL
  }
  getMatrix <- function(){x}
  
  setInverseMatrix <- function(Computed_InverseMatrix)
  {
    inverse_matrix <<- Computed_InverseMatrix
  }
  
  getInverseMatrix <- function() {inverse_matrix}
  
  ### return list with get, set option. 
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setInverseMatrix = setInverseMatrix,
       getInverseMatrix = getInverseMatrix)
}## makeCacheMatrix function over ..


## Write a short comment describing this function
### >>> CacheSolve function will make use of makeCacheMatrix to store inverse of a matrix
### >>> if the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
### >>> cacheSolve should accept makeCacheMatrix as the object type.
### >>> default a 2x2 matrix containing 1:4 element is provided.

cacheSolve <- function(x=makeCacheMatrix(y<-matrix(1:4,2,2)), ...) {

### check if already an inverse present..
 matrix_inverse <- x$getInverseMatrix()
  if(!is.null(matrix_inverse)) {
    print("Data is already cached.. fetching the cached data")
    return(matrix_inverse)
  }
  else{
    print("Data is not cached.. doing the calcuation now ..")
### need to compute the inverse with solve() function.   
    matrix_inverse <- solve(as.matrix(x$getMatrix()))
### set these inverse to makeCacheMatrix object for future caching
    x$setInverseMatrix(matrix_inverse)
#### All done. now return with inverse matrix
    return(matrix_inverse)
  }
}## cacheSolve function over ..