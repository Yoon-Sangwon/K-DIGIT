(memo <- readLines("data/memo.txt", encoding = "UTF-8"))
memo <- memo[1:7]
(memo[1] <- gsub("[$&!#@%]", "", memo[1]))
# memo[2] <- toupper(memo[2])
(memo[2] <- gsub("e","E",memo[2]))
(memo[3] <- gsub("[[:digit:]]", "", memo[3]))
(memo[4] <- gsub("[A-Za-z]", "", memo[4]))
(memo[5] <- gsub("[[:digit:]]|[!<>]", "", memo[5]))
(memo[6] <- gsub("[[:space:]]", "", memo[6]))
(memo[7] <- tolower(memo[7]))

write(memo, file = "data/memo_new.txt")
