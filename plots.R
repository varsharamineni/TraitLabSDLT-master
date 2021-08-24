library(tidyverse)
data_yule <- readr::read_table("stats output/tloutput.txt", skip = 3, 
                          col_names = 
                            c('Sample', 'log_prior', 'integrated_llkd', 
                             'root_time', 'mu', 'p', 'lambda', 'kappa', 
                             'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_flat <- readr::read_table("flat/tloutput.txt", skip = 3, 
                               col_names = 
                                 c('Sample', 'log_prior', 'integrated_llkd', 
                                   'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                   'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data_zero <- readr::read_table("zero/tloutput.txt", skip = 3, 
                               col_names = 
                                 c('Sample', 'log_prior', 'integrated_llkd', 
                                   'root_time', 'mu', 'p', 'lambda', 'kappa', 
                                   'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))




ggplot() + geom_histogram(data = data_yule[500:1000,], aes(x = root_time), bins = 100, colour = 'blue', fill = "white", alpha = 0.5) + 
  scale_x_continuous('Root Time', breaks = seq(0,20000,2500), limits = c(0,20000)) + 
  geom_histogram(data = data_flat[500:1000,], aes(x = root_time), bins = 100, colour = 'green', alpha = 0.5, fill = "white") + 
  geom_histogram(data = data_zero[500:1000,], aes(x = root_time), bins = 100, colour = 'red', alpha = 0.5, fill = "white") 

ggplot() + geom_histogram(data = data_yule[500:1000,], aes(x = mu), bins = 100, colour = 'blue', fill = "white", alpha = 0.5) + 
  scale_x_continuous('Root Time', breaks = seq(0,1,0.1), limits = c(0,1)) +
  geom_histogram(data = data_flat[500:1000,], aes(x = mu), bins = 100, colour = 'green', alpha = 0.5, fill = "white") + 
  geom_histogram(data = data_zero[500:1000,], aes(x = mu), bins = 100, colour = 'red', alpha = 0.5, fill = "white") 
