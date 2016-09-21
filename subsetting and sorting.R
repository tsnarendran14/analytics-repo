set.seed(13435)
x<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x<-x[sample(1:5),]
x$var2[c(1,3)]=NA
x
x[,2]
x[,"var2"]
x[1:2,"var3"]
x[(x$var1<3 & x$var3>=14 ),]
x[(x$var1<3 | x$var3>=14 ),]
#which returns indices
x[which(x$var2>8),]

sort(x$var1)
sort(x$var1,decreasing = T)
x[order(x$var1),]
x[order(x$var1,x$var3),]

library(plyr)
arrange(x,var1)
arrange(x,desc(var1))

x$var4<-rnorm(5)
x
x$var5<-cbind(x,rnorm(5))
x
