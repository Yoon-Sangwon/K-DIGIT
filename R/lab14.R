library(tm)
library(proxy)
student <- NULL
s1 <- c('사과 포도 망고')
s2 <- c('포도 자몽 자두')
s3 <- c('복숭아 사과 포도')
s4 <- c('오렌지 바나나 복숭아')
s5 <- c('포도 바나나 망고')
s6 <- c('포도 귤 오렌지')
student <- c(s1, s2, s3, s4, s5, s6)
cps <- VCorpus(VectorSource(student))
dtm <- DocumentTermMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
com_result <- dist(com, method = "cosine")


# 2-3
sdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
as.matrix(sdm)

termFreq <- rowSums(as.matrix(sdm))
termFreq <- termFreq[order(termFreq, decreasing=T)]
names(termFreq[termFreq == max(termFreq)])
names(termFreq[termFreq == min(termFreq)])
    