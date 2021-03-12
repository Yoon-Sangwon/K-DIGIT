library(ggplot2)
library(dplyr)

mpg
# 문제 1
ggplot(mpg, aes(x = cty, y = hwy, col = blue)) + geom_point(colour = "blue")
ggsave("output/result1.png")


# 문제 2
ggplot(mpg, aes(x = class)) + geom_bar(aes(fill=drv))
ggsave("output/result2.png")


# 문제 3
g1 <- read.table("data/product_click.log")
head(g1)
ggplot(g1, aes(x = V2)) + geom_bar(aes(fill=V2))
ggsave("output/result3.png")


# 문제 4
str(g1$V1)
g1$V1 <- substr(g1$V1, 1, 8)
g1$V1 <- as.Date(g1$V1, format = "%Y%m%d")
str(g1$V1)
g1 <- g1 %>% mutate(day = paste0(format(V1, "%a"),"요일"))
ggplot(g1, aes(x = day)) + geom_bar(aes(fill=day)) + labs(x = "요일", y = "클릭수") + theme_light()
ggsave("output/result4.png")


# 문제 5
library(showtext)
showtext_auto()
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

library(treemap)
data(GNI2014)
head(GNI2014)
?treemap()
png(filename = "output/result5.png", height = 400, width = 600)
treemap(GNI2014, vSize="population",
        index=c("continent", "country"),
        title="전세계 인구 정보",
        fontfamily.title="maple",
        fontsize.title = 20,
        fontfamily.labels="maple",
        border.col = "green")


dev.off()
