
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
page <- gsub(".html\">??? �W��</a>", replacement = "",page)
page <- as.integer(page)
is.integer(page)
page <- page + 1


for(k in 8950:9000){
  hrefURL <- paste0('https://www.ptt.cc/', data$hrefsLink[k])
  tryCatch({
    XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
    #�n���檺���O��o��
  },warning = function(war){
      hrefURL = ( 'https://www.ptt.cc/bbs/joke/M.1457951116.A.F7F.html' )
      XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
     #�p�G��warning�h��Xwarning,"MY_WARNING:  "�o�@��i�H�ۤv��
  },error = function(err) {
     #�p�G��error�h��Xerror,"MY_Error:  "�o�@��i�H�ۤv��
  },finally = {
     #�̫�@�w�n���檺���O�ο�X
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

write.csv(data, "Final.csv", row.names = FALSE)

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
       #�n���檺���O��o��
     },warning = function(war){
       hrefURL = ( 'https://www.ptt.cc/bbs/joke/M.1457951116.A.F7F.html' )
       XX = read_html(curl(hrefURL, handle = new_handle("useragent" = "Mozilla/5.0")))
       #�p�G��warning�h��Xwarning,"MY_WARNING:  "�o�@��i�H�ۤv��
     },error = function(err) {
       #�p�G��error�h��Xerror,"MY_Error:  "�o�@��i�H�ۤv��
     },finally = {
       #�̫�@�w�n���檺���O�ο�X
     })
     
     pushNum <- html_nodes(XX,xpath = "//span[@class='hl push-tag']")
     length(pushNum)
     pushNum <- data.frame(length(pushNum))
     LOLNum <- html_nodes(XX,xpath = "//span[@class='f1 hl push-tag']")
     LOLNumber <- grep('�N',LOLNum)
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

Tmonth <-c(11,12,1,2,3,4,5,6,"������")
Tmonthpair <- c(nov,dec,jan,feb,mar,apr,may,2124,na)
Tmo <- data.frame(Tmonth,Tmonthpair)
Tmo
histogram(x=Tmo$Tmonth, y  = Tmo$Tmonthpair ,main = "�C��o���",xlab= "���", ylab = "�峹�g��")
barplot(Tmo)
barplot(Tmo$Tmonthpair, names.arg=Tmo$Tmonth, ylim=c(0,3000), ylab="�峹��", xlab="���")
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

guess <- newcsv[grep("[�q��]", newcsv$main), ]
ddply()
nrow(announce)
guessname <- guess$name[1]
sum(guess$contentNum)
guesstime <- guess$time[1]

damn <- data.frame(guessname, guesstime)

xd <- newcsv[grep("[���]", newcsv$main), ]
xdname <- xd$name[1]

xdtime <- xd$time[1]
damn <- data.frame(guessname, guesstime)

cold <- newcsv[grep("[�A�N]", newcsv$main), ]
coldname <- cold$name[1]

coldtime <- cold$time[1]
damn <- data.frame(guessname, guesstime)

joke <- newcsv[grep("[����]", newcsv$main), ]
jokename <- joke$name[1]

jokestime <- joke$time[1]


funny <- newcsv[grep("[���]", newcsv$main), ]
funnyname <- funny$name[1]

funnytime <- funny$time[1]

trans <- newcsv[grep("[½Ķ]", newcsv$main), ]
transname <- trans$name[1]

transtime <- trans$time[1]

kuso <- newcsv[grep("[kuso]",ignore.case = TRUE, newcsv$main), ]
kusoname <- kuso$name[1]

kusotime <- kuso$time[1]

bullshit <- newcsv[grep("[���m]", newcsv$main), ]
bullshitname <- bullshit$name[1]

bullshittime <- bullshit$time[1]

viedo <- newcsv[grep("[�v��]", newcsv$main), ]
viedoname <- viedo$name[1]

viedotime <- viedo$time[1]

announce <- newcsv[grep("[���i]", newcsv$main), ]
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

pv <- c("[�q��]","[���]","[�A�N]","[����]","[���]","[½Ķ]","[kuso]","[���m]","[�v��]")
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
������ <- data.frame(1091)
theme <- data.frame()

theme <- data.frame(guess1,xd1,cold1,joke1,funny1,trans1,kuso1,bullshit1,viedo1,announce1,������)

names(theme)[1] = "[�q��]"
names(theme)[2] = "[���]"
names(theme)[3] = "[�A�N]"
names(theme)[4] = "[����]"
names(theme)[5] = "[���]"
names(theme)[6] = "[½Ķ]"
names(theme)[7] = "[kuso]"
names(theme)[8] = "[���m]"
names(theme)[9] = "[�v��]"
names(theme)[10] = "[���i]"
names(theme)[11] = "������"

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
    if(grepl("[�q��]",temp))
      guesss = guesss + 1
    if(grepl("[���]",temp))
      xds = xds + 1 
    if(grepl("[�A�N]",temp))
     colds = colds + 1 
    if(grepl("[����]",temp))
      jokes = jokes + 1 
    if(grepl("[���]",temp))
      funnys =  funnys + 1 
    if(grepl("[½Ķ]",temp))
      trans = trans + 1 
    if(grepl("[kuso]",temp))
      kusos = kusos + 1 
    if(grepl("[���m]",temp))
      bullshits = bullshits + 1 
   
  }
}


