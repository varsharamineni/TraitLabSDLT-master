library(tidyverse)
library(ggtree)
library(treeio)




set.seed(450)
tree <- rtree(9)
ggtree(tree, branch.length='none') + 
  #geom_rootpoint(size=10, alpha = 0.3, color = 'Purple') + 
  geom_nodepoint() +
  # geom_text(aes(x = 0, y = 4.2, label= 'Root'), size=5, color="purple", hjust = -.5) + 
  #geom_tippoint(color = 'Green',pch = 18, alpha=0.3, size=15) + 
  geom_tiplab(aes(label=node), hjust=-.1, size=5) +
  geom_point2(aes(subset=(node==13)), size=6, colour='red') + 
  geom_strip(1, 1, barsize=2, color='blue', label = "", offset.text=.3)+
  geom_cladelabel(node=13, label="m'=2", align=TRUE,  offset = .1, color='red') + 
  geom_cladelabel(node=14, label="", align=TRUE,  offset = .1, color='blue') + 
  geom_cladelabel(node=15, label="", align=TRUE,  offset = .1, color='blue') + 
  geom_cladelabel(node=1, label = "")

#+ geom_text(aes(label=node), hjust=-.1)
#ggtree(tree, branch.length='none') + geom_treescale()

tree <- rtree(22)
tree <- groupClade(tree, node=c(21, 17))
ggtree(tree, aes(color=group, linetype=group)) + geom_tiplab(aes(subset=(group==2)))

ggtree(tree) + geom_hilight(node=21, fill="steelblue", alpha=.6) +
  geom_hilight(node=17, fill="darkgreen", alpha=.6) 


nwk <- system.file("extdata", "sample.nwk", package="treeio")
tree <- read.tree(nwk)
ggtree(tree) + geom_hilight(node=21, fill="steelblue", alpha=.6) +
  geom_hilight(node=19, fill="darkgreen", alpha=.6) + 
  #geom_hilight(node=25, fill="yellow", alpha=.6) + 
  geom_tiplab(aes(label=node), hjust=-.1, size=5) + 
  geom_nodepoint() + 
  #geom_point2(aes(subset=(node==21)), shape=21, size=5, fill='green') + 
  geom_point2(aes(subset=(node==18)), shape=22, size=4, fill='red') +
  geom_point2(aes(subset=(node==19)), shape=23, size=4, fill='red') +
  geom_point2(aes(subset=(node==21)), shape=23, size=4, fill='red') + 
  geom_point2(aes(subset=(node==16)), shape=22, size=4, fill='red') +
  geom_point2(aes(subset=(node==14)), shape=21, size=4, fill='red') +
  geom_point2(aes(subset=(node==13)), shape=24, size=4, fill='red') + 
  theme(legend.position="right")


tree %>% as.treedata %>% as_tibble %>% 
  mutate(number = 1,
         range = lapply(number, function(x) c(-0.1, 0.1) + x)) %>% 
  as.treedata
  


tree2 <- groupClade(tree, c(17, 21))
p <- ggtree(tree2, aes(color=group)) + theme(legend.position='none') +
  scale_color_manual(values=c("black", "firebrick", "steelblue"))
scaleClade(p, node=17, scale=.1) 
p2 <- p %>% collapse(node=21) + 
  geom_point2(aes(subset=(node==21)), shape=21, size=5, fill='green')
p2 <- collapse(p2, node=23) + 
  geom_point2(aes(subset=(node==23)), shape=23, size=5, fill='red')
print(p2)
expand(p2, node=23) %>% expand(node=21)

#geom_range('reltime_0.95_CI', color='red', size=3, alpha=.3)

file <- system.file("extdata/MEGA7", "mtCDNA_timetree.nex", package = "treeio")
x <- read.tree(file)
p1 <- ggtree(x) + 
p2 <- ggtree(x) + geom_range('reltime_0.95_CI', color='red', size=3, alpha=.3, center='reltime')  
p3 <- p2 + scale_x_range() + theme_tree2()





library(ggtree)
tree <- rtree(10)
ggtree(tree) + geom_tiplab(aes(label=node), hjust=-.1, size=5) 
  #geom_label(aes(label=D), fill='steelblue') + 
  #geom_text(aes(label=B), hjust=-.5)




tree = rtree(10)
ggtree(tree, branch.length = 'none') + 
  geom_tiplab(aes(label=node), hjust=-.1, size=5) 
  geom_cladelabel(node=7, label="Some random clade", 
                  color="red2", offset=.8, align=TRUE) + 
  geom_cladelabel(node=1, label="A different clade", 
                  color="blue", offset=.8, align=TRUE) + 
  theme_tree2() + 
  theme_tree()





