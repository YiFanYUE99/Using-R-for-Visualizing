library(mlr)
jiechangai<-read.csv("D:/结肠样品/中山大学-结肠样品/chuli/positive表.csv",header=TRUE,stringsAsFactors = FALSE)
#将数据按Class分类
jiechangai$Class[jiechangai$Class=="V"]<-1
jiechangai$Class[jiechangai$Class=="C"]<-0
jiechangai$Class<-factor(jiechangai$Class,
                         levels=c(0,1),
                         labels = c("yes","no"))
jiechangai$Class
#变成tibble格式
library(dplyr)
jiechangaiTib<-as_tibble(jiechangai)
jiechangaiTib
library(tidyverse)
jiechangaiUntidy<-gather(jiechangaiTib,"Variable","Value",-Class)
#训练模型
jiechangaiTask<-makeClassifTask(data = jiechangaiTib,target = "Class")#安全忽略警告
plsda<-makeLearner("classif.plsdaCaret")
plsdaModel<-train(plsda,jiechangaiTask)
#提取信息
plsdaModelData<-getLearnerModel(plsdaModel)
kFold<-makeResampleDesc(method = "RepCV",folds=10,reps=50,stratify = TRUE)
plsdaCV<-resample(learner = plsda,task = jiechangaiTask,resampling = kFold,
                  measures = list(mmce,acc))
plsdaCV$aggr#正确率97.01%


