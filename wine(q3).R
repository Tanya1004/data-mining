library(gclus)
data(wine)
View(wine)
library(dplyr)
wd<-select(wine, seq(2,14))
means<-lapply(wd, mean)
print(means)
sdev<-lapply(wd, sd)
print(sdev)
for(i in 1:13)
{
  if(means[[i]]!=0 || sdev[[i]]!=1)
  {  #stdize(i)
    for(a in 1:length(wd[,i]))
    {
      y=((wd[a,i]-mean(wd[,i]))/(sd(wd[,i])))
      wd[a,i]<-y
    }
    cat("Mean ", i, "th col : ", mean(wd[,i]), "\n")
    cat("Std dev", i, "th col : ", sd(wd[,i]), "\n")
  }
}
library(caret)
wd2<-preProcess(wd, method = c("center", "scale"))
w3<-predict(wd2, wd)
W_mean<- lapply(w3, mean)
print(W_mean)
