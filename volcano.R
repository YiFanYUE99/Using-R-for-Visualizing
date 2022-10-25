library(ggplot2)
data<-read.csv("D:/作业/22-08-29数据处理/处理结果/火山图/细胞/10A-48h_volcano.csv",header = TRUE,row.names=1,stringsAsFactors = F)
colnames(data)

#data$label<-c(rownames(data)[1:10],rep(NA,(nrow(data)-10)))
data$label<-rownames(data)
  
ggplot(data,aes(log2.FC.,X.log10.p.))+
  #添加水平误差线 虚线 dashed 颜色为灰色#999999
  geom_hline(yintercept = -log10(0.05),linetype="dashed",color="#999999")+
  #添加垂直误差线
  geom_vline(xintercept = c(-1.2,1.2),linetype="dashed",color="#999999")+
  geom_point(aes(size=X.log10.p.,color=X.log10.p.))+#根据-logp改变颜色
  #scale_color_gradient2(low ="#33429a",mid = "#f9ed36",high = "#b11f24",#gradient 2种颜色,gradient2 3种颜色，gradientn自定义
  #                      midpoint = 3)+
  scale_color_gradientn(values = seq(0,1,0.2),#gradientn自定义
                        colors = c("#39489f","#39bbec","#f9ed36","#f38466","#b81f25"))+
  theme_bw()+
  scale_size_continuous(range = c(2,8))+#更改点的大小
  theme(panel.grid=element_blank(),
        #标签位置
        legend.position = c(0.01,0.7),
        legend.justification = c(0,1)#相对位置
        )+
  guides(col=guide_colorbar(title="-log10(p adjusted)"),
         size="none")+#去掉size的标签
  #添加点的标签
  geom_text(aes(label=label,color=X.log10.p.,size=2,vjust=1.5,hjust=1))+
  xlab("log2Foldchange")+
  ylab("-log10(FDR)")
#保存图片
ggsave("D:/作业/22-08-29数据处理/处理结果/火山图/细胞/volcano10A-48h.pdf",height=10,width=10)


  