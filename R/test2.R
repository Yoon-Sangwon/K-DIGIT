# 문제 9
test2 <- scan("data/iotest2.txt", what = "")

cat("가장 많이 등장한 단어는", test2[max(table(test2))],"입니다.")
