library(httr)
library(rvest)
library(XML)
# API 실습 1
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query_lab9 <- URLencode(iconv("맛집","euc-kr","UTF-8"))
url_lab9 <- paste0(searchUrl, "?query=", query_lab9, "&display=100")
doc_lab9 <- GET(url_lab9, add_headers("Content_Type" = "application/xml",
                                      "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))


# 블로그 내용에 대한 리스트 만들기		
doc2_lab9 <- htmlParse(doc_lab9, encoding="UTF-8")
text_blog<- xpathSApply(doc2_lab9, "//item/description", xmlValue)
text_blog
text_blog <- gsub("</?b>", "", text_blog) # </?b> --> <b> 또는 </b>
text_blog <- gsub("&.+t;", "", text_blog) # &.+t; --> &at;, &abct;, &1t;, &111t; ...
text_blog[81]
text_blog

write(text_blog, file = "output/naverblog.txt")

# API 실습 2
library(rtweet)
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key_covid <- "코로나"
key_covid <- enc2utf8(key_covid)
result_covid <- search_tweets(key_covid, n=100, token = twitter_token)
(content_covid <- result_covid$retweet_text)
content_covid <- gsub("[[:lower:][:upper:][:punct:][:cntrl:]]", "", content_covid)
content_covid <- content_covid[!is.na(content_covid)]

write(content_covid, file = "output/twitter.txt")

# API 실습 3
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url_bus <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc_bus <- xmlParse(url_bus, encoding="UTF-8")
top_bus <- xmlRoot(doc_bus)
top_bus
df_bus <- xmlToDataFrame(getNodeSet(doc_bus, "//itemList"))
View(df_bus)
bus_360 <- df_bus[1,]

cat("노선ID :", bus_360$busRouteId)
cat("노선길이 :", bus_360$length)
cat("기점 :", bus_360$stStationNm)
cat("종점 :", bus_360$edStationNm)
cat("배차간격 :", bus_360$term)

# API 실습 4
searchUrl <- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query_bd <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url_bd <- paste0(searchUrl, "?query=", query_bd, "&display=100")
doc_bd <- GET(url_bd, add_headers("Content_Type" = "application/json",
                               "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

json_data_bd <- content(doc_bd, type = 'text', encoding = "UTF-8")
json_obj_bd <- fromJSON(json_data_bd)
df_bd <- data.frame(json_obj_bd)

text_bd <- c(df_bd["items.title"])
text_bd <- unlist(text_bd)
str(text_bd)
text_bd

text_bd <- gsub("<b>", "", text_bd)
text_bd <- gsub("</?b>", "", text_bd)
text_bd <- gsub("&gt;", "", text_bd)
text_bd <- gsub("&quot;", "", text_bd)

write(text_bd, file = "output/navernews.txt")
