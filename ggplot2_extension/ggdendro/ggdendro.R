library(ggtree)


#计算聚类
#install.packages("flexclust")
data(nutrient,package="flexclust")
nutrient.scaled<-scale(nutrient)
d<-dist(nutrient.scaled)
fit.ward<-hclust(d,method = "ward")


library(ggdendro)
fitdata<-dendro_data(fit.ward,type = "rectangle")
library(ggplot2)
ggplot() +
  geom_segment(data = segment(fitdata), 
               aes(x = x, y = y, xend = xend, yend = yend)
  ) +
  geom_text(data = label(fitdata), 
            aes(x = x, y = y, label = label, hjust = 0), 
            size = 3
  ) +
  coord_flip() +
  scale_y_reverse(expand = c(0.2, 0))

library(dendextend)
