library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost", port=4445, browserName="chrome")
remDr$open()
gs25 <- paste("http://gs25.gsretail.com/gscvs/ko/products/event-goods")
remDr$navigate(gs25)
Sys.sleep(2)

# 2+1 행사
two_one <- remDr$findElement(using = 'css selector', "#TWO_TO_ONE")
two_one$clickElement()
Sys.sleep(2)

goodsname <- NULL
goodsprice <- NULL
repeat {
  for (i in 1:8) {
    g_name <- remDr$findElement(using='css selector',
                                 paste0('div:nth-child(5) > ul > li:nth-child(', i, ') > div > p.tit')) 
    g_price <- remDr$findElement(using='css selector',
                                 paste0('div:nth-child(5) > ul > li:nth-child(', i, ') > div > p.price > span'))
    goodsname <- c(goodsname, unlist(g_name$getElementText()))
    goodsprice <- c(goodsprice, unlist(g_price$getElementText()))
  }
  Npg <- remDr$findElement(using = 'css selector', "div:nth-child(5) > div > a.next")
  if (length(Npg$getElementAttribute("onclick")) == 0) {
    break
  }
  Npg$clickElement()
  Sys.sleep(2)
}

goodsprice <- gsub("원|,", "", goodsprice)
goodsprice <- as.numeric(goodsprice)
gs25_twotoone <- data.frame(goodsname, goodsprice)
View(gs25_twotoone)
write.csv(gs25_twotoone, file = "output/gs25_twotoone.csv")