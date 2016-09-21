bank<-read.csv("C:/Users/Narendran/Desktop/CTS/bank-additional-full.csv", header = TRUE)
bankFrame<-data.frame(bank)

#Creating traing data and test dataset
indexes<-sample(1:nrow(bankFrame),size = 0.25*nrow(bankFrame))

#Split data
test<-bankFrame[indexes,]
View(test)
train<-bankFrame[-indexes,]
View(train)



library(ISLR)
library(tree)
tree_model1=tree(y~.,test)
plot(tree_model)
text(tree_model,pretty = 0)

tree_model2=tree(y~.,train)
plot(tree_model2)
text(tree_model2,pretty = 0)


library(caret)

x<-summary(train)
write.csv(x,"C:/Users/Narendran/Desktop/CTS/SUMMARY.csv")

bank_pred<-knn(train,test,k=3)
library(randomForest)

colNames<-names(train)
colNames
colNames<-colNames[!colNames %in% c("y")]
colNames
#RandomForest
model1<-randomForest(y~.,train,ntree=500,importance=T)
plot(model1)

layout(matrix(c(1,2),nrow=1),width=c(4,1))
par(mar=c(5,4,4,0))
plot(model1, log="y")
par(mar=c(5,0,4,2))
plot(c(0,1),type="n", axes=F, xlab="", ylab="")
legend("top", colnames(model1$err.rate),col=1:4,cex=0.8,fill=1:4)

varImpPlot(model1,sort=T,main="Important Variables", n.var=5)

#I might be understanding the question wrong, but the GINI index is a economics measure usually of income inequality (0 = equal, 1 = all in one node).  The mean decrease accuracy is how much the model fit decreases when you drop a variable.  The greater the drop the more significant the variable.  I'd say the mean decrease is more significant for variable selection.  You could use a GINI index to describe the overall explanatory power of the variables.  Are they all equally as important, or does one have much greater explanatory value.  So mean decrease accuracy would be more important for variable selection.  GINI would give you information at a glance about the explanatory relationship between the variables selected.

#The mean decrease in accuracy a variable causes is determined during the out of bag error calculation phase. The more the accuracy of the random forest decreases due to the exclusion (or permutation) of a single variable, the more important that variable is deemed, and therefore variables with a large mean decrease in accuracy are more important for classification of the data. The mean decrease in Gini coefficient is a measure of how each variable contributes to the homogeneity of the nodes and leaves in the resulting random forest. Each time a particular variable is used to split a node, the Gini coefficient for the child nodes are calculated and compared to that of the original node. The Gini coefficient is a measure of homogeneity from 0 (homogeneous) to 1 (heterogeneous). The changes in Gini are summed for each variable and normalized at the end of the calculation. Variables that result in nodes with higher purity have a higher decrease in Gini coefficient.

#A type 1 variable importance plot shows the mean decrease in accuracy, while a type 2 plot shows the mean decrease in Gini.

impVar<-data.frame(importance(model1),type=2)
impVar
impVar$Variables<-row.names(impVar)
impvar1<-impVar[order(impVar$MeanDecreaseAccuracy,decreasing = T),]
View(impvar1)
write.csv(impvar1,"C:/Users/Narendran/Desktop/CTS/impvar.csv")
#predicting response variable
train$predict<-predict(model1,train)
View(train$predict)


#Confusion Matrix
library(e1071)
library(caret)
confusionMatrix(data = train$predict,reference = train$y)

test$predict<-predict(model1,test)
confusionMatrix(data = test$predict,reference = test$y)
