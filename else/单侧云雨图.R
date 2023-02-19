library(gghalves)
library(ggpubr)
##云雨图，上面不要动
library(ggplot2)
library(RColorBrewer)
df<-read.csv("D:/R语言应用/作图/云雨图 小提琴图 箱线图/tidyweight.csv",header = TRUE,row.names = 1)
##查看颜色种类
#
#display.brewer.all(type="seq")#可选type:div,qual,seq
#display.brewer.all()
#
compaired<-list(c("CK","L-MET"),c("CK","H-MET"),c("L-MET","H-MET"))
#云雨图position_nudge调整box位置
ggplot(df,aes(x=factor(Class),y=weight12))+
  ylim(27, 42)+  
  xlim(c("CK","L-MET","H-MET"))+#更改横坐标后t检验数值无法显示
  geom_half_violin(aes(fill=Class),position=position_nudge(x=0),color="grey",trim = FALSE,side = "r",size=0.5)+
  scale_color_brewer(type="seq",palette="Set3")+#散点图颜色
  geom_jitter(aes(color=Class),position = position_nudge(x = -.1,y = 0))+
  scale_fill_brewer(type="seq",palette="Set3")+#小提琴图颜色
  geom_boxplot(width=0.2,position =position_nudge(x=0.1),fill="white",colour="grey",size=.003)+
  coord_flip()+
  stat_compare_means(comparisons = compaired,method = "wilcox.test",label.y = c(39,40,41))+
  stat_compare_means(label = "p.signif",method = "t.test",label.y=27,ref.group = ".all.",hide.ns = FALSE)+#更改横坐标后显著性会显示不出来
  #去掉背景格子和线
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))+
  labs(title="mice weight", x="Class", y="Weight")+#添加标题坐标轴名称
  theme(plot.title = element_text(hjust = 0.5,color = "black"),##标题居中,标题颜色为黑色
        axis.text.x = element_text(angle = 45, hjust = 0, vjust = 0.5),#横坐标倾斜
        axis.text.y = element_text(angle = 45, hjust = 0, vjust = 1),#纵坐标倾斜，hjust横向位置，vjust纵向位置
        text=element_text(size=12,family='Times New Roman',face='bold'))##调节轴上字体大小型号
##geom_boxplot中的width=0.2，箱型图宽度；geom_jitter中的width = 0.5离群点的位置；position=position_nudge(x=0)偏离坐标轴的位置
## geom_half_violin,side=l表示小提琴在左,size是线的宽度。label.y调整标签位置

