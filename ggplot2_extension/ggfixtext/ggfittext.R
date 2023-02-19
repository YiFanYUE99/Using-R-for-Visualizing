install.packages("ggfittext")
library(ggfittext)
library(ggplot2)
ggplot(beverages, aes(x = beverage, y = proportion, label = ingredient,
                      fill = ingredient)) +
  geom_col(position = "dodge") +
  geom_bar_text(position = "dodge", grow = TRUE, reflow = TRUE, 
                place = "left") +
  coord_flip()#坐标翻转

b<-beverages
