data("airquality")
names(airquality)
#[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day" 
#produce plots for some explanotory variables 
#ozone is response variable i.e dependent variable
#solar.r and wind are explantor variable i.e independent variable
plot(airquality$Ozone~airquality$Solar.R)
plot(airquality$Ozone~airquality$Wind)

coplot(airquality$Ozone~airquality$Solar.R|airquality$Wind,panel = panel.smooth)
model2=lm(airquality$Ozone~airquality$Solar.R*airquality$Wind)
plot(model2)
summary(model2)
termplot(model2)
#plot is bad since it is not linear, so it has to be improved further

summary(airquality$Solar.R)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
 #   7.0   115.8   205.0   185.9   258.8   334.0       7 

summary(airquality$Wind)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1.700   7.400   9.700   9.958  11.500  20.700 

#Create 3 values of sloar radiation
Solar1<-mean(airquality$Solar.R,na.rm = TRUE)
Solar2=100
Solar3=300

#predicts all values of solar and wind speed, gives predicted ozone levels
predict(model2)
#but we want particular models, so
predict(model2,data.frame(Solar.R=100,Wind=1))
predict(model2,data.frame(Solar.R=Solar1,Wind=10))
predict(model2,data.frame(Solar.R=Solar1,Wind=1:20))
p1=predict(model2,data.frame(Solar.R=Solar1,Wind=1:20))
p2=predict(model2,data.frame(Solar.R=Solar2,Wind=1:20))
p3=predict(model2,data.frame(Solar.R=Solar3,Wind=1:20))
p3
p2
p1
plot(airquality$Ozone~airquality$Wind) 
lines(1:20,p1)
#other variable that is solar radiation is varied with repect to wind to study the effects
#Video https://www.youtube.com/watch?v=ksOErR1ldgo
#next part https://www.youtube.com/watch?v=P-WYkSZp9lY
