library(qqman)
par(mfrow=c(1,2))
layout.show(2)
manhattan(gwasResults,
          main="Manhattan plot",
          ylim=c(0,8),
          cex=0.6,
          cex.axis=0.9,
          col=c("blue4","orange3"),
          suggestiveline = -log10(10e-6),#下线
          genomewideline = -log10(10e-8),#上线
          highlight = snpsOfInterest)#高亮显示部分结果
manhattan(subset(gwasResults,CHR==3))#挑选第三条染色体单独画
snpsOfInterest
