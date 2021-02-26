# 문제 1
exam1 <- function(){
  return(paste(LETTERS,letters,sep = ""))
}
exam1()

# 문제 2
exam2 <- function(num){
  sum <- 0
  for(i in 1:num) {
    sum = sum + i
  }
  return(sum)
}
exam2(4)

# 문제 3
exam3 <- function(num1, num2) {
  if (num1 >= num2) {
    result <- num1 - num2
  }
  else {
    result <- num2 - num1
  }
  return(result)
}

exam3(5, 20)
exam3(55, 20)
exam3(2, 2)

# 문제 4
exam4 <- function(num1, oper, num2) {
  if (oper == "+") {
    return(num1 + num2)
  }
  else if (oper == "-"){
    return(num1 - num2)
  }
  else if (oper == "*"){
    return(num1 * num2)
  }
  else if (oper == "%/%"){
    if (num1 == 0) {
      print("오류1")
    }
    if (num2 == 0) {
      print("오류2")
    }
    return(num1 %/% num2)
  }
  else if (oper == "%%"){
    if (num1 == 0) {
      print("오류1")
    }
    if (num2 == 0) {
      print("오류2")
    }
    return(num1 %/% num2)
  }
  else {
    print("규격의 연산자만 전달하세요")
  }
}
exam4(2, "%/%", 0) 

# 문제 5
exam5 <- function(x, y="#") {
  if (x>0) {
    for (i in 1:x){
      cat(y)
    }
  }
}
exam5(5)

# 문제 6
exam6 <- function(...) {
  score <- c(...)
  for(s in score){ 
    if(!is.na(s)){
      if(s >= 85){
        level = '상'
      }else if(s >= 70){
        level = '중'
      }else{
        level = '하'
      }
      print(paste(s,'점은',level,'등급입니다.'))
    }else{
      print("NA는 처리불가")
    }
  }  
  return()
}
exam6(50,60,70,80,90)
exam6(50,60,70,80,90, NA)