Tname <-c("[�q��]","[���]","[�A�N]","[����]","Re:","[���]","[½Ķ]","Fw:","[kuso]","[���m]","[�v��]","[���i]","������")
Tnumber <- c(table(grepl('[�q��]',csv12$name))[2],table(grepl('[���]',csv12$name))[2],table(grepl('[�A�N]',csv12$name))[2],table(grepl('[����]',csv12$name))[2],table(grepl('Re:',csv12$name))[2],table(grepl('[���]',csv12$name))[2],table(grepl('[½Ķ]',csv12$name))[2],table(grepl('Fw:',csv12$name))[2],table(grepl('[kuso]',csv12$name))[2],table(grepl('[���m]',csv12$name))[2],table(grepl('[�v��]',csv12$name))[2],
table(grepl('[���i]',csv12$name))[2],771)
Tnumber
Title <- data.frame(Tname,Tnumber)
Title


table(grepl('[�q��]',csv12$name))[2]
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
Cv$UU = Cv$MM/Cv$FF    #-- �p��ȳ�� (�����C���ʶR���B) (UU)
Fbreaks = c(0,1,4,25,100,700,1810);                  Cv$FF0 <- cut(Cv$FF,breaks=Fbreaks);      
Mbreaks = c(0,1000,3000,10000,30000,150000);   Cv$MM0 <- cut(Cv$MM,breaks=Mbreaks);  
Ubreaks = c(-1,500,1000,4000,15000,100000);    Cv$UU0 <- cut(Cv$UU,breaks=Ubreaks);    
dim(Cv);   head(Cv)

# 4.�ƾڼҫ� -- �ȼh���R�A�O SPC �j�ƾڼҫ����Ĥ@�B�A�]�O�ƾګ������Ĥ@���p��

## 4.1.RFM�ҫ������Ȥ���� (�`�Q��)
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
## 3.4.[�оǤ��e] ���Q�y�X�W��(FF)������
range(Cv$FF)                       #-- (1) ���� FF�������d��               
hist(Cv$FF,5);   table(Cv$FF)    #-- (2) �H�����(histogram)�Ptable�[�� FF�������˺A
table(cut(Cv$FF,breaks=c(0,1,16,32,65,197,1810)))                                    #-- (3) ����������i��
Cv$FF0 <- cut(Cv$FF,breaks=c(0,1,16,32,65,197,1810));    Fbreaks=c(0,1,16,32,65,197,1810)  #-- (4) ���N�������]�w
Cv$MM0 <- cut(Cv$MM,breaks=c(0,50,75,100,250,500,9650));    Fbreaks=c(0,50,75,100,250,500,9650)  #-- (4) ���N�������]�w
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
