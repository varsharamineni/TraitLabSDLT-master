library(R.matlab)

setwd("~/Documents/GitHub/TraitLabSDLT-master/")

library(pheatmap)
library(grid)

data <- readMat('datamatrix.mat')
str(data)
data
m <- data$x
langs <- c('oldnorse', 'avestan', 'gothic', 'luvian', 
           'oldpersian', 'vedic' ,'umbrian','oldhighgerman',
           'oldprussian','latin' ,'welsh' ,'lithuanian', 
           'oldenglish', 'armenian','hittite', 'oldirish', 
           'albanian', 'oldcslavonic', 'greek', 'lycian',
           'latvian','tocharian_b','tocharian_a', 'oscan')
rownames(m) <- langs
 
#rownames(m) <- paste("Row", 1:24)
color = c('white', "#9999CC", "#66CC99")

pheatmap(m, cluster_rows = FALSE, 
cluster_cols = FALSE, color = c('white', "#9999CC", "#66CC99"),legend_breaks = c(0,1,2), legend_labels = c('0','1','?'), main = 'Heatmap of Indo-European data set')
#color = c('white', 'black', 'gray'))

data_u <- readMat('plot_y_test.mat')
str(data_u)
m_u <- data_u$mat
no_of_l <- c(seq(5,50,5), seq(5,50,5))
rownames(m_u) <- no_of_l

breaks = c(0,1)
colors <- c("red","blue","green","yellow","orange")


pheatmap(m_u, cluster_rows = FALSE, 
         cluster_cols = FALSE, color = c('white', "#9999CC"), border_color = 'black', legend_breaks = c(0,1))

setHook("grid.newpage", function() 
  pushViewport(viewport(x=1,y=1,width=0.9, 
                        height=0.9, name="vp", 
                        just=c("right","top"))), 
  action="prepend")
heatmap(m_u, cluster_rows = FALSE, 
         cluster_cols = FALSE, color = c('white', "#9999CC"), border_color = 'black', legend = FALSE)
setHook("grid.newpage", NULL, "replace")


heatmap(m_u)
heatmap(m_u[1:10,:], scale = "none", Rowv = NA, Colv = NA, col = cm.colors(2), main = "HeatMap Example") 


setHook("grid.newpage", function() pushViewport(viewport(x=1,y=1,width=0.9, height=0.9, name="vp", just=c("right","top"))), action="prepend")
pheatmap(m_u, cluster_rows = FALSE, 
         cluster_cols = FALSE, color = c('white', "#9999CC"), border_color = 'black', legend_breaks = c(0,1), main = expression("Heatmap of the sum of probabilities at each node of different trees", mu == 0.0005))
setHook("grid.newpage", NULL, "replace")
grid.text(expression(paste("Value of each cell is ", sum(u[i]^k,k = 0,L), "   for nodes i in tree (excluding Adam node)")), y=-0.03, gp=gpar(fontsize=15))
grid.text("Each row of cells represents a different tree (no. of leaves is shown on right hand side)", x=-0.03, rot=90, gp=gpar(fontsize=15))

setHook("grid.newpage", function() pushViewport(viewport(x=1,y=1,width=0.9, height=0.9, name="vp", just=c("right","top"))), action="prepend")
pheatmap(m_u[11:20,], cluster_rows = FALSE, 
         cluster_cols = FALSE, color = c('white', "#9999CC"), border_color = 'black', legend_breaks = c(0,1), main = expression("Heatmap of sum of probabilities at each node of tree",  mu == 0.003))
setHook("grid.newpage", NULL, "replace")
grid.text("cells represent nodes on tree", y=-0.07, gp=gpar(fontsize=10))
grid.text("Each row is a different tree (leaf size on right hand side)", x=-0.07, rot=90, gp=gpar(fontsize=10))

