library(tidyverse)
data <- readr::read_table("tloutput.txt", skip = 3, 
                          col_names = 
                            c('Sample', 'log_prior', 'integrated_llkd', 
                             'root_time', 'mu', 'p', 'lambda', 'kappa', 
                             'rho', 'ncat', 'log_likelihood', 'beta', 'NA'))
data


plot(data('root time'))

ggplot(data, aes(x=root_time)) + geom_histogram(bins = 50)
