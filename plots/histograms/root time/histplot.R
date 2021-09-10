library(tidyverse)
library(gridExtra)
library(cowplot)

setwd("~/Documents/GitHub/TraitLabSDLT-master/results/no miss results")

# DATA - parameters, root time - YULE PRIOR
data_yule <- readr::read_table("yule 6mill/tloutput.txt", skip = 3, 
                               col_names = 
                                 c('Sample', 'log_prior', 'integrated_llkd', 
                                   'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                   'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_zero_yule <- readr::read_table("yule 6mill zero/tloutput.txt", skip = 3, 
                                    col_names = 
                                      c('Sample', 'log_prior', 'integrated_llkd', 
                                        'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                        'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_yule_old <- readr::read_table("oldlkd yule 6mill/tloutput.txt", skip = 3, 
                                   col_names = 
                                     c('Sample', 'log_prior', 'integrated_llkd', 
                                       'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                       'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_yule_zero_old <- readr::read_table("oldlkd yule 6mill zero/tloutput.txt", skip = 3, 
                                        col_names = 
                                          c('Sample', 'log_prior', 'integrated_llkd', 
                                            'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                            'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))

# DATA - parameters, root time - FLAT PRIOR
data_flat <- readr::read_table("flat 6mill/tloutput.txt", skip = 3, 
                               col_names = 
                                 c('Sample', 'log_prior', 'integrated_llkd', 
                                   'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                   'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_zero_flat <- readr::read_table("flat 6mill zero/tloutput.txt", skip = 3, 
                                    col_names = 
                                      c('Sample', 'log_prior', 'integrated_llkd', 
                                        'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                        'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))

data_flat_old <- readr::read_table("oldlkd flat 6mill/tloutput.txt", skip = 3, 
                                   col_names = 
                                     c('Sample', 'log_prior', 'integrated_llkd', 
                                       'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                       'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat_zero_old <- readr::read_table("oldlkd flat 6mill zero/tloutput.txt", skip = 3, 
                                        col_names = 
                                          c('Sample', 'log_prior', 'integrated_llkd', 
                                            'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                            'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))

#colors <- c("Old Posterior" = '#e9a3c9', "Prior" = '#a1d76a', "Old Posterior" = )


ggplot() + geom_histogram(data = data_flat[500:1001,], aes(x = root_time, color = " New Posterior"), fill = 'white', bins = 1000,  alpha = 0.1) +
  scale_x_continuous('root time', breaks = seq(0,20000,2000), limits = c(0,20000)) + 
  geom_histogram(data = data_zero_flat[500:1001,], aes(x = root_time, color = "Prior"), fill = 'white', bins = 1000, alpha = 0.1) + 
  geom_histogram(data = data_flat_old[500:1001,], aes(x = root_time, color = "Old Posterior"), fill = 'white', bins = 1000, alpha = 0.1) + 
  labs(title='Histogram for root time (Flat prior on tree)') + 
  theme(legend.position="none", legend.title = element_blank()) 

p1 <- ggplot() + geom_density(data = data_flat[500:1001,], aes(x = root_time, color =" New Posterior", fill = " New Posterior"), alpha = 0.1) + 
  scale_x_continuous('root time', breaks = seq(0,20000,2000), limits = c(0,20000)) + 
  geom_density(data = data_zero_flat[500:1001,], aes(x = root_time, fill = "Prior", color =" Prior",), alpha = 0.1) + 
  geom_density(data = data_flat_old[500:1001,], aes(x = root_time, fill = "Old Posterior", color =" Old Posterior",), alpha =0.1) + 
  labs(title='Denisty plot for root time (Flat prior on tree)') + 
  guides(color = FALSE)+ 
  theme(legend.position="none", legend.title = element_blank()) 




p2 <- ggplot() + geom_histogram(data = data_yule[500:1001,], aes(x = root_time, color = "New Posterior"), fill = 'white', bins = 100,  alpha = 0.1) + 
  scale_x_continuous('root time', breaks = seq(0,20000,2000), limits = c(0,20000)) + 
  geom_histogram(data = data_zero_yule[500:1001,], aes(x = root_time, color = "Prior"), fill = 'white', bins = 100, alpha = 0.1) + 
  geom_histogram(data = data_yule_old[500:1001,], aes(x = root_time, color = "Old Posterior"), fill = 'white', bins = 100, alpha = 0.1) + 
  labs(title='Histogram for root time (Yule prior on tree)') + 
  theme(legend.position="none") 

p2 <- ggplot() + geom_density(data = data_yule[500:1001,], aes(x = root_time, color = " New Posterior", fill = " New Posterior"), alpha = 0.1) + 
  scale_x_continuous('root time', breaks = seq(0,20000,2000), limits = c(0,20000)) + 
  geom_density(data = data_zero_yule[500:1001,], aes(x = root_time, color = "Prior", fill = "Prior"), alpha = 0.1) + 
  geom_density(data = data_yule_old[500:1001,], aes(x = root_time, color = "Old Posterior", fill = "Old Posterior"), alpha = 0.1) + 
  labs(title='Density plot for root time (Yule prior on tree)') + 
  guides(color = FALSE) + 
  theme(legend.position="none", legend.title = element_blank()) 


legend <- get_legend(p1 +  theme(legend.position="bottom"))
plot_grid(p1, p2, legend, ncol= 1, rel_heights= c(1,1,.3))


p3 <- ggplot() + geom_histogram(data = data_flat[500:1001,], aes(x = mu, color = "New Posterior"), bins = 200, fill = "white", alpha = 0.1) +
  scale_x_continuous(expression(mu), limits = c(0,0.0003)) + 
  scale_y_continuous('count', limits = c(0,35))  + 
  geom_histogram(data = data_zero_flat[500:1001,], aes(x = mu, color = "Prior"), bins = 200, alpha = 0.1, fill = "white") + 
  geom_histogram(data = data_flat_old[500:1001,], aes(x = mu, color = "Old Posterior"), bins = 200, alpha = 0.1, fill = "white") + 
  labs(title= expression(paste("Histogram for ", mu, " (Flat prior on tree)"))) +
  #scale_color_manual(values = colors) + 
  theme(legend.position="none", legend.title = element_blank()) 

#ggplot() + geom_density(data = data_flat[500:1001,], aes(x = mu, color = "New Posterior"), alpha = 0.1) +
  scale_x_continuous(expression(mu), limits = c(0,0.0003)) + 
  #scale_y_continuous('count', limits = c(0,35))  + 
  geom_density(data = data_zero_flat[500:1001,], aes(x = mu, color = "Prior"), ) + 
  geom_density(data = data_flat_old[500:1001,], aes(x = mu, color = "Old Posterior")) + 
  labs(title= expression(paste("Histogram for ", mu, " (Flat prior on tree)"))) +
  #scale_color_manual(values = colors) + 
  theme(legend.position="none", legend.title = element_blank()) 
  
  
p4 <- ggplot() + geom_histogram(data = data_yule[500:1001,], aes(x = mu, color = "New Posterior"), bins = 200, fill = "white", alpha = 0.1) +
  scale_x_continuous(expression(mu), limits = c(0,0.0003)) + 
  scale_y_continuous('count', limits = c(0,35))  + 
  geom_histogram(data = data_zero_yule[500:1001,], aes(x = mu, color = "Prior"), bins = 200, alpha = 0.1, fill = "white") + 
  geom_histogram(data = data_yule_old[500:1001,], aes(x = mu, color = "Old Posterior"), bins = 200, alpha = 0.1, fill = "white") +
  labs(title= expression(paste("Histogram for ", mu, " (Yule prior on tree)")))  +
  theme(legend.position="none", legend.title = element_blank()) 
 
legend1 <- get_legend(p3 +  theme(legend.position="bottom"))
plot_grid(p3, p4, legend1, ncol= 1, rel_heights= c(1,1,.3))

# DATA -  tree lengths
treelens_flat <- readr::read_table("flat 6mill/treelength.txt", col_names = c('lens'))
treelens_flat_zero <- readr::read_table("flat 6mill zero/treelength.txt", col_names = c('lens'))
treelens_flat_old <- readr::read_table("oldlkd flat 6mill/treelength.txt", col_names = c('lens'))
treelens_flat_old_zero <- readr::read_table("oldlkd flat 6mill zero/treelength.txt", col_names = c('lens'))

treelens_yule <- readr::read_table("yule 6mill/treelength.txt", col_names = c('lens'))
treelens_yule_zero <- readr::read_table("yule 6mill zero/treelength.txt", col_names = c('lens'))
treelens_yule_old <- readr::read_table("oldlkd yule 6mill/treelength.txt", col_names = c('lens'))
treelens_yule_old_zero <- readr::read_table("oldlkd yule 6mill zero/treelength.txt", col_names = c('lens'))

p5 <- ggplot() + geom_histogram(data = treelens_flat[500:1001,], aes(x = lens, color = "New Posterior"), fill = 'white', bins = 100,  alpha = 0.1) +
  scale_x_continuous('tree length', breaks = seq(20000,175000,25000), limits = c(20000,175000)) + 
  geom_histogram(data = treelens_flat_zero[500:1001,], aes(x = lens, color = "Prior"), fill = 'white', bins = 100, alpha = 0.1) +
  geom_histogram(data = treelens_flat_old[500:1001,], aes(x = lens, color = "Old Posterior"), fill = 'white', bins = 100, alpha = 0.1) +
  labs(title= "Histogram for tree length (Flat prior on tree)", x = 'tree length') +
  theme(legend.position="none", legend.title = element_blank()) 

p6 <- ggplot() + geom_histogram(data = treelens_yule[500:1001,], aes(x = lens, color = "New Posterior"), fill = 'white', bins = 100,  alpha = 0.1) +
  scale_x_continuous('tree length', breaks = seq(20000,175000,25000), limits = c(20000,175000)) +
  geom_histogram(data = treelens_yule_zero[500:1001,], aes(x = lens, color = "Prior"), fill = 'white', bins = 100, alpha = 0.1) +
  geom_histogram(data = treelens_yule_old[500:1001,], aes(x = lens, color = "Old Posterior"), fill = 'white', bins = 100, alpha = 0.1) +
  labs(title= "Histogram for tree length (Yule prior on tree)", x = 'tree length') +
  theme(legend.position="none")

legend3 <- get_legend(p5 +  theme(legend.position="bottom"))
plot_grid(p5, p6, legend1, ncol= 1, rel_heights= c(1,1,.3))


# root time against mu values 
c1 <- ggplot(data = data_flat[500:1001,], aes(x = root_time, y = mu)) + geom_point(aes(x = root_time, y = mu)) + 
  #geom_bin2d(bins = 10, alpha = 0.5) + scale_fill_continuous(type = "viridis") +
  geom_density_2d_filled(alpha = 0.3,bins = 7) + 
  geom_density_2d(size = 0.25, colour = "black") + 
  labs(title = expression(paste("Joint Density Plot of root time and ", mu, "(New)")), y = expression(mu), x = 'Root Time') 

c2 <- ggplot(data = data_flat_old[500:1001,], aes(x = root_time, y = mu)) + geom_point(aes(x = root_time, y = mu)) + 
  geom_density_2d_filled(alpha = 0.3) + 
  geom_density_2d(size = 0.25, colour = "black") +
  labs(title = expression(paste("Joint Density Plot of root time and ", mu, "(Old)")), y = expression(mu), x = 'Root Time') 

plot_grid(c1, c2, nrow = 2)



# root time against mu values 
ggplot() + geom_point(data = data_yule[500:1001,], aes(x = root_time, y = mu)) +
  geom_point(data = data_yule_old[500:1001,], aes(x = root_time, y = mu), color = 'red') 

ggplot(data_flat[500:1001,], aes(x=root_time, y=mu) ) +
  geom_density_2d()

ggplot(data_flat[500:1001,], aes(x=root_time, y=mu) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon")

ggplot(data_flat[500:1001,], aes(x=root_time, y=mu) ) +
stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white") + 
labs(title= "Histogram for tree length (Flat prior on tree)", x = 'tree length') 
  

ggplot(data_flat_old[500:1001,], aes(x=root_time, y=mu) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")

ggplot(data_yule[500:1001,], aes(x=root_time, y=mu) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")

ggplot(data_yule_old[500:1001,], aes(x=root_time, y=mu) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")


ggplot(data_flat[500:1001,], aes(x=root_time, y=mu) ) + 
geom_hex(bins = 40) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot() + 
  geom_hex(data = data_flat_old[500:1001,], aes(x=root_time, y=mu), bins = 50, alpha = 0.5) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()  
  #geom_hex(data = data_flat[500:1001,], aes( x=root_time, y=mu), bins = 50, colors = brewer.pal(5,"Purples") ) 

ggplot() + 
  geom_hex(data = data_flat[500:1001,], aes(x=root_time, y=mu), bins = 40) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()  


plot_grid(c1, c2, ncol = 2)


ggplot(data_flat[500:1001,], aes(x=root_time, y=mu) ) + 
  geom_hex(bins = 50) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot(data_flat_old[500:1001,], aes(x=root_time, y=mu) ) + 
  geom_hex(bins = 50) +
  scale_fill_gradient2()

ggplot(data_yule[500:1001,], aes(x=root_time, y=mu) ) + 
  geom_hex(bins = 50) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot(data_yule_old[500:1001,], aes(x=root_time, y=mu) ) + 
  geom_hex(bins = 50) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

library(ggplot2)
library(RColorBrewer)
library(ggExtra)

ggplot(data_flat[500:1001,], aes(x = root_time, y = mu))+
  stat_bin_hex() +
  scale_fill_gradientn(colors = brewer.pal(5,"Purples")) +
  theme_bw() +
  theme(legend.position = "bottom")

ggMarginal(p, type = "histogram", fill = brewer.pal(3,"Greens")[1], color = "white")


ggplot() + geom_histogram(data = data_zero_flat[500:1001,], aes(x = root_time), bins = 20) + 
  scale_x_continuous('root time', breaks = seq(0,20000,2000), limits = c(0,20000)) 



