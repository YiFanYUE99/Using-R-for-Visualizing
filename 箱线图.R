#带显著性标签的箱线图
library(ggpubr)
library(RColorBrewer)
df<-read.csv("D:/R语言应用/作图/云雨图 小提琴图 箱线图/tidyweight.csv",header = TRUE,row.names = 1)
palette<-c(brewer.pal(5,"Set3")[c(1,2,3)])#调整颜色，3表示使用颜色梯度，引号内表示色条对应名称
##查看颜色种类
#
#display.brewer.all(type="seq")#可选type:div,qual,seq
#display.brewer.all()
#
ggboxplot(df,x="Class",y="weight12",fill = "Class",palette = palette,
          add = "jitter",size=0.5,add.params = list(size=0.25))+
  scale_color_brewer(palette="Spectral")+#散点图颜色
  scale_fill_brewer(palette="Spectral")+#小提琴图颜色
  geom_hline(yintercept = mean(df$weight12),linetype=2)+
  stat_compare_means(method = "anova",label.y=30)+
  stat_compare_means(label="p.signif",method = "t.test",label.y=28,ref.group = ".all.",hide.ns = TRUE)+
  labs(title="mice weight", x="Class", y="Weight")+#添加标题坐标轴名称
  theme(plot.title = element_text(hjust = 0.5))+#标题居中
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))
#添加wilcox检验
compaired<-list(c("CK","L-MET"),c("CK","H-MET"),c("L-MET","H-MET"))
ggboxplot(df,x="Class",y="weight12",fill = "Class",add = "jitter",size = 0.5)+
  scale_fill_brewer(palette="Spectral")+#小提琴图颜色
  stat_compare_means(comparisons = compaired,method = "wilcox.test")+
  labs(title="mice weight", x="Class", y="Weight")+#添加标题坐标轴名称
  theme(plot.title = element_text(hjust = 0.5),##标题居中
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),#横坐标倾斜
        axis.text.y = element_text(angle = 45, hjust = 1, vjust = 1),#纵坐标倾斜
        text=element_text(size=12,family='Times New Roman',face='bold'))+##调节轴上字体大小型号
  ##去掉背景线和颜色
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "grey"))