library(ggplot2)

clade = c('hittite', 'tocharian_a', 'tocharian_b', 'luvian', 'lycian',
                          'oldirish', 'umbrian', 'oscan', 'latin', 'greek', 'greek (diverge)', 'armenian', 'gothic', 'oldnorse',
                          'oldenglish', 'oldhighgerman', 'oldcslavonic', 'oldprussian', 'avestan', 'oldpersian', 'vedic',
                          'celtic', 'italic', 'germanic',  'westgermnc','northwestgermnc','baltoslav','baltic', 'iraniangrp',
                          'indoiranian', 'toch')
rootmin = c(3200,1200,1200,3200,2200,1100,2090,2090,2000,2300,3700,1400,1620,700,1000,1000,950,
            450,2450,2350,3000,1700,2800,2250,1500,1750,2400,1300,2700,3600,1650)
rootmax = c(3650,1500,1500,3700,2500,1400,2300,2400,2200,2500,Inf,1600,1680,850,
            1150,1200,1150,700,2600,2600,3600,2650,Inf,2750,1600,1950,3400,1400,Inf,Inf,2140)
type = c('Root', 'Root', 'Root', 'Root', 'Root',
                 'Root', 'Root', 'Root', 'Root', 'Root', 'Diverge', 'Root', 'Root', 'Root',
                 'Root', 'Root', 'Root', 'Root', 'Root', 'Root', 'Root',
                 'Root', 'Root', 'Root',  'Root','Root','Root','Root', 'Root',
                 'Root', 'Root')
taxa = rep('Single taxa', 31)
taxa[21:31] = 'Group of taxa'

length(clade)
length(rootmin)
length(rootmax)

df = data.frame(clade = clade, rootmin = rootmin, rootmax = rootmax, type = type, taxa = taxa)

ggplot(data = df)+
  geom_segment(aes(x = clade, xend = clade, y = rootmin, yend = rootmax, colour = as.factor(taxa)), size = 5, alpha = 0.6) +
  coord_flip() +
  scale_x_discrete(limits = as.character(df_m$clade))+
  ylab("Time (years before most recent sampled taxa)")  + 
  theme(legend.position="top", legend.title = element_blank()) + 
  labs(title = 'Clade Constraint Intervals', x = 'Clade Name')
#facet_wrap(as.factor(Taxa), drop=TRUE, scales="free_y")

