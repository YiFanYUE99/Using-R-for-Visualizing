#patchwork:将几幅图放在一个图中
library(ggplot2)
library(patchwork)
p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))#散点图
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))#箱型图
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))#带误差范围的拟合曲线
p4 <- ggplot(mtcars) + geom_bar(aes(carb))#直方图

(p1 | p2 | p3) / p4#上面一行为p1 p2 p3 下面p4
p1+p2#p1 p2 在同一行

