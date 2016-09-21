data("airquality")
names(airquality)
#[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"
plot(airquality$Ozone~airquality$Solar.R)
mean.Ozone=mean(airquality$Ozone,na.rm = TRUE)
mean.Ozone
#draw horizontal line acros mean
abline(h=mean.Ozone)
#use lm to fit regression line
model1=lm(airquality$Ozone~airquality$Solar.R)
model1
abline(model1,col="red")
plot(model1)
termplot(model1)
summary(model1)
  