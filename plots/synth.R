library(tidyverse)
library(gridExtra)
library(cowplot)

setwd("~/Documents/GitHub/TraitLabSDLT-master/results/")

data_flat_synth1 <- readr::read_table("SIM1/flat6mill/tloutput.txt", skip = 3, 
                               col_names = 
                                 c('Sample', 'log_prior', 'integrated_llkd', 
                                   'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                   'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat_old_synth1 <- readr::read_table("SIM1/flat6millold/tloutput.txt", skip = 3, 
                                    col_names = 
                                      c('Sample', 'log_prior', 'integrated_llkd', 
                                        'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                        'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat_synth2 <- readr::read_table("SIM2/flat6mill/tloutput.txt", skip = 3, 
                                   col_names = 
                                     c('Sample', 'log_prior', 'integrated_llkd', 
                                       'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                       'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat_old_synth2 <- readr::read_table("SIM2/flat6millold/tloutput.txt", skip = 3, 
                                        col_names = 
                                          c('Sample', 'log_prior', 'integrated_llkd', 
                                            'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                            'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat_synth3 <- readr::read_table("SIM3/flat6mill/tloutput.txt", skip = 3, 
                                      col_names = 
                                        c('Sample', 'log_prior', 'integrated_llkd', 
                                          'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                          'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat_old_synth3 <- readr::read_table("SIM3/flat6millold/tloutput.txt", skip = 3, 
                                          col_names = 
                                            c('Sample', 'log_prior', 'integrated_llkd', 
                                              'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                              'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))

c1 <- ggplot(data = data_flat_synth1[500:1001,], aes(x = root_time, y = mu)) + geom_point(aes(x = root_time, y = mu)) + 
  #geom_bin2d(bins = 10, alpha = 0.5) + scale_fill_continuous(type = "viridis") +
  geom_density_2d_filled(alpha = 0.3,bins = 7) + 
  geom_density_2d(size = 0.25, colour = "black") + 
  labs(title = expression(paste("Joint Density Plot of root time and ", mu, "(New)")), y = expression(mu), x = 'Root Time') 

c2 <- ggplot(data = data_flat_old_synth1[500:1001,], aes(x = root_time, y = mu)) + geom_point(aes(x = root_time, y = mu)) + 
  geom_density_2d_filled(alpha = 0.3) + 
  geom_density_2d(size = 0.25, colour = "black") +
  labs(title = expression(paste("Joint Density Plot of root time and ", mu, "(Old)")), y = expression(mu), x = 'Root Time') 

plot_grid(c1, c2, nrow = 2)


ggplot() + geom_histogram(data = data_flat_synth3[500:1001,], aes(x = mu, color = "New Posterior"), bins = 200, fill = "white", alpha = 0.1) +
  scale_x_continuous(expression(mu), limits = c(0,0.0003)) + 
  scale_y_continuous('count', limits = c(0,35))  + 
  geom_histogram(data = data_flat_old_synth3[500:1001,], aes(x = mu, color = "Prior"), bins = 200, alpha = 0.1, fill = "white") + 
  #geom_histogram(data = data_flat_old[500:1001,], aes(x = mu, color = "Old Posterior"), bins = 200, alpha = 0.1, fill = "white") + 
  labs(title= expression(paste("Histogram for ", mu, " (Flat prior on tree)")))
  #scale_color_manual(values = colors) + 
  #theme(legend.position="none", legend.title = element_blank()) 


ggplot() + geom_density(data = data_flat_synth2[500:1001,], aes(x = mu, color = "New Posterior")) +
  scale_x_continuous(expression(mu), limits = c(0,0.01)) + 
  #scale_y_continuous('count', limits = c(0,35))  + 
  geom_density(data = data_flat_old_synth2[500:1001,], aes(x = mu, color = "Old Posterior")) + 
  #geom_histogram(data = data_flat_old[500:1001,], aes(x = mu, color = "Old Posterior"), bins = 200, alpha = 0.1, fill = "white") + 
  labs(title= expression(paste("Histogram for ", mu, " (Flat prior on tree)"))) 
  #geom_vline(xintercept=0.0005)
#scale_color_manual(values = colors) + 
#theme(legend.position="none", legend.title = element_blank()) 
