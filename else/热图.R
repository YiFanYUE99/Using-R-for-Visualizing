library(pheatmap)
library(RColorBrewer)
col=brewer.pal(11,"Spectral")
##查看颜色种类
#
#display.brewer.all(type="seq")#可选type:div,qual,seq
#display.brewer.all()
#
test<-read.csv("D:/R语言应用/作图/热图/孙伟菌群数据.csv",header = T,row.names = 1)
test<-as.matrix(test)
test<-t(test)
pheatmap(test,
         scale="row",
         cluster_rows = F,
         cluster_cols = F,#行列顺序都不变
         gaps_col = c(6,12,18), 
         border=FALSE,
         display_numbers=TRUE,
         color = colorRampPalette(c("blue", "white", "red"))(30))#数字是梯度，有30个梯度
