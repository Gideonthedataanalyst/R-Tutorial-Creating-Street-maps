install.packages("osmdata")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("sf")

library(tidyverse)
library(osmdata)
library(ggplot2)
library(sf)

available_features()

available_tags("highway")

roads <- getbb("Mombasa KE")%>%
  opq(timeout = 3500)%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary", "residential",
                            "living_street", "unclassified")) %>%
  osmdata_sf()

getbb("Mombasa KE")

#          min      max
#x 39.50717 39.82717
#y -4.21052 -3.89052

Mombasamap1<-ggplot() +
  geom_sf(data = roads$osm_lines,
          inherit.aes = FALSE,
          color = "black",)+
  coord_sf(xlim = c(39.50717, 39.82717), 
           ylim = c(-4.21052, -3.89052),
           expand = FALSE) 
Mombasamap1

available_features()
available_tags("natural")

coast <- getbb("Mombasa KE")%>%
  opq(timeout = 3500)%>%
  add_osm_feature(key = "natural", 
                  value = c("coastline")) %>%
  osmdata_sf()

Mombasamap2<-ggplot() +
  geom_sf(data = roads$osm_lines,
          inherit.aes = FALSE,
          color = "black",)+
  geom_sf(data = coast$osm_lines,
          inherit.aes = FALSE,
          color = "black",)+
  coord_sf(xlim = c(39.50717, 39.82717), 
           ylim = c(-4.21052, -3.89052),
           expand = FALSE) 
Mombasamap2


Mombasamap3<-ggplot() +
  geom_sf(data = roads$osm_lines,
          inherit.aes = FALSE,
          color = "black",)+
  geom_sf(data = coast$osm_lines,
          inherit.aes = FALSE,
          color = "black",)+
  coord_sf(xlim = c(39.50717, 39.82717), 
           ylim = c(-4.21052, -3.89052),
           expand = FALSE) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+
  theme(panel.grid.major = element_line(colour = "transparent"))+
  theme(
    plot.background = element_rect(fill = "gray11")
  )
Mombasamap3


#