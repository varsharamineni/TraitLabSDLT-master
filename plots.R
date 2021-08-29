library(tidyverse)
library(gridExtra)
library(cowplot)


# DATA -  tree lengths
treelens_flat <- readr::read_table("flat 6mill/treelength.txt", col_names = c('lens'))
treelens_flat_zero <- readr::read_table("flat 6mill zero/treelength.txt", col_names = c('lens'))
treelens_flat_old <- readr::read_table("oldlkd flat 6mill/treelength.txt", col_names = c('lens'))
treelens_flat_old_zero <- readr::read_table("oldlkd flat 6mill zero/treelength.txt", col_names = c('lens'))

treelens_yule <- readr::read_table("yule 6mill/treelength.txt", col_names = c('lens'))
treelens_yule_zero <- readr::read_table("yule 6mill zero/treelength.txt", col_names = c('lens'))
treelens_yule_old <- readr::read_table("oldlkd yule 6mill/treelength.txt", col_names = c('lens'))
treelens_yule_old_zero <- readr::read_table("oldlkd yule 6mill zero/treelength.txt", col_names = c('lens'))


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




# PLOTTING
colors <- c("Posterior" = '#a1d76a', "Prior" = '#e9a3c9', "Posterior (full data)" = 'green')
#"flat" = '#67a9cf', "flat-zero" = '#ef8a62')




plot1 <- ggplot() + geom_histogram(data = data_flat[500:1000,], aes(x = root_time, color = "Posterior"), fill = 'white', bins = 100,  alpha = 0.3) + 
  scale_x_continuous('root time', breaks = seq(0,20000,2500), limits = c(0,20000)) + 
  geom_histogram(data = data_zero_flat[500:1000,], aes(x = root_time, color = "Prior"), fill = 'white', bins = 100, alpha = 0.3) + 
  #geom_histogram(data = data_flat_old[500:1000,], aes(x = root_time, color = "Full Data lkd"), fill = 'white', bins = 100, alpha = 0.3) + 
  labs(title='Histogram for root time - Flat Prior') + 
  #scale_color_manual(values = colors) +
  theme(legend.position="none") 
  #scale_color_manual(values = colors) + 
  #guides(colour = guide_legend(title.position = "bottom", title = element_blank()))
#  theme(legend.position = "top", legend.title=element_blank())
#  theme(axis.text=element_text(size=14), axis.title=element_text(size=14,face="bold"),
#  legend.text=element_text(size=12),
#        legend.justification=c(1,1),legend.position=c(1,1),legend.title=element_blank()
#  )

plot2 <- ggplot() + geom_histogram(data = data_yule[500:1000,], aes(x = root_time, color = "Posterior"), bins = 100, fill = "white", alpha = 0.3) +
  scale_x_continuous('root time', breaks = seq(0,20000,2500), limits = c(0,20000)) + 
  geom_histogram(data = data_zero_yule[500:1000,], aes(x = root_time, color = "Prior"), bins = 100, alpha = 0.3, fill = "white") + 
  labs(title='Histogram for root time- Yule Prior') +
  scale_color_manual(values = colors) +
  theme(legend.position="none") 


plot3 <- ggplot() + geom_histogram(data = data_flat[500:1000,], aes(x = mu, color = "Posterior"), bins = 100, fill = "white", alpha = 0.3) +
  scale_x_continuous('mu', limits = c(0,0.0004)) + 
  scale_y_continuous('count', limits = c(0,35))  + 
  geom_histogram(data = data_zero_flat[500:1000,], aes(x = mu, color = "Prior"), bins = 100, alpha = 0.5, fill = "white") + 
  labs(title= expression(paste("Histogram for ", mu, "- Flat Prior"))) + 
  #scale_color_manual(values = colors) + 
  theme(legend.position="none")

plot4 <- ggplot() + geom_histogram(data = data_yule[500:1000,], aes(x = mu, color = "Posterior"), bins = 100, fill = "white", alpha = 0.3) +
  scale_x_continuous('mu', limits = c(0,0.0004)) + 
  scale_y_continuous('count', limits = c(0,35))  + 
  geom_histogram(data = data_zero_yule[500:1000,], aes(x = mu,  color = "Prior"), bins = 100,  alpha = 0.3, fill = "white") + 
  labs(title=expression(paste("Histogram for ", mu, "- Yule Prior"))) + 
  scale_color_manual(values = colors) + 
  theme(legend.position="none")

plot5 <- ggplot() + geom_histogram(data = treelens_flat[500:1000,], aes(x = lens, color = "Posterior"), fill = 'white', bins = 100,  alpha = 0.3) + 
  geom_histogram(data = treelens_flat_zero[500:1000,], aes(x = lens, color = "Prior"), fill = 'white', bins = 100, alpha = 0.3) +
  labs(title= "Histogram for tree length - Flat Prior", x = 'tree length') +
  theme(legend.position="none")

