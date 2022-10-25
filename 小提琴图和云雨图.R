library(ggplot2)
library(ggpubr)
library(RColorBrewer)
df<-read.csv("D:/R语言应用/作图/tidyweight.csv",header = TRUE,row.names = 1)
palette<-c(brewer.pal(5,"Set3")[c(1,2,3)])
##查看颜色种类
#
#display.brewer.all(type="seq")#可选type:div,qual,seq
#display.brewer.all()
#
compaired<-list(c("CK","L-MET"),c("CK","H-MET"),c("L-MET","H-MET"))
#小提琴图
ggplot(df,aes(x=Class,y=weight12))+
  geom_violin(aes(fill=Class),position=position_nudge(x=0),color="grey",trim = FALSE)+
  scale_color_brewer(palette="Spectral")+#散点图颜色
  scale_fill_brewer(palette="Spectral")+#小提琴图颜色
  geom_jitter(aes(color=Class),size=1,position =position_nudge(x=0.5))+
  geom_boxplot(width=0.2,position =position_nudge(x=0),fill="white",color="grey",size=.5)+
  stat_compare_means(comparisons = compaired,method = "wilcox.test",label.y = c(38,39,40))+
  stat_compare_means(method = "anova",label.y=30)+
  stat_compare_means(label="p.signif",method = "t.test",label.y=28,ref.group = ".all.",hide.ns = TRUE)+
  ylim(27, 41)+
  xlim(c("CK","L-MET","H-MET"))+
  #去掉背景格子和线
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))+
  labs(title="mice weight", x="Class", y="Weight")+#添加标题坐标轴名称
  theme(plot.title = element_text(hjust = 0.5),##标题居中
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),#横坐标倾斜
        axis.text.y = element_text(angle = 90, hjust = 1, vjust = 1),#纵坐标倾斜
        text=element_text(size=12,family='Times New Roman',face='bold'))##调节轴上字体大小型号
#position_nudge调整box位置,label.y调整p值位置;color是边框颜色，fill是填充颜色
##geom_boxplot中的width=0.2，箱型图宽度；geom_jitter中的width = 0.5离群点的位置；position=position_nudge(x=0)偏离坐标轴的位置
##只要将geom_boxplot中fill="white"改为aes(fill=Class)就也可根据Class变换颜色
