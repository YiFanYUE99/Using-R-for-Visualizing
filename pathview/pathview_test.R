library(pathview)
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("pathview")

browseVignettes("pathview")
help("pathview")


#生成化合物数据
sim.cpd.data<-read.csv("D:/作业/pathway处理/keggid.csv",row.names = 1, header = 1)
origin<-read.csv("D:/作业/pathway处理/25_0.csv",row.names = 1, header = 0)
#用循环提取实验数据
for (i in 1:39)
{
  for (j in 1:363)
  {
    if(sim.cpd.data[i,3]==origin[1,j])
    {
      sim.cpd.data[i,1]=origin[2,j]
      sim.cpd.data[i,2]=origin[5,j]
    }
    
  }
}
cpd.data1<-sim.cpd.data[,1:2]#这部分是化合物keggid以及它在实验组的含量
write.csv(cpd.data1, file = "D:/作业/pathway处理/ckeggid.csv")
getwd()
setwd("D:/R_work")



#通过代谢物做代谢通路图，一次只能做一个通路上的
#网页版网址https://pathview.uncc.edu/
pv.out<-pathview(cpd.data = cpd.data1,#化合物数据 
                 pathway.id = "00250",
                 species = "hsa", 
                 out.suffix="cpd.Graphviz",
                 kegg.native = T,same.layer= T,
                 
                 
                 #默认参数
                 cpd.idtype = "kegg" ,
                 
                 #多样本
                 multi.state= T,
                 sign.pos="bottomright",#标签在底部右侧
                 cpd.lab.offset=1.1)#字体间距



