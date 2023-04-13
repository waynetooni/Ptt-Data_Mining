
setwd("D:/flie/Data Seience") 

library(bitops)
library(RCurl);   library(XML)
library(rvest)
library(httr)
library(curl)
library(plyr)
library(stringr)
library(lattice)
library(ggplot2)

URL = ('https://www.ptt.cc/bbs/joke/index.html')
X = read_html(curl(URL, handle = new_handle("useragent" = "Mozilla/5.0")))
page <- html_nodes(X,xpath = "//div[@class='btn-group btn-group-paging']/a")
page <- gsub("<a class=\"btn wide\" href=\"/bbs/joke/index", replacement = "",page[2])
page <- gsub(".html\">??? 上頁</a>", replacement = "",page)
page <- as.integer(page)
is.integer(page)
page <- page + 1

data <- data.frame()
data = read.csv("10427103_T2.csv")
total <- data.frame()

for(k in 8950:9000){
  hrefURL <- paste0('https://www.ptt.cc/', data$hrefsLink[k])
  tryCatch({
    XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
    #要執行的指令放這裡
  },warning = function(war){
      hrefURL = ( 'https://www.ptt.cc/bbs/joke/M.1457951116.A.F7F.html' )
      XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
     #如果有warning則輸出warning,"MY_WARNING:  "這一行可以自己改
  },error = function(err) {
     #如果有error則輸出error,"MY_Error:  "這一行可以自己改
  },finally = {
     #最後一定要執行的指令或輸出
  })
  
  
  text <- html_nodes(XX,xpath = "//meta[@property='og:description']")
  text <- html_attr(text, 'content')
  bool.val <- length(text) > 0
  if (!bool.val ) text <- 'NA'
  all <- html_nodes(XX,xpath = "//span[@class='article-meta-value']")
  all <- html_text(all)
  author <- all[1]
  time <- all[4]
  nameCheck <- all[3]
  all <- data.frame(text,author,time,nameCheck)
  total <- rbind(total,all)
  Sys.sleep(sample(3:5, 1))
}

