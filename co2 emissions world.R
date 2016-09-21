x<-read.csv("C:/Users/Narendran/Desktop/co2 emission.csv",header = TRUE)
View(x)
co2DataFrame<-data.frame(x)
co2DataFrame<-subset(co2DataFrame,select = -c(57,58,59))
View(co2DataFrame)
co2DataFrame<-subset(co2DataFrame,select = -c(57))
co2DataFrame<-subset(co2DataFrame,select = -c(2,3,4))

summary(co2DataFrame)
co2DataFrame<- na.omit(co2DataFrame)
View(co2DataFrame)
View(head(co2DataFrame))
head(co2DataFrame$X2011)
sort(co2DataFrame$X2011,decreasing = TRUE)
View(sortdata)
plot(co2DataFrame$Country.Name,co2DataFrame$X2011)

world<-subset(co2DataFrame,Country.Name=='World')
world<-subset(world,select = -c(1))
plot(world)
View(world)
t(world)
world<-t(world)

View(world)



library(forecast)


fit<-auto.arima(world)
plot(fit)
forecast(fit,15)
plot(forecast(fit,15))
