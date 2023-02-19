#ggstatsplot：有更多数据统计功能的ggplot2
#ctrl shift c 快速注释
# Function	Plot	Description
# ggbetweenstats()	violin plots	for comparisons between groups/conditions
# ggwithinstats()	violin plots	for comparisons within groups/conditions
# gghistostats()	histograms	for distribution about numeric variable
# ggdotplotstats()	dot plots/charts	for distribution about labeled numeric variable
# ggscatterstats()	scatterplots	for correlation between two variables
# ggcorrmat()	correlation matrices	for correlations between multiple variables
# ggpiestats()	pie charts	for categorical data
# ggbarstats()	bar charts	for categorical data
# ggcoefstats()	dot-and-whisker plots	for regression models and meta-analysis
library(ggstatsplot)#需要按照指令更新一系列的包

ggbetweenstats(
  data  = iris,
  x     = Species,
  y     = Sepal.Length,
  title = "Distribution of sepal length across Iris species"
)

#添加一根拟合线
ggwithinstats(
  data  = iris,
  x     = Species,
  y     = Sepal.Length,
  title = "Distribution of sepal length across Iris species"
)

#简单版相关系数图
ggcorrmat(
  data  = iris,
  title = "Distribution of sepal length across Iris species"
)
#饼图
ggpiestats(
  data  = iris,
  x     = Species,
)

#条形分布图
ggbarstats(
  data  = iris,
  x     = Species,
  y     = Sepal.Length
)

#直方图
gghistostats(
  data  = iris,
  x     =  Sepal.Length ,#x需要是具体数值
  bin.args = list(color = "black", fill = "blue", alpha = 0.7)#调色
)
#散点图
ggdotplotstats(
  data  = iris,
  x     = Sepal.Length,#数值类变量
  y     = Species#与之前不同，这里是类别
)

#拟合曲线散点图，x y需要都为连续变量
ggscatterstats(
  data  = as.data.frame(iris),
  x     = Sepal.Length,#
  y     = Petal.Length#
)


