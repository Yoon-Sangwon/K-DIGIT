# 문제 8
text1 <- scan("data/iotest1.txt")

cat("오름차순 :", sort(text1))
cat("내림차순 :", sort(text1, decreasing = TRUE))
cat("합 :", sum(text1))
cat("평균 :", mean(text1))
