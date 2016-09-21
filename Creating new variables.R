getwd()
setwd("C:/Users/Narendran/Desktop/Data science")
if(!file.exists("./data")){dir.create("./data")}
fileURL<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = "./data/restaurants.csv")
restData<-read.csv("./data/restaurants.csv",header=TRUE)

#sequencing
s1<-seq(1,10,by=2)
s1
s2<-seq(1,10,length=3)
s2
x<-c(1,3,8,25,100)
seq(along=x)
restData$nearMe<-restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)
restData$zipWrong<-ifelse(restData$zipCode<0,TRUE,FALSE)
table(restData$zipWrong,restData$zipCode<0)

#Creating categorical variables
#cut breaks the value according to quantiles of zipcode
restData$zipGroups<-cut(restData$zipCode,breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

#Another type
library(Hmisc)
restData$zipGroups<-cut2(restData$zipCode,g=4)
table(restData$zipGroups)

restData$zcf<-factor(restData$zipCode)
restData$zcf[1:10]

class(restData$zcf)
View(restData)

yesno<-sample(c("yes","no"),size = 10,replace = TRUE)
yesnofac<-factor(yesno,levels = c("yes","no"))
relevel(yesnofac,ref = "yes")
yesno
yesnofac
as.numeric(yesnofac)

library(plyr)
restData2<-mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)
View(restData2)
