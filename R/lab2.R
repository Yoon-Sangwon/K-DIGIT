# 문제1
(v1 <- sample(1:30,10, replace = T))
v2 <- v1
names(v2) <- c("z", "y", "x", "w", "v", "u", "t", "s", "r", "q")
v2

#문제2
(v <- seq(10, 38, by =2))
(m1 <- matrix(v, nrow=3, ncol=5, byrow = T))
(m2 <- m1 + 100)
(m_max_v <- max(m1))
(m_min_v <- min(m1))
(row_max <- apply(m1, 1, max))
(col_max <- apply(m1, 2, max))

# 문제3
n1 <- c(1:3)
n2 <- c(4:6)
n3 <- c(7:9)
(m2 <- matrix(c(n1, n2, n3), nrow = 3))

# 문제4
q4 <- c(1:9)
(m3 <- matrix(q4, nrow = 3, byrow = T))

# 문제5
m4 <- m3
colnames(m4) <- c('col1', 'col2', 'col3')
rownames(m4) <- c('row1', 'row2', 'row3')
print(m4)

# 문제6
alpha <- matrix(letters[1:6], nrow = 2)
(alpha2 <- rbind(alpha, c('x', 'y', 'z')))
(alpha3 <- cbind(alpha, c('s', 'p')))

# 문제7
a <- array(1:24, dim = c(2, 3, 4))
a[2, 3, 4]
a[2, ,]
a[, 1,]
a[, ,3]
a + 100
a[, , 4] * 100
a[1,2:3,]
a[2, , 2] <- a[2, , 2] + 100
a
a[, , 1] <- a[, , 1] - 2
a
(a <- a * 10)
rm(a)

