library(reshape2)
head(mtcars)

mtcars$carname<-rownames(mtcars)
carMelt<-melt(mtcars,id=c("carname","gear","cyl"),measure.vars = c("mpg","hp"))
head(carMelt,n=3)

tail(carMelt,n=3)

View(carMelt)

cylData<-dcast(carMelt,cyl~variable)
cylData

cylData<-dcast(carMelt,cyl~variable,mean)
cylData

#Averaging Values
head(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, sum)

#AnotherSplit
spIns<-split(InsectSprays$count,InsectSprays$spray)
spIns
sprCount<-lapply(spIns, sum)
sprCount

unlist(sprCount)
sapply(spIns, sum)

ddply(InsectSprays,.(spray),summarize,sum=sum(count))

spraySums<-ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN = sum))
dim(spraySums)
spraySums
