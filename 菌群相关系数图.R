test<-read.csv("D:/R语言应用/作图/热图/孙伟菌群数据.csv",header = T,row.names = 1)
#相关性图
library(corrgram)
corrgram(test,
         order=TRUE,
         lower.panel=panel.shade,
         upper.panel=panel.pie,
         text.panel=panel.txt,
         main="Corrgram of Intestinal flora")

library("corrplot")
corr<-cor(test)
corrplot(corr,
         type="full",#保留全部，可选upper、lower
         order = "hclust",#聚类
         addrect=2,#分成两类
         method="color",#去掉这行就是圆的
         addCoef.col="black",#添加相关系数，颜色为黑色,内容太多别添加
         tl.col = "black",tl.cex = 0.6,#修改内容字体
         is.corr = TRUE,#可以不为方阵
         diag = FALSE)#去除自身相关
