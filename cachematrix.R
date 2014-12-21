## Put comments here that give an overall description of what your
## functions do
##makeCacheMatrix funtion is used to create an object for the cacheSolve
##set function is just used to set default values
##get function is to get the value of matrix passed( i.e. x)
##setsolve function stores the calue of inverse in m
##getsolve function is used to the cache value

## Write a short comment describing this function
##It creates the object which is called in cacheSolve and also 
##used to get and set values

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }

  get<-function() x  
  setsolve<-function(solve) m<<-solve
  
  getsolve<-function() m
  
  list(set=set,get = get,          
       setsolve = setsolve,  
       getsolve = getsolve)
  
}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  m<-matrix()
  class(m)
  m<-x$getsolve()
  if(!is.null(m)){
    message("getting cached data")  # ... send this message to the console
  return(m)                       # ... and return the solve ... "return" ends
  }
  data<-x$get()
  m<-solve(data)
  x$setsolve(m)
  m
}

