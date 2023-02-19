library(ggraph)
library(tidygraph)
h<-highschool#这是一个三列表

#创建学生联系
graph<-as_tbl_graph(highschool)%>% 
  mutate(Popularity = centrality_degree(mode = 'in'))

#使用ggraph
ggraph(graph, layout = 'kk') + #点的显示方式
  geom_edge_fan(aes(alpha = after_stat(index)), show.legend = FALSE) + #边
  geom_node_point(aes(size = Popularity)) + 
  facet_edges(~year) + 
  theme_graph(foreground = 'steelblue', fg_text_colour = 'white')