plot6 <- ggplot() + geom_histogram(data = treelens_yule[500:1000,], aes(x = lens, color = "Posterior"), fill = 'white', bins = 100,  alpha = 0.3) + 
  geom_histogram(data = treelens_yule_zero[500:1000,], aes(x = lens, color = "Prior"), fill = 'white', bins = 100, alpha = 0.3) + 
  labs(title= "Histogram for tree length - Yule Prior", x = 'tree length') +
  scale_color_manual(values = colors) +
  theme(legend.position="none")

legend1 <- get_legend(plot5 +  theme(legend.position="right", legend.title = element_blank()))
legend2 <- get_legend(plot6 +  theme(legend.position="right", legend.title = element_blank()))

#plot_grid(plot1, plot2, plot3, plot4, legend, align = 'hv', ncol= 2, rel_widths = c(1,1,1,.1))
plot_grid(plot1, plot3, plot5, legend1, plot2, plot4, plot6, legend2,  align = 'hv', nrow= 2, rel_widths = c(1,1,1,.3,1,1,1,.3))

plot1_o <- ggplot() + geom_histogram(data = data_flat_old[500:1000,], aes(x = root_time, color = "Posterior"), fill = 'white', bins = 100,  alpha = 0.3) + 
  geom_histogram(data = data_flat_zero_old[500:1000,], aes(x = root_time, color = "Prior"), fill = 'white', bins = 100, alpha = 0.3) + 
  #geom_histogram(data = data_flat_old[500:1000,], aes(x = root_time, color = "Full Data lkd"), fill = 'white', bins = 100, alpha = 0.3) + 
  labs(title='Histogram for root time - Flat Prior') + 
  #scale_color_manual(values = colors) +
  theme(legend.position="none") 

plot2_o <- ggplot() + geom_histogram(data = data_yule_old[500:1000,], aes(x = root_time, color = "Posterior"), bins = 100, fill = "white", alpha = 0.3) +
  geom_histogram(data = data_yule_zero_old[500:1000,], aes(x = root_time, color = "Prior"), bins = 100, alpha = 0.3, fill = "white") + 
  labs(title='Histogram for root time- Yule Prior') +
  scale_color_manual(values = colors) +
  theme(legend.position="none") 

plot3_o <-ggplot() + geom_histogram(data = data_flat_old[500:1000,], aes(x = mu, color = "Posterior"), bins = 100, fill = "white", alpha = 0.3) +
  scale_x_continuous('mu', limits = c(0,0.0002)) + 
  scale_y_continuous('count', limits = c(0,50))  + 
  geom_histogram(data = data_flat_zero_old[500:1000,], aes(x = mu, color = "Prior"), bins = 100, alpha = 0.5, fill = "white") + 
  labs(title= expression(paste("Histogram for ", mu, "- Flat Prior"))) + 
  #scale_color_manual(values = colors) + 
  theme(legend.position="none")

plot4_o <- ggplot() + geom_histogram(data = data_yule_old[500:1000,], aes(x = mu, color = "Posterior"), bins = 100, fill = "white", alpha = 0.3) +
  #scale_x_continuous('mu', limits = c(0,0.0002)) + 
  #scale_y_continuous('count', limits = c(0,00))  + 
  geom_histogram(data = data_yule_zero_old[500:1000,], aes(x = mu,  color = "Prior"), bins = 100,  alpha = 0.3, fill = "white") + 
  labs(title=expression(paste("Histogram for ", mu, "- Yule Prior"))) + 
  scale_color_manual(values = colors) + 
  theme(legend.position="none")

plot5_o <- ggplot() + geom_histogram(data = treelens_flat_old[500:1000,], aes(x = lens, color = "Posterior"), fill = 'white', bins = 100,  alpha = 0.3) + 
  geom_histogram(data = treelens_flat_old_zero[500:1000,], aes(x = lens, color = "Prior"), fill = 'white', bins = 100, alpha = 0.3) +
  labs(title= "Histogram for tree length - Flat Prior", x = 'tree length') +
  theme(legend.position="none")

plot6_o  <- ggplot() + geom_histogram(data = treelens_yule_old[500:1000,], aes(x = lens, color = "Posterior"), fill = 'white', bins = 100,  alpha = 0.3) + 
  geom_histogram(data = treelens_yule_old_zero[500:1000,], aes(x = lens, color = "Prior"), fill = 'white', bins = 100, alpha = 0.3) + 
  labs(title= "Histogram for tree length - Yule Prior", x = 'tree length') +
  scale_color_manual(values = colors) +
  theme(legend.position="none")

legend1_o <- get_legend(plot5_o +  theme(legend.position="right", legend.title = element_blank()))
legend2_o <- get_legend(plot6_o +  theme(legend.position="right", legend.title = element_blank()))

#plot_grid(plot1, plot2, plot3, plot4, legend, align = 'hv', ncol= 2, rel_widths = c(1,1,1,.1))
plot_grid(plot1_o, plot3_o, plot5_o, legend1_o, plot2_o, plot4_o, plot6_o, legend2_o,  align = 'hv', nrow= 2, rel_widths = c(1,1,1,.3,1,1,1,.3))

