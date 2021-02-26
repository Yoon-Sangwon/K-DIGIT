a <- list(even = c(), odd = c())
a$even <- 4
a$even <- 5
a
5%%2

# 문제 1
countEvenOdd <- function(vec) {
  odd <- 0
  even <- 0
  if (all(is.numeric(vec))) {
    for (i in vec) {
      if (i %% 2 == 0) {
        even <- even +1
      }
      else {
        odd <- odd+1
      }
    }
    result <- list(even = even, odd = odd)
    return(result)
  }
  else {
    return(NULL)
  }
}
countEvenOdd(c(1,2,3,4,5,6,7))
countEvenOdd(c(1,2,3,4,"5"))

# 문제 2
vmSum <- function(vec){
  if (is.vector(vec) && !is.list(vec)) {
    if (is.numeric(vec)){
      return(sum(vec))
    }
    else {
      print("숫자 벡터를 전달하숑!")
      return(0)
    }
  }
  else {
    print("벡터만 전달하숑!")
  }
}
vmSum(0)
vmSum(list(1,2,3,4,5))
vmSum(c(1,2,3,4,5))
vmSum(c(1,2,3,"4",5))

# 문제 3
vmSum2 <- function(vec){
  if (is.vector(vec) && !is.list(vec)) {
    if (is.numeric(vec)){
      return(sum(vec))
    }
    else {
      warning("숫자 벡터를 전달하숑!")
      return(0)
    }
  }
  else {
    stop("벡터만 전달하숑!")
  }
}
vmSum2(0)
vmSum2(list(1,2,3,4,5))
vmSum2(c(1,2,3,4,5))
vmSum2(c(1,2,3,"4",5))

# 문제 4
mySum <- function(vec){
  if (is.vector(vec) && !is.list(vec)) {
    oddSum <- 0
    evenSum <- 0
    for (i in 1:length(vec)) {
      if (is.na(vec[i])) {
        vec[i] <- min(vec[-i])
        warning("NA를 최저값으로 변경하여 처리함!!")
      }
      if (i %% 2 == 1) {
        oddSum <- oddSum + vec[i]
      }
      else {
        evenSum <- evenSum + vec[i]
      }
    }
    return(list(oddSum, evenSum))
  }
  else if (is.null(vec)) {
    return(NULL)
  }
  else {
    stop("벡터만 처리 가능!!")
  }
}
mySum(list())
mySum(array())
mySum(NULL)
mySum(c(1,2,3,4,5,NA))

# 문제 5
myExpr <- function(func) {
  if (is.function(func)){
    return(func(sample(1:45,6)))
  }
  else {
    stop("수행 안할꺼임!!")
  }
}
myExpr(mean)
myExpr(View)
myExpr(summary)

# 문제 6
creatVector1 <- function(...) {
  p <- c(...)
  if (is.null(p)) {
    return(NULL)
  }
  else if (any(is.na(p))) {
    return(NA)
  }
  else {
    return(p)
  }
}
creatVector1()
creatVector1(1,2,NA,"na")
creatVector1(1,2,3,4,"5",TRUE)

(list(1, 2, 3, 4, "a", "b", "c", TRUE, FALSE))
for (i in list(1, 2, 3, 4, "a", "b", "c", TRUE, FALSE)) {str(i)}

# 문제 7
creatVector2 <- function(...) {
  p <- c(...)
  if (is.null(p)) {
    return(NULL)
  }
  li <- list(...)
  a <- 1
  b <- 1
  c <- 1
  numeric <- c()
  character <- c()
  logical <- c()
  for (i in li) {
    if(is.numeric(i)) {
      numeric[a] <- i
      a <- a + 1
    }
    else if(is.character(i)) {
      character[b] <- i
      b <- b + 1
    }
    else if(is.logical(i)) {
      logical[c] <- i
      c <- c + 1
    }
  }
  return(list(numeric = numeric, character= character, logical = logical))
}
creatVector2()
creatVector2(1, 2, 3, 4, "a", TRUE, "b", "c", "", TRUE, FALSE)

