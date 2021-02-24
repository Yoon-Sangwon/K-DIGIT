# 문제1
v1 <- c(1:10)
v2 <- v1 * 2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1; v2; max_v; min_v; avg_v; sum_v; v3

# 문제2
c4 <- seq(1, 9, by = 2)
c5 <- rep(1, 5)
c6 <- rep(c(1, 2, 3), 3)
c7 <- rep(1:4, each = 2)
c4; c5; c6; c7

# 문제3
nums <- sample(1:100, 10)
nums[order(nums)]
nums[order(nums, decreasing = TRUE)]
nums[nums > 50]
which(nums <= 50)
which.max(nums)
which.min(nums)

# 문제4
v8 <- seq(1, 10, by = 3)
v8
names(v8) <- LETTERS[1:4]
v8

# 문제5
score <- sample(1:20, 5)
myFriend <- c("둘리", "또치", "도우너", "희동", "듀크")
paste(score, myFriend, sep = "-")
myFriend[which.max(score)]
myFriend[which.min(score)]
myFriend[which(score > 10)]

# 문제6
count <- sample(1:100, 7)
week.korname <- c("일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일")
paste(count, week.korname, sep = " : ")
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count>50)]
