getwd()
setwd("C:/Users/Narendran/Desktop/Data science")
if(!file.exists("./data")){dir.create("./data")}
fileURL<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = "./data/restaurants.csv")
readData<-read.csv("./data/restaurants.csv",header=TRUE)

head(readData,n=3)
tail(readData,n=3)
summary(readData)
#information about data frame
str(readData)

quantile(readData$councilDistrict,na.rm = TRUE)
quantile(readData$councilDistrict,probs = c(.5,.7,.9))

table(readData$zipCode,useNA = "ifany")
table(readData$councilDistrict,readData$zipCode)
#check for missig values
sum(is.na(readData$councilDistrict))
any(is.na(readData$councilDistrict))
#one zipcode not >0
all(readData$zipCode>0)

colSums(is.na(readData))
all(colSums(is.na(readData))==0)

table(readData$zipCode %in% c("21212"))
table(readData$zipCode %in% c("21212","21213"))

readData[readData$zipCode %in% c("21212","21213"),]

#CROSS Tabs
data("UCBAdmissions")
DF=as.data.frame(UCBAdmissions)
summary(DF)

#Tells the frequency
xt<-xtabs(Freq~Gender+Admit,data = DF)
xt
ftable(xt)
object.size(DF)

print(object.size(DF),units = "Mb")
