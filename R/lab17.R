library(dplyr)
library(ggplot2)

# 문제 1

# 1-1
str(mpg)
# 1-2
dim(mpg)
# 1-3
head(mpg, 10)
# 1-4
tail(mpg, 10)
# 1-5
View(mpg)
# 1-6
summary(mpg)
# 1-7
mpg %>% count(manufacturer)
# 1-8
mpg %>% count(manufacturer, model)


# 문제 2
mpg2 <- mpg %>% rename(city = cty, highway = hwy)
head(mpg2)


# 문제 3

# 3-1
str(midwest)
# 3-2
midwest <- midwest %>% rename(total = poptotal, asian = popasian)
head(midwest)
# 3-3
midwest <- midwest %>% mutate(percentage = asian / total * 100)
# 3-4
midwest <- midwest %>%
  mutate(factor = ifelse(percentage > mean(percentage), "large", "small"))
mean(midwest$percentage)
midwest %>% select(percentage, factor)


# 문제 4

# 4-1
mpg %>% mutate(displ_factor = ifelse(displ<=4, "small", "large")) %>%
  group_by(displ_factor) %>% summarise(hwy_mean = mean(hwy))
# 4-2
mpg %>% filter(manufacturer == "audi"| manufacturer == "toyota") %>%
  group_by(manufacturer) %>% summarise(cty_mean = mean(cty))
# 4-3
mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>%
  group_by(manufacturer) %>% summarise(hwy_mean = mean(hwy))


# 문제 5

# 문제 5-1
mpg_new <- mpg %>% select(class, cty)
head(mpg_new)
# 문제 5-2
mpg_new %>% filter(class %in% c("suv", "compact")) %>%
  group_by(class) %>% summarise(cty_mean = mean(cty))


# 문제 6
head((mpg %>% filter(manufacturer == "audi") %>%
        arrange(desc(hwy))),5)
