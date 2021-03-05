library(RSelenium)

remDr_ho <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr_ho$open()
url_hotel <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr_ho$navigate(url_hotel)

finalpg <- NULL
hotel_reviews <- NULL

repeat {
  nextpg <- remDr_ho$findElement(using = 'css selector', "div.review_ta.ng-scope > div.paginate > a.direction.next")
  finalpg <- remDr_ho$findElements(using = "css selector", "div.review_ta.ng-scope > div.paginate > a.direction.next.disabled")
  nextpg$clickElement()
  Sys.sleep(1)
  for (i in 1:4) {
    # 더보기
    nextCss <- paste0('div.review_ta.ng-scope > ul > li:nth-child(', i, ') > div.review_desc > p > span')
    hotel_more <- remDr_ho$findElement(using='css selector', nextCss)  
    hotel_more$clickElement()
    Sys.sleep(1)
    # 리뷰 불러오기
    textCss <- paste0('div.review_ta.ng-scope > ul > li:nth-child(', i,') > div.review_desc > p')
    hotel_review <- remDr_ho$findElement(using='css selector', textCss)
    hotel_reviews <- c(hotel_reviews, unlist(hotel_review$getElementText()))
  }
  if(length(finalpg) == 1)  break;
}

hotel_reviews
write(hotel_reviews, file = "output/naverhotel.txt")
