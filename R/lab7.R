library(rvest)

lab_url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
txt <- read_html(lab_url)

# <h1> 태그의 컨텐츠
html_text(html_nodes(txt, "h1"))


# <a> 태그의 컨텐츠
node_a <- html_nodes(txt, "a")
html_attr(node_a, "href")


# <img> 태그의 src 속성값
node_img <- html_nodes(txt, "img")
html_attr(node_img, "src")


# 첫 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(txt, "h2:nth-of-type(1)"))


# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(txt, "ul *")[grep("(green)",html_attr(html_nodes(txt, "ul *"), "style"))])


# 두 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(txt, "h2:nth-of-type(2)"))


# <ol> 태그의 모든 자식 태그들의 컨텐츠
html_text(html_nodes(txt, "ol *"))


# <table> 태그의 모든 자손 태그들의 컨텐츠
html_text(html_nodes(txt, "table *"))


# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(txt, "tr.name"))


# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(txt, "td#target"))

