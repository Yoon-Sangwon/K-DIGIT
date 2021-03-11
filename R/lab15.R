# 문제 1
library(showtext)
showtext_auto()
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

g1 <- read.table("data/product_click.log")

png(filename="output/clicklog1.png", height=700, width=700, bg="white")

barplot(colSums(table(g1)), col = terrain.colors(10))
title(main="세로바 그래프 실습", col.main="red",
      font.main=4, family="dog")
title(xlab="상품 ID", family="dog")
title(ylab="클릭수", family="dog")

dev.off()

# 문제 2
g1$V1 <- substr(g1$V1,9,10)
g1_table <- table(g1$V1)
as.integer(names(g1_table))

png(filename="output/clicklog2.png", height=500, width=500, bg="white")

pie(g1_table,
    labels = paste(as.numeric(names(g1_table)), "-", as.numeric(names(g1_table))+1),
    col = rainbow(19))
title(main="파이 그래프 실습", col.main="blue",
      font.main=4, family="maple")

dev.off()

# 문제 3
(성적 <- read.table("data/성적.txt", header=TRUE));

png(filename="output/clicklog3.png", height=500, width=500, bg="white")

boxplot(성적[,3:5],    
        col=c('red', 'green', 'blue'))
title(main="과목별 성적 분포", col.main="orange",
      font.main=4, family="maple")

dev.off()

# 문제 4
t_성적 <- t(성적[3:5])

png(filename="output/clicklog4.png", height=500, width=500, bg="white")

barplot(t_성적, col = cm.colors(3), family="maple",
        names.arg = 성적$성명, legend.text = T)
title(main="학생별 점수", col.main="hotpink",family="maple")

dev.off()
