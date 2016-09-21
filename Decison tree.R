library(ISLR)
library(tree)
data(Carseats) #datasets to use
head(Carseats)
range(Sales)
High<-ifelse(Sales>=8,"Yes","No")

length(High)
dim(Carseats)
Carseats=data.frame(Carseats,High) #append the column High to Carseats
names(Carseats) #12 observations

Carseats<-Carseats[,-1] #Deletes the column sales
names(Carseats) #11 observations

#Split data into testing and training..half of the data is split between them
set.seed(2)
train=sample(1:nrow(Carseats),nrow(Carseats)/2)
test=-train
training_data=Carseats[train,]
testing_data=Carseats[test,]
training_data
testing_data
testing_High  =High[test]
testing_High

#fit the tree model using training data
tree_model=tree(High~.,training_data) #predicting traing model from all the data
plot(tree_model) #no text
text(tree_model , pretty = 0) #text is there ..pretty for categorical variable, otherwise character is shown

#check hoe th model is doing using test data
tree_pred= predict(tree_model,testing_data,type = "class")
mean(tree_pred!=testing_High) #gives misclassification error gives difference i.28.5

###We have to do pruning next i.e how many levels we are going up

###cross validation to check where to stp pruning
set.seed(3)
#cross-validation tree
cv_tree=cv.tree(tree_model, FUN = prune.misclass)
names(cv_tree)
plot(cv_tree$size,cv_tree$dev,type = "b")
#since from the plot the minimum is 9, we have to prune the tree to size 9
pruned_model=prune.misclass(tree_model,best = 9)
plot(pruned_model)
text(pruned_model,pretty = 0)

#check how it is doing
tree_pred=predict(pruned_model,testing_data,type = "class")
mean(tree_pred!=testing_High) #23%  
#so the pruned one is better than the normal one
