# effective sample size
library(R.matlab)
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



library(coda)
h <- as.mcmc(data_flat['root_time'])
effectiveSize(h)
h <- as.mcmc(data_flat['mu'])
effectiveSize(h)
h <- as.mcmc(data_flat['log_prior'])
effectiveSize(h)
h <- as.mcmc(data_flat['log_likelihood'])
effectiveSize(h)
