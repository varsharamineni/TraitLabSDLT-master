# plot of map 

library(ggplot2)
library(dplyr)
library(sf) 
library(terra)
library(spData)
library(spDataLarge)  
library(ggOceanMaps)


world_asia = world[world$continent == "Asia", ]
world_europe = world[world$continent == "Europe", ]

str(world)

india = world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3)
plot(world_asia[0], add = TRUE)

world_europe = world[world$continent == "Europe", ]

str(world)

turkey = world[world$name_long == "Turkey", ]
plot(st_geometry(turkey), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3)
plot(world_europe[0], add = TRUE)






thismap = map_data("world")

# Set colors
thismap <- mutate(thismap, fill = ifelse(region %in% c("UK", "Canada", "USA"), "red", "white"))

# Use scale_fiil_identity to set correct colors
ggplot(thismap, aes(long, lat, fill = fill, group=group)) + 
  geom_polygon(colour="gray") + ggtitle("Map of World") + 
  scale_fill_identity()

tree = rtree(10)
ggtree(tree) + 
  geom_tiplab(aes(label=node), hjust=-.1, size=5)+
  geom_taxalink("1", "2", color="blue3") +
  geom_taxalink("3", "4", color="orange2", curvature=-.9)

