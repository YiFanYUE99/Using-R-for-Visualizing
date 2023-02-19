install.packages("ggwordcloud")
library(ggwordcloud)
#> Loading required package: ggplot2
data("love_words_small")


ggplot(love_words_small, 
       aes(label = word, size = speakers)) +
  geom_text_wordcloud() +
  scale_size_area(max_size = 40) +
  theme_minimal()