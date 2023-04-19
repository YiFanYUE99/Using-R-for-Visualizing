library(ggplot2)
library(ggpubr)
getwd()
setwd("D:/R_work/Using-R-for-Visualizing/met_pic")
metabolites<-read.csv("D:/作业/pathway处理/All of the samples.csv",row.names=1,header=1, check.names = F)#check.names = F 防止数字开头的文件名乱码
dim(metabolites)[2]

metabolites<-t(metabolites)
metabolites<-na.omit(metabolites)#na.omit只能删除有缺失值的整行
metabolites<-as.data.frame(t(metabolites))
metabolite<-metabolites
colnames(metabolite)<-metabolites[1,]#新建只含keggid的表
metabolite<-metabolite[-1,]

#将chr转化为num
for(i in 2:dim(metabolite)[2])
{
  metabolite[,i]<-as.numeric(metabolite[,i])
}

#将class由num转化为factor
metabolite$Class<-factor(metabolite$Class,
                         levels = c(0.00,10.00,1020.00,1.00,120.00,2.50,2.52,25.00),
                         labels=c("0mM LG","10mM LG","10mM LG + 20uM A9","1mM LG","1mM LG + 20uM A9","2.5mM LG","2.5mM LG + 20uM A9","25mM LG"))
#蛋白质矫正
for(i in 3:dim(metabolite)[2])
{
  metabolite[,i]<-metabolite[,i]/metabolite$Protein
}

#要做显著性检验的组
my_comparisons <- list( c("0mM LG","2.5mM LG"), c("10mM LG","10mM LG + 20uM A9"),c("1mM LG","1mM LG + 20uM A9"),
                        c("10mM LG","2.5mM LG"),c("2.5mM LG","2.5mM LG + 20uM A9"),c("10mM LG","25mM LG"),c("0mM LG","25mM LG"))

for(i in 3:dim(metabolite)[2])
{
  title_name = colnames(metabolites[i])
  png(filename=paste0(colnames(metabolite[i]),".png"),#好的批量命名方式paste0
      width=1200,height=600,units="px",
      pointsize = 12)#标签大小
  plot<-ggplot(metabolite,aes(x=Class,y=metabolite[,i],fill=Class))+#以class为标准填充boxplot
    geom_boxplot()+
    stat_compare_means(comparisons = my_comparisons,method = "t.test", 
                       hide.ns = F,
                       paired = T,
                       aes(label = paste0("p = ", after_stat(p.signif))))+
    stat_compare_means(label.y = 45)+#加全局anova p值  
    theme(legend.title=element_blank(),
          plot.title = element_text(hjust = 0.5,size = 20, face = "bold"),#标题居中，字体大小为20
          axis.text=element_text(size=12,face = "bold"),#刻度
          axis.title.x=element_text(size=14),axis.title.y=element_text(size=14))+#横纵坐标
    labs(title=title_name,x='Class',y='Abundance')
  print(plot)
  dev.off()
}



title_name=colnames(metabolites[6])

ggplot(metabolite,aes(x=Class,y=metabolite[,6],fill=Class))+#以class为标准填充boxplot
  geom_boxplot()+
  stat_compare_means(comparisons = my_comparisons,method = "t.test", 
                     hide.ns = F,
                     paired = T,
                     aes(label = paste0("p = ", after_stat(p.signif))))+
  stat_compare_means(label.y = 45)+#加全局anova p值  
  theme(legend.title=element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20, face = "bold"),#标题居中，字体大小为20
        axis.text=element_text(size=12,face = "bold"),#刻度
        axis.title.x=element_text(size=14),axis.title.y=element_text(size=14))+#横纵坐标
  labs(title=title_name,x='Class',y='Abundance')
  dev.off()


