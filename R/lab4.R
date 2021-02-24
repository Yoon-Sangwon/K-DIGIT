# 문제 1
(L1 <- list(
  name = "scott",
  sal = 3000
))
(result1 <- L1[["sal"]] * 2)

# 문제 2
(L2 <- list("scott", c(100, 200, 300)))

# 문제 3
L3 <- list(c(3, 5, 7), c("A", "B", "C"))
L3[[2]][1] <- "Alpha"
L3

# 문제 4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[["alpha"]] <- L4[["alpha"]] + 10
L4

# 문제 5
emp <- read.csv(file = "data/emp.csv")
(L5 <- list(
  data1 = LETTERS,
  data2 = emp[1:3,],
  data3 = L4
))
L5[["data1"]][1]
L5[["data2"]]$ename
L5$"data3"$gamma

# 문제 6
L6 <- list(
  math=list(95, 90),
  writing=list(90, 85),
  reading=list(85, 80)
)


avg <- 0
for (i in 1:2) {
  avg <- 0
  for (j in 1:3) {
    avg <- avg + unlist(L6[[i]])[j]
  }
  print(avg)
}

(unlist(L6$math)[1] + unlist(L6$writing)[1] + unlist(L6$reading)[1])/3
(unlist(L6$math)[2] + unlist(L6$writing)[2] + unlist(L6$reading)[2])/3

# 문제 7
grade <- sample(1:6, 1)
switch (EXPR = grade,
  cat(grade, "학년은 저학년입니다."),
  cat(grade, "학년은 저학년입니다."),
  cat(grade, "학년은 저학년입니다."),
  cat(grade, "학년은 고학년입니다."),
  cat(grade, "학년은 고학년입니다."),
  cat(grade, "학년은 고학년입니다.")
)

# 문제 8
choice <- sample(1:5, 1)
switch(EXPR = choice,
   cat(choice, "\n", "결과값 :", 300 + 50, sep = ""),
   cat(choice, "\n", "결과값 :", 300 - 50, sep = ""),
   cat(choice, "\n", "결과값 :", 300 * 50, sep = ""),
   cat(choice, "\n", "결과값 :", 300 / 50, sep = ""),
   cat(choice, "\n", "결과값 : ", 300 %% 50, sep = ""),
)

# 문제 9
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
idx = 1
while (idx <= count) {
  switch(EXPR = deco,
    cat("*"),
    cat("$"),
    cat("#")
  )
  idx <- idx + 1
}

# 문제 10
score <- as.character(sample(0:100, 1))
level <- switch (EXPR = score,
           "90" =, "91" =, "92" =, "93" =, "94" =, "95" =,
           "96" =, "97" =, "98" =, "99" = , "100" = "A 등급",
           "80" =, "81" =, "82" =, "83" =, "84" =, "85" =,
           "86" =, "87" =, "88" =, "89" = "B 등급",
           "70" =, "71" =, "72" =, "73" =, "74" =, "75" =,
           "76" =, "77" =, "78" =, "79" = "C 등급",
           "60" =, "61" =, "62" =, "63" =, "64" =, "65" =,
           "66" =, "67" =, "68" =, "69" = "D 등급",
           "F 등급"
)
cat(score, " 점은 ", level, "입니다.", sep = "")

# 문제 11
print(paste(LETTERS, letters, sep = ""))

