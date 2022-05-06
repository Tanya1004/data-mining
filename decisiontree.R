library(caret)
ytrainIndex <- createDataPartition(iris$Species, p=0.80, list=FALSE)
irisTrain <- iris[ytrainIndex,]
irisTest<- iris[-ytrainIndex,]
dtFit <- train(Species~., method="ctree", data=irisTrain, trControl = trainControl(method="cv"))
dtFit
dtFit$finalModel
predictions <- predict(dtFit, irisTest)
confusionMatrix(predictions, irisTest$Species)

