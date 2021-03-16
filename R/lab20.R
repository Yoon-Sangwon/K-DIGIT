head(airquality)
str(airquality)

airquality <- airquality[,1:4]
airquality <- airquality[complete.cases(airquality),]
head(airquality)

cor(airquality)

str(with(airquality, cor.test(Ozone, Solar.R)))
corr.test(airquality)
with(airquality, cor.test(Ozone, Solar.R))[["p.value"]]
with(airquality, cor.test(Ozone, Wind))[["p.value"]]
with(airquality, cor.test(Ozone, Temp))[["p.value"]]
with(airquality, cor.test(Solar.R, Wind))[["p.value"]]
with(airquality, cor.test(Solar.R, Temp))[["p.value"]]
with(airquality, cor.test(Wind, Temp))[["p.value"]]

# solar.R 과 Wind 의 상관계수만이 통계적 유의성을 만족하지 않는다.

png(filename = "output/lab201.png")
pairs(airquality)
dev.off()

png(filename = "output/lab202.png")
pairs.panels(airquality, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of airquality Data")
dev.off()

png(filename = "output/lab203.png")
air_cor <- cor(airquality)
corrplot(air_cor, method="pie", type="lower", order="hclust", tl.srt=45, diag=F)
dev.off()
