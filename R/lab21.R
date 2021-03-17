purifier <- read.csv(file = "data/purifier.csv")
head(purifier)
str(purifier)

purifier$new_purifier <- purifier$purifier - purifier$old_purifier
head(purifier)

purifier.lm <- lm(as_time ~ old_purifier + new_purifier, data = purifier)
summary(purifier.lm)

# model as_time = 193.7 + 0.2398 * old_purifier + 0.08881 * new_purifier

# 예측
predict.lm(purifier.lm, newdata = data.frame(old_purifier = 70000, new_purifier = 230000)) / (8 * 20)

# 약 234명을 고용하여야 한다.