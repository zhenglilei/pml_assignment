# loading data
training <- read.csv("E:/machine learning/practical_ML/pml-training.csv")
testing <- read.csv("E:/machine learning/practical_ML/pml-testing.csv")

# since there are many NA values in many variables, it's better
# to omit them. Here we count the NA ratios in each column, if
# the ratio of NA values exceeds 95%, we delete that column.
naThr <- 0.95
nrow <- 19622
valC <- c()
for (i in 1:160){
  colN <- training[,i]
  nna <- sum(is.na(colN))/nrow
  if (nna > naThr){valC <- append(valC,i)}
}

for (i in 1:160){
  colN <- testing[,i]
  nna <- sum(is.na(colN))/20
  if (nna > naThr){valC <- append(valC,i)}
}
valC <- unique(valC)

# Only valid columns are reserved
training <- training[,-valC]
testing <- testing[,-valC]

#################training###########
trainDD <- training[,c(8:60)]
testDD <- testing[,c(8:60)]
svmMod <- e1071::svm(classe~., trainDD)
pred4 <- predict(svmMod,testDD)
pred4

# output the results using the provided function
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}
pml_write_files(pred4)



################### useless codes ###########
# library(e1071)
# trainP <- na.omit(training)
# svmMod <- e1071::svm(classe~., training[,-c(4,5)])
# pred <- predict(svmMod,testing[,-c(4,5)])

# library(party);
# cfi <- cforest(classe~., data=training[,-c(4,5)])
# aa <- varimp(cfi)
# sort(aa)

# library(e1071)
# inBelt <- grep("belt",colnames(training))
# inBelt <- append(inBelt,60)
# trainBelt <- training[,inBelt]
# testBelt <- testing[,inBelt]
# svmMod <- e1071::svm(classe~., trainBelt)
# pred <- predict(svmMod,testBelt)
# 
# inArm <- grep("arm",colnames(training))
# inArm <- append(inArm,60)
# trainArm <- training[,inArm]
# testArm <- testing[,inArm]
# svmMod <- e1071::svm(classe~., trainArm)
# pred2 <- predict(svmMod,testArm)
# 
# inDumbbell <- grep("dumbbell",colnames(training))
# inDumbbell <- append(inDumbbell,60)
# trainDumbbell <- training[,inDumbbell]
# testDumbbell <- testing[,inDumbbell]
# svmMod <- e1071::svm(classe~., trainDumbbell)
# pred3 <- predict(svmMod,testDumbbell)