write.csv(data, "10427103Final.csv", row.names = FALSE)

 tt <- 1
  tt <- as.integer(tt)
 
 Text <- c()
 
 for(i in 2:4){
   URL <- paste0('https://www.ptt.cc/bbs/joke/index',i,'.html')
   X = read_html(curl(URL, handle = new_handle("useragent" = "Mozilla/5.0")))
   link <- html_nodes(X,xpath = "//div[@class='title']")
   name <- html_text(link)
   name <- gsub("\n", replacement = "",name)
   name <- gsub("\t", replacement = "",name)
   name <- data.frame(name)
hrefsLink <- html_attr(link, 'href')
for(k in 1 : length(hrefsLink)){
 hrefURL <- paste0('https://www.ptt.cc', hrefsLink[k])
  XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
  gg <- html_nodes(XX,xpath = "//div[@class = 'bbs-screen bbs-content']/span")
  goo <- html_attr(gg, 'content')
  goo <- data.frame(goo)
  Text <- c(Text,goo)
  Sys.sleep(sample(3:5, 1))
  }
 
   author <- html_nodes(X,xpath = "//div[@class='author']")
   author <- gsub("<div class=\"author\">", replacement = "",author)
   author <- gsub("</div>", replacement = "",author)
   author <- data.frame(author)
   date <- html_nodes(X,xpath = "//div[@class='date']")
   date <- gsub("<div class=\"date\">", replacement = "",date)
   date <- gsub("</div>", replacement = "",date)
   
   date <- data.frame(date)
   
   total<-data.frame()
   data <- read.csv("data2.csv")
   for(k in 16001:26000){
     hrefURL <- paste0('https://www.ptt.cc/', data$hrefsLink[k])
     tryCatch({
       XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
       #要執行的指令放這裡
     },warning = function(war){
       hrefURL = ( 'https://www.ptt.cc/bbs/joke/M.1457951116.A.F7F.html' )
       XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
       #如果有warning則輸出warning,"MY_WARNING:  "這一行可以自己改
     },error = function(err) {
       #如果有error則輸出error,"MY_Error:  "這一行可以自己改
     },finally = {
       #最後一定要執行的指令或輸出
     })
     
     pushNum <- html_nodes(XX,xpath = "//span[@class='hl push-tag']")
     length(pushNum)
     pushNum <- data.frame(length(pushNum))
     LOLNum <- html_nodes(XX,xpath = "//span[@class='f1 hl push-tag']")
     LOLNumber <- grep('噓',LOLNum)
     length(LOLNumber)
     LOLNum <- data.frame(length(LOLNumber))
     
     all <- data.frame(pushNum,LOLNum)
     total <- rbind(total,all)
     Sys.sleep(sample(3:6, 1))
   }
   
#   push <- html_nodes(X,xpath = "//div[@class='nrec']")
#   push <- gsub("<div class=\"nrec\"><span class=\"hl f0\">", replacement = "",push)
#   push <- gsub("<div class=\"nrec\"><span class=\"hl f1\">", replacement = "",push)
#   push <- gsub("<div class=\"nrec\"><span class=\"hl f2\">", replacement = "",push)
#   push <- gsub("<div class=\"nrec\"><span class=\"hl f3\">", replacement = "",push)
#   push <- gsub("<div class=\"nrec\">", replacement = "",push)
#   push <- gsub("</span></div>", replacement = "",push)
#   push <- gsub("</div>", replacement = "",push)
#   push<- data.frame(push)
#   #hrefsLink <- data.frame(hrefsLink)
#   end <- nrow(name)+tt-1
#   CC <- tt:end
#   
#   CC <- data.frame(CC)
#   SP <- rep(i:i, each = nrow(name))
#   SP <- data.frame(SP)
#   #hrefText <- data.frame(Text)
#   
#   total <- data.frame()
#   total <- cbind(CC,SP,name,author,date,push)
#   data <- rbind(data,total)
#   tt <- nrow(name) + tt
#   Sys.sleep(sample(3:5, 1))
# }

write.csv(data, "10427103F.csv", row.names = FALSE)
csv1 = read.csv("10427103_TT.csv")
View(csv1)
csv2 = read.csv("10427103FinalGG.csv")
View(csv2)
data <- cbind(csv1,csv2)
View(data)
write.csv(data, "DamnnnGG.csv", row.names = FALSE)

csv11 = read.csv("DamnnnGG.csv")
View(csv11)
ttt <- apply(csv11,1,as.list)

temp <- data.frame()
for(g in 1:length(csv11$text)){
  contentNum <- nchar(ttt[[g]]$text)
  contentNum <- data.frame(contentNum)
  temp <- rbind(temp,contentNum)
}

data <- cbind(csv11,temp)

write.csv(data, "DamnnnGGv2.csv", row.names = FALSE)

csv12 = read.csv("DamnnGGv8.csv")

#Cv11 = ddply(csv11, c("new_author"), summarise, FF=unique(length(new_date)))

Cv = ddply(csv12, c("author"), summarise, FF=unique(length(time)), MM = sum(contentNum))  
Cv2 <- csv12[,1]
Cv2 <- gsub("Re: ", replacement ="",Cv2)
Cv3 = ddply(csv12, c("Cv2"), summarise, FF=unique(length(time)))
Cv4 <- substr(csv12$name,1,4)
Cv5 = ddply(csv12, c("Cv4"), summarise, FF=unique(length(time)))
clear(Cv5)
csv12$time 
View(csv12)


csvt <- substr(csv12$time,5,7)
index <- 1
jan <- 0
feb <- 0
mar <- 0
apr <- 0
may <- 0
jun <- 0
jul <- 0
aug <- 0
sep <- 0
oct <- 0
nov <- 0
dec <- 0
na  <- 0
csvt
for( index in (1:16000) ){
  temp <- csvt[index]
  if(is.na(temp)) 
    na = na + 1 
  else{
  if(temp == "Jan")
    jan <- jan + 1 
  if(temp == "Feb")
    feb = feb + 1 
  if(temp == "Mar")
    mar = mar + 1 
  if(temp == "Apr")
    apr = apr + 1 
  if(temp == "May")
    may = may + 1 
  if(temp == "Jun")
    jun = jun + 1 
  if(temp == "Jul")
    jul = jul + 1 
  if(temp == "Aug")
    aug = aug + 1 
  if(temp == "Sep")
    sep = sep + 1 
  if(temp == "Oct")
    oct = oct + 1 
  if(temp == "Nov")
    nov = nov + 1 
  if(temp == "Dec")
    dec = dec + 1 
  }
}

Tmonth <-c(11,12,1,2,3,4,5,6,"未分類")
Tmonthpair <- c(nov,dec,jan,feb,mar,apr,may,2124,na)
Tmo <- data.frame(Tmonth,Tmonthpair)
Tmo
histogram(x=Tmo$Tmonth, y  = Tmo$Tmonthpair ,main = "每月發文數",xlab= "月份", ylab = "文章篇數")
barplot(Tmo)
barplot(Tmo$Tmonthpair, names.arg=Tmo$Tmonth, ylim=c(0,3000), ylab="文章數", xlab="月份")
my.plot2 <- ggplot(Tmo, x = Tmo$Tmpnth, y= Tmo$Tmonthpair) + geom_histogram()
my.plot2 <- my.plot2 + layer(
  geom = "bar",
  stat = "bin",
  position = "identity",
  params = list(
    fill = "steelblue",
    binwidth = ,
    na.rm = FALSE
  )
)
my.plot2

newcsv <- read.csv("theme.csv")

reply <- csv12[grep("Re:", csv12$name), ]
nrow(reply)

guess <- newcsv[grep("[猜謎]", newcsv$main), ]
ddply()
nrow(announce)
guessname <- guess$name[1]
sum(guess$contentNum)
guesstime <- guess$time[1]

damn <- data.frame(guessname, guesstime)

xd <- newcsv[grep("[ＸＤ]", newcsv$main), ]
xdname <- xd$name[1]

xdtime <- xd$time[1]
damn <- data.frame(guessname, guesstime)

cold <- newcsv[grep("[耍冷]", newcsv$main), ]
coldname <- cold$name[1]

coldtime <- cold$time[1]
damn <- data.frame(guessname, guesstime)

joke <- newcsv[grep("[笑話]", newcsv$main), ]
jokename <- joke$name[1]

jokestime <- joke$time[1]


funny <- newcsv[grep("[趣事]", newcsv$main), ]
funnyname <- funny$name[1]

funnytime <- funny$time[1]

trans <- newcsv[grep("[翻譯]", newcsv$main), ]
transname <- trans$name[1]

transtime <- trans$time[1]

kuso <- newcsv[grep("[kuso]",ignore.case = TRUE, newcsv$main), ]
kusoname <- kuso$name[1]

kusotime <- kuso$time[1]

bullshit <- newcsv[grep("[豪洨]", newcsv$main), ]
bullshitname <- bullshit$name[1]

bullshittime <- bullshit$time[1]

viedo <- newcsv[grep("[影片]", newcsv$main), ]
viedoname <- viedo$name[1]

viedotime <- viedo$time[1]

announce <- newcsv[grep("[公告]", newcsv$main), ]
announcename <- announce$name[1]

announcetime <- announce$time[1]

firsttime <- c(guesstime,xdtime,coldtime,joketime,funnytime,transtime,kusotime,bullshittime,viedotime,announcetime)

Cv = ddply(announce, c("main"), summarise, MM = unique(author))

Cv = ddply(xd, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(cold, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(joke, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(funny, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(trans, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(kuso, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(bullshit, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(viedo, c("main"), summarise, MM = sum(contentNum))
Cv = ddply(announce, c("main"), summarise, MM = sum(contentNum))

pv <- c("[猜謎]","[ＸＤ]","[耍冷]","[笑話]","[趣事]","[翻譯]","[kuso]","[豪洨]","[影片]")
cv <- c(1854,1339,1450,1099,767,56,318,50,43)
cvpv <- data.frame(pv,cv)
cvpv

data <- data.frame()
guess1 <- data.frame(nrow(guess))
xd1 <- data.frame(nrow(xd))
cold1 <- data.frame(nrow(cold))
joke1 <- data.frame(nrow(joke))
funny1 <- data.frame(nrow(funny))
trans1 <- data.frame(nrow(trans))
kuso1 <- data.frame(nrow(kuso))
bullshit1 <- data.frame(nrow(bullshit))
viedo1 <- data.frame(nrow(viedo))
announce1 <- data.frame(nrow(announce))
未分類 <- data.frame(1091)
theme <- data.frame()

theme <- data.frame(guess1,xd1,cold1,joke1,funny1,trans1,kuso1,bullshit1,viedo1,announce1,未分類)

names(theme)[1] = "[猜謎]"
names(theme)[2] = "[ＸＤ]"
names(theme)[3] = "[耍冷]"
names(theme)[4] = "[笑話]"
names(theme)[5] = "[趣事]"
names(theme)[6] = "[翻譯]"
names(theme)[7] = "[kuso]"
names(theme)[8] = "[豪洨]"
names(theme)[9] = "[影片]"
names(theme)[10] = "[公告]"
names(theme)[11] = "未分類"

grep("Re:", csv12$name[23])

names(theme)[1] = "guess"
data <- data.frame()

for(k in 1 : 16000){
  if(grepl("Re:",csv12$name[k]))
    next ;
  temp <- data.frame(csv12[k,])
  data <-rbind(data,temp)
  
  
}

index <- 1 
guesss <- 0
xds <- 0
colds <- 0
jokes <- 0
funnys <- 0
trans <- 0
kusos <- 0
bullshits <- 0
temp <- data.frame()
for( index in (1:1979) ){
  temp <- reply$name[index]
    if(grepl("[猜謎]",temp))
      guesss = guesss + 1
    if(grepl("[ＸＤ]",temp))
      xds = xds + 1 
    if(grepl("[耍冷]",temp))
     colds = colds + 1 
    if(grepl("[笑話]",temp))
      jokes = jokes + 1 
    if(grepl("[趣事]",temp))
      funnys =  funnys + 1 
    if(grepl("[翻譯]",temp))
      trans = trans + 1 
    if(grepl("[kuso]",temp))
      kusos = kusos + 1 
    if(grepl("[豪洨]",temp))
      bullshits = bullshits + 1 
   
  }
}


Tname <-c("[猜謎]","[ＸＤ]","[耍冷]","[笑話]","Re:","[趣事]","[翻譯]","Fw:","[kuso]","[豪洨]","[影片]","[公告]","未分類")
Tnumber <- c(table(grepl('[猜謎]',csv12$name))[2],table(grepl('[ＸＤ]',csv12$name))[2],table(grepl('[耍冷]',csv12$name))[2],table(grepl('[笑話]',csv12$name))[2],table(grepl('Re:',csv12$name))[2],table(grepl('[趣事]',csv12$name))[2],table(grepl('[翻譯]',csv12$name))[2],table(grepl('Fw:',csv12$name))[2],table(grepl('[kuso]',csv12$name))[2],table(grepl('[豪洨]',csv12$name))[2],table(grepl('[影片]',csv12$name))[2],
table(grepl('[公告]',csv12$name))[2],771)
Tnumber
Title <- data.frame(Tname,Tnumber)
Title


table(grepl('[猜謎]',csv12$name))[2]
Cv5$FF[88] <- m[2]
Tdata <-csv12$name
tadaa[1]<-Tdata[1]
temp <- substr(csv12$name[1] , 1,4)
temp
index <- 1
csv12$author
for(index in (1:4)){
  temp <- substr(Tdata[index] ,start=0,stop=1)  
  temp
  if( temp == "[" ){
    temp2 <- substr(Tdata[index],start=2,stop=2)
    temp2
    Tdata[index] <- substr(Tdata[index],start=1,stop=4)
    if(temp2 == "k")
        Tdata[index] <- substr(Tdata[index],start=1,stop=6)
        
  }
  if( temp == "R")
    Tdata[index] <- substr(csv12$name[index],start=1,stop=3)
}

Tdata


title = ddply( csv12, c("title"), summarise, FF=unique(length(time))) 
View(title)


library(plyr);   Cv = ddply(csv12, c("author"), summarise, FF=unique(length(time)), MM=sum(contentNum))  #-- Frequency & Monetary
Cv$UU = Cv$MM/Cv$FF    #-- 計算客單價 (平均每次購買金額) (UU)
Fbreaks = c(0,1,4,25,100,700,1810);                  Cv$FF0 <- cut(Cv$FF,breaks=Fbreaks);      
Mbreaks = c(0,1000,3000,10000,30000,150000);   Cv$MM0 <- cut(Cv$MM,breaks=Mbreaks);  
Ubreaks = c(-1,500,1000,4000,15000,100000);    Cv$UU0 <- cut(Cv$UU,breaks=Ubreaks);    
dim(Cv);   head(Cv)

# 4.數據模型 -- 客層分析，是 SPC 大數據模型的第一步，也是數據挖掘的第一顆鑽石

## 4.1.RFM模型中的客戶價值 (常貴客)
table(Cv$FF0,Cv$MM0)

##

name <- data.frame()
hrefsLink <- data.frame()
text <- data.frame()
author <- data.frame()
time <- data.frame()
nameCheck <- data.frame()
contentNum <- data.frame()
gg <- data.frame()

DataN <- data.frame(name,hrefsLink,text,author,time,nameCheck, contentNum,gg)

DataN <- csv12[1:7000,]




##
## 3.4.[教學內容] 探討造訪頻次(FF)之分布
range(Cv$FF)                       #-- (1) 先看 FF的分布範圍               
hist(Cv$FF,5);   table(Cv$FF)    #-- (2) 以直方圖(histogram)與table觀察 FF的分布樣態
table(cut(Cv$FF,breaks=c(0,1,16,32,65,197,1810)))                                    #-- (3) 實驗切分的可能
Cv$FF0 <- cut(Cv$FF,breaks=c(0,1,16,32,65,197,1810));    Fbreaks=c(0,1,16,32,65,197,1810)  #-- (4) 滿意的切分設定
Cv$MM0 <- cut(Cv$MM,breaks=c(0,50,75,100,250,500,9650));    Fbreaks=c(0,50,75,100,250,500,9650)  #-- (4) 滿意的切分設定
Cv$UU = Cv$MM/Cv$FF
table (Cv$FFO,Cv$MM0)
ddply()

table(Cv$FF0)
table(Cv$author,Cv$FF0)


## push

csvN = read.csv("data3.csv")
csvN
CvN = ddply(csvN, c("contentNum"), summarise, FF=unique(length(push)))
pushtable <- cut(csvN$push,breaks=c(-391,-100,-50,-10,0,10,50,100,944))
contenttable <- cut(csvN$content,breaks=c(10,50,100,200,500,1000,1565))
contenttable
table(contenttable,pushtable)

CvN = ddply(csvN, c("author"), summarise , count = unique(length(time)) ,push = sum(push))  
CvN$avg = CvN$push/CvN$count
