# 문제1
str(iris)

# 문제2
(df1 <- data.frame(x = c(1:5), y = seq(2, 10, by = 2)))

# 문제3
(df2 <- data.frame(col1 = c(1:5), col2 = letters[1:5], col2 = c(6:10)))

# 문제4
제품명 <- c('사과', '딸기', '수박')
가격 <- c(1800, 1500, 3000)
판매량 <- c(24, 38, 13)
(df3 <- data.frame(제품명, 가격, 판매량))

# 문제5
mean(df3$가격)
mean(df3$판매량)

# 문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math)
df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >= 150, "A",
                    ifelse(df4$score >= 100, "B",
                           ifelse(df4$score >=70, "C", "D")))
df4

# 문제7
myemp <- read.csv(file = "data/emp.csv")
str(myemp)

# 문제8
myemp[3:5,]

# 문제9
myemp[,-1]

# 문제10
myemp[,"ename", drop = F]

# 문제11
myemp[,c("ename", "sal")]

# 문제12
myemp[myemp$job == "SALESMAN", c("ename", "sal", "job")]

# 문제13
myemp[(myemp$sal >= 1000) & (myemp$sal <= 3000), c("ename", "sal", "deptno")]

# 문제14
myemp[myemp$job != "ANALYST", c("ename", "job", "sal")]

# 문제15
myemp[(myemp$job == "SALESMAN") | (myemp$job == "ANALYST"), c("ename", "job")]

# 문제16
myemp[is.na(myemp$comm), c("ename", "sal")]

# 문제17
myemp[order(myemp$sal),]

# 문제18
dim(myemp)

# 문제19
table(myemp$deptno)

# 문제20
table(myemp$job)
