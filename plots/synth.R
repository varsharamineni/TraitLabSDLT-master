library(tidyverse)
library(gridExtra)
library(cowplot)

setwd("~/Documents/GitHub/TraitLabSDLT-master/results/")

synth1 <- readr::read_table("SIM1/flat6mill/tloutput.txt", skip = 3, 
                               col_names = 
                                 c('Sample', 'log_prior', 'integrated_llkd', 
                                   'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                   'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
old_synth1 <- readr::read_table("SIM1/flat6millold/tloutput.txt", skip = 3, 
                                    col_names = 
                                      c('Sample', 'log_prior', 'integrated_llkd', 
                                        'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                        'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
synth2 <- readr::read_table("SIM2/flat6mill/tloutput.txt", skip = 3, 
                                   col_names = 
                                     c('Sample', 'log_prior', 'integrated_llkd', 
                                       'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                       'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
old_synth2 <- readr::read_table("SIM2/flat6millold/tloutput.txt", skip = 3, 
                                        col_names = 
                                          c('Sample', 'log_prior', 'integrated_llkd', 
                                            'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                            'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
synth3 <- readr::read_table("SIM3/flat6mill/tloutput.txt", skip = 3, 
                                      col_names = 
                                        c('Sample', 'log_prior', 'integrated_llkd', 
                                          'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                          'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
old_synth3 <- readr::read_table("SIM3/flat6millold/tloutput.txt", skip = 3, 
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



synth4 <- readr::read_table("SIM1root/flat6mill/tloutput.txt", skip = 3, 
                                     col_names = 
                                       c('Sample', 'log_prior', 'integrated_llkd', 
                                         'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                         'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
old_synth4 <- readr::read_table("SIM1root/flat6millold/tloutput.txt", skip = 3, 
                                     col_names = 
                                       c('Sample', 'log_prior', 'integrated_llkd', 
                                         'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                         'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
synth5 <- readr::read_table("SIM1rootLB/flat6mill/tloutput.txt", skip = 3, 
                                         col_names = 
                                           c('Sample', 'log_prior', 'integrated_llkd', 
                                             'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                             'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
old_synth5 <- readr::read_table("SIM1rootLB/flat6millold/tloutput.txt", skip = 3, 
                                     col_names = 
                                       c('Sample', 'log_prior', 'integrated_llkd', 
                                         'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                         'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))

c1 <- ggplot(data = root_data_flat1[500:1001,], aes(x = root_time, y = mu)) + geom_point(aes(x = root_time, y = mu)) + 
  #geom_bin2d(bins = 10, alpha = 0.5) + scale_fill_continuous(type = "viridis") +
  geom_density_2d_filled(alpha = 0.3,bins = 7) + 
  geom_density_2d(size = 0.25, colour = "black") + 
  labs(title = expression(paste("Joint Density Plot of root time and ", mu, "(New)")), y = expression(mu), x = 'Root Time') 

c2 <- ggplot(data = root_data_flat_old1[500:1001,], aes(x = root_time, y = mu)) + geom_point(aes(x = root_time, y = mu)) + 
  geom_density_2d_filled(alpha = 0.3) + 
  geom_density_2d(size = 0.25, colour = "black") +
  labs(title = expression(paste("Joint Density Plot of root time and ", mu, "(Old)")), y = expression(mu), x = 'Root Time') 

plot_grid(c1, c2, nrow = 2)

ggplot() + geom_histogram(data = root_data_flat2[500:1001,], aes(x =mu, color = "New Posterior"), bins = 100, fill = "white", alpha = 0.1) +
  #scale_x_continuous(expression(mu), limits = c(0.00001,0.00005)) + 
  #scale_y_continuous('count', limits = c(0,35))  + 
  geom_histogram(data = root_data_flat_old2[500:1001,], aes(x = mu, color = "Prior"), bins = 100, alpha = 0.1, fill = "white") + 
  #geom_histogram(data = data_flat_old[500:1001,], aes(x = mu, color = "Old Posterior"), bins = 200, alpha = 0.1, fill = "white") + 
  labs(title= expression(paste("Histogram for ", mu, " (Flat prior on tree)")))
#scale_color_manual(values = colors) + 
#theme(legend.position="none", legend.title = element_blank()) 


library("bayesplot")
library("ggplot2")
library("rstanarm")
library("mcmcplots")
library(coda)
library("MCMCvis")



data <- c('SIM1', 'SIM1', 'SIM2', 'SIM2', 'SIM3', 'SIM3', 'SIM4', 'SIM4', 'SIM5', 'SIM5')
posterior <- rep(c('new', 'old'),5)
lower <- 1:10
upper <- 1:10
mean <- 1:10
true <- c(0.0005, 0.0005, 0.0003, 0.0003, 0.0005, 0.0005, 0.0003, 0.0003, 0.0003, 0.0003)


mcmc1 <- as.mcmc(synth1[500:1001,]$mu)
lower[1] <- HPDinterval(mcmc1, prob = 0.95)[1]
upper[1] <- HPDinterval(mcmc1, prob = 0.95)[2]
mean [1] <- summary(mcmc1)$statistics['Mean']

old_mcmc1 <- as.mcmc(old_synth1[500:1001,]$mu)
lower[2] <- HPDinterval(old_mcmc1, prob = 0.95)[1]
upper[2] <- HPDinterval(old_mcmc1, prob = 0.95)[2]
mean [2] <- summary(old_mcmc1)$statistics['Mean']

mcmc2 <- as.mcmc(synth2[500:1001,]$mu)
lower[3] <- HPDinterval(mcmc2, prob = 0.95)[1]
upper[3] <- HPDinterval(mcmc2, prob = 0.95)[2]
mean [3] <- summary(mcmc2)$statistics['Mean']

old_mcmc2 <- as.mcmc(old_synth2[500:1001,]$mu)
lower[4] <- HPDinterval(old_mcmc2, prob = 0.95)[1]
upper[4] <- HPDinterval(old_mcmc2, prob = 0.95)[2]
mean [4] <- summary(old_mcmc2)$statistics['Mean']

mcmc3 <- as.mcmc(synth3[500:1001,]$mu)
lower[5] <- HPDinterval(mcmc3, prob = 0.95)[1]
upper[5] <- HPDinterval(mcmc3, prob = 0.95)[2]
mean [5] <- summary(mcmc3)$statistics['Mean']

old_mcmc3 <- as.mcmc(old_synth3[500:1001,]$mu)
lower[6] <- HPDinterval(old_mcmc3, prob = 0.95)[1]
upper[6] <- HPDinterval(old_mcmc3, prob = 0.95)[2]
mean [6] <- summary(old_mcmc3)$statistics['Mean']

mcmc4 <- as.mcmc(synth4[500:1001,]$mu)
lower[7] <- HPDinterval(mcmc4, prob = 0.95)[1]
upper[7] <- HPDinterval(mcmc4, prob = 0.95)[2]
mean [7] <- summary(mcmc4)$statistics['Mean']

old_mcmc4 <- as.mcmc(old_synth4[500:1001,]$mu)
lower[8] <- HPDinterval(old_mcmc4, prob = 0.95)[1]
upper[8] <- HPDinterval(old_mcmc4, prob = 0.95)[2]
mean [8] <- summary(old_mcmc4)$statistics['Mean']

mcmc5 <- as.mcmc(synth5[500:1001,]$mu)
lower[9] <- HPDinterval(mcmc5, prob = 0.95)[1]
upper[9] <- HPDinterval(mcmc5, prob = 0.95)[2]
mean [9] <- summary(mcmc5)$statistics['Mean']

old_mcmc5 <- as.mcmc(old_synth5[500:1001,]$mu)
lower[10] <- HPDinterval(old_mcmc5, prob = 0.95)[1]
upper[10] <- HPDinterval(old_mcmc5, prob = 0.95)[2]
mean [10] <- summary(old_mcmc5)$statistics['Mean']

df <- data.frame(data = data, lower = lower, upper = upper, mean = mean, true = true, posterior = posterior)


ggplot(df) + geom_point(aes(x = true, y = data, color = "TRUE VALUE"), shape = 'cross') + 
  geom_point(aes(x = mean, y = data, color = as.factor(posterior)), shape = 'cross') + 
  geom_ribbon(data= df,aes(xmin= lower,xmax= upper, y = data),alpha=0.3) + 
  geom_errorbar(aes(xmin=lower, xmax = upper, y = data, color = as.factor(posterior)), width=.2,
                position=position_dodge(.9)) + 
  labs(x = expression(mu), y = 'Synthetic Data Set', title = 'Mean and HPD intervals of death rate', color = "") + 
  scale_x_continuous(expression(mu)) + 
  scale_colour_manual(values = c("#f8766d", "#00b0f6", "black"), labels = c("New Posterior", "Old Posterior", "True Value")) + 
  theme(legend.position="top")
  #theme(legend.position="top", title = element_blank()) 
  
   
  
  

                 