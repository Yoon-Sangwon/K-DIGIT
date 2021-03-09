library(stringr)

# 문제 1
v1 <- c('Happy', 'Birthday', 'to', 'You')
length(v1) + sum(nchar(v1))


# 문제 2
paste(v1[1], v1[2], v1[3], v1[4])


# 문제 3
paste(LETTERS[1:10], 1:10, sep = " ")
paste0(LETTERS[1:10], 1:10)


# 문제 4"
as.list(unlist(strsplit("Good Morning", split = " ")))


# 문제 5
word_s <- c("Yesterday is history, tommrrow is a mystery, today is a gift!",
          "That's why we call it the present – from kung fu Panda")
word_s <- gsub("[,!–]", "", word_s)
(strsplit(word_s, split = " "))


# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
(r1 <- gsub("[가-힣]", "", s1))
(r2 <- gsub("[[:punct:]]", "", s1))
(r3 <- gsub("[가-힣]|[[:punct:]]", "", s1))
(r4 <- gsub("100", "백", s1))


# 문제 7
library(KoNLP)
hotel <- readLines("output/hotel.txt", encoding = "ANSI")
hotel <- gsub("[[:punct:]]|[[:digit:]]|[A-z]", "", hotel)
head(hotel)

hotel_data <- extractNoun(hotel)
hotel_data <- unlist(hotel_data)
hotel_data <- Filter(function(x) {(nchar(x) >= 2) & (nchar(x) < 10)}, hotel_data)
hotel_table <- table(hotel_data)
hotel_final <- sort(hotel_table, decreasing = T)
hotel_top6 <- head(hotel_final)
str(hotel_top6)
hotel_top6 <- as.data.frame(hotel_top6)
names(hotel_top6) <- c("wname", "wcount")
hotel_top6

write.csv(hotel_top6, file = "output/hotel_top_word.csv")
