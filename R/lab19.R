library(dplyr)
library(fmsb)

picher <- read.csv(file = "data/picher_stats_2017.csv", encoding = "UTF-8")
str(picher)
head(picher)
picher <- picher %>%
  select("선수명", "삼진" = "삼진.9", "볼넷" = "볼넷.9", "홈런" = "홈런.9")
head(picher)

summary(picher)
max.picher <- c(25, 20, 10)
min.picher <- c(0, 0, 0)

picher_차우찬 <- picher[4,-1]
row.names(picher_차우찬) <- "차우찬"
picher_차우찬

ds <- rbind(max.picher, min.picher, picher_차우찬)
ds
str(ds)

png(filename = "output/lab19.png")
radarchart(ds,                           # 데이터프레임
           pcol='dark blue',             # 다각형 선의 색 
           pfcol=rgb(0.5, 0.5, 1, 0.5),  # 다각형 내부 색
           plwd=3,                       # 다각형 선의 두께
           cglcol='grey',                # 거미줄의 색
           cglty=1,                      # 거미줄의 타입
           cglwd=0.8,                    # 거미줄의 두께
           axistype=1,                   # 축의 레이블 타입
           seg=4,                        # 축의 눈금 분할                         
           axislabcol='grey',            # 축의 레이블 색
           caxislabels=seq(0,100,25),     # 축의 레이블 값
           title = paste(row.names(ds[3,]), "선수의 성적")
)
dev.off()
