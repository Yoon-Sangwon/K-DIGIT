library(rvest)

daum <- read_html('https://news.daum.net/ranking/popular/', encoding = "UTF-8")
url1 <- 'div.rank_news > ul.list_news2 > li:nth-child('
url2 <- ") > div.cont_thumb > strong > a"
url3 <- 'div.rank_news > ul.list_news2 > li:nth-child('
url4 <- ') > div.cont_thumb > strong > span'
newstitle <- NULL
newspapername <- NULL
for (i in 1:50) {
  content_title <-paste0(url1, i, url2)
  content_name <- paste(url3, i, url4, sep = "")
  newstitle[i] <- html_text(html_nodes(daum, content_title))
  newspapername[i] <- html_text(html_nodes(daum, content_name))
}
newstitle
newspapername
news <- data.frame(newstitle, newspapername)
View(news)
write.csv(news, file = "output/daumnews.csv")
