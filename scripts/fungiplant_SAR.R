# fungiplant_SAR.R
## script to make conceptual graphs of species-area relationships for fungal groups
## in comparison to plants

## load libraries
library(tidyverse)

## make species-area dataframe
area <- seq(1, 10000, 1)
z_plants <- 0.45
z_microbes <- 0.015
s_plants <- area^z_plants
s_microbes <- area^z_microbes

sar_dataframe <- as.data.frame(cbind(area, s_plants, s_microbes))

## make graphs
sar_graph_plants <- ggplot(data = sar_dataframe, aes(x = area/1000, y = (s_plants/s_plants[10000]))) +
  theme(legend.position = "right", 
        legend.text=element_text(size=15),
        legend.title=element_text(size=15),
        axis.title.y=element_text(size=rel(2.5), colour = 'black'),
        axis.title.x=element_text(size=rel(2.5), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_text(size=rel(2), colour = 'black'),
        panel.background = element_rect(fill = 'transparent', colour = 'black'),
        plot.background = element_rect(fill='transparent', color=NA),
        panel.grid.major = element_line(colour = "transparent")) +
  geom_line(size = 3, color = 'darkgreen') +
  ylim(c(0,1)) +
  xlab(expression('Area (km' ^ '2' * ')')) +
  ylab(expression('Plant species (rel. to 10 km' ^'2' * ')'))

sar_graph_microbes <- ggplot(data = sar_dataframe, aes(x = area/1000, y = (s_microbes/s_microbes[10000]))) +
  theme(legend.position = "right", 
        legend.text=element_text(size=15),
        legend.title=element_text(size=15),
        axis.title.y=element_text(size=rel(2.5), colour = 'black'),
        axis.title.x=element_text(size=rel(2.5), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_text(size=rel(2), colour = 'black'),
        panel.background = element_rect(fill = 'transparent', colour = 'black'),
        plot.background = element_rect(fill='transparent', color=NA),
        panel.grid.major = element_line(colour = "transparent")) +
  geom_line(size = 3, color = 'Blue') +
  ylim(c(0,1)) +
  xlab(expression('Area (km' ^ '2' * ')')) +
  ylab(expression('OTUs (rel. to 10 km' ^'2' * ')'))

## print plots
pdf('../plots/sar_graph_plants.pdf',
     width = 6, height = 6)
plot(sar_graph_plants)
dev.off()

pdf('../plots/sar_graph_microbes.pdf',
     width = 6, height = 6)
plot(sar_graph_microbes)
dev.off()






