library(sqldf)
library(editrules)
setwd("C:\\Users\\HP\\Documents")
people<-read.table(file = "people.txt", header = TRUE)
ruleset<-editfile(file = 'rulesq1.txt')

viol<-violatedEdits(ruleset, people)
summary(viol)

#how to reduce no. of violations
people$Age[4]<-30
print(people)

people$Age[3]<-38
print(people)
viol2<-violatedEdits(ruleset, people)
print(viol2)
summary(viol2)
