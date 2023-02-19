#双数据箱线图
#install.packages("devtools")
#library(devtools)  
#install_github("JanCoUnchained/ggunchained")
library(ggunchained) 
##查看颜色种类
#
#display.brewer.all(type="seq")#可选type:div,qual,seq
#display.brewer.all()
#
df<-read.csv("D:/R语言应用/作图/肝肾指标.csv",header = TRUE)
ggplot(df,aes(x=Class,y=g,fill=factor(Organ)))+
  geom_split_violin(draw_quantiles = 0.5,trim = FALSE)+
  scale_color_brewer(type="seq",palette="Accent")+#散点图颜色
  geom_jitter(aes(Class,g,fill=factor(Organ)),shape=21,size=1,position = position_nudge(x=0,y=0))+
  scale_fill_brewer(type="seq",palette="Accent")+#小提琴图颜色
  guides(fill=guide_legend(title = "Organ"))+
  xlim(c("CK","F","L","FL","H","FH"))+
  #去掉背景格子和线
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))+
  labs(title="kidney and liver Index", x="Class", y="Index")+#添加标题坐标轴名称
  theme(plot.title = element_text(hjust = 0.5),##标题居中
        axis.text.x = element_text(angle = 0, hjust = 1, vjust = 1),#横坐标倾斜
        axis.text.y = element_text(angle = 0, hjust = 1, vjust = 1),#纵坐标倾斜
        text=element_text(size=12,family='Times New Roman',face='bold'))##调节轴上字体大小型号
##这个图的两半分别为不同日期的体重
##draw_quantiles在某个分位数上画线，position = position_nudge(x=0,y=0)调整图像偏移位置