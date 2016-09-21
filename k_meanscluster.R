View(iris)
irisCuster<-iris
irisCuster$Species<-NULL
View(irisCuster)
results<-kmeans(irisCuster,3)
results


results$totss
table(iris$Species,results$cluster)
plot(iris$Sepal.Length~iris$Sepal.Width,col=results$cluster)
plot(iris$Petal.Length~iris$Petal.Width,col=results$cluster)
plot(iris$Petal.Length~iris$Petal.Width,col=iris$Species)
