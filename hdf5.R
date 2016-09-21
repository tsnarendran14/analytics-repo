source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
created=h5createFile("example.h5")
created

#Creating groups
created=h5createGroup("example.h5","foo")
created=h5createGroup("example.h5","baa")
created=h5createGroup("example.h5","foo/foobaa")
#ls command listing
h5ls("example.h5")
#writing to groups
A=matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")
b=array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale")<-"litre"
h5write(b,"example.h5","foo/fobaa/B")
h5ls("example.h5")

#write a dataset
df=data.frame(1L:5L,seq(0,1,length.out = 5),
              c("ab","cde","fghi","a","s"),stringAsFactors=FALSE)
h5write(df,"example.h5","df")
h5ls("example.h5")

#Reading data
readA=h5read("example.h5","foo/A")
readB=h5read("example.h5","foo/foobaa/A")
readdf=h5read("example.h5","df")
readA

h5write(C(12,13,14),"example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A")
