# richness_latitude.R
## graphs of richness relationships with latitude

## load libraries
library(tidyverse)

## build dataframe
latitude <- seq(1, 90, 1)
decrease_species <- -1 * latitude + 100
increase_species <- 1 * latitude + 100
umbrella_species <- -1 * latitude * latitude + 90 * latitude + 100

latitude_species_df <- as.data.frame(cbind(latitude, decrease_species, increase_species, umbrella_species))

## make graphs
decrease_species_graph <- ggplot(data = latitude_species_df,
                                 aes(x = latitude, y = decrease_species/decrease_species[45])) +
  theme(legend.position = "right", 
        legend.text=element_text(size=15),
        legend.title=element_text(size=15),
        axis.title.y=element_text(size=rel(2.5), colour = 'black'),
        axis.title.x=element_text(size=rel(2.5), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        #axis.text.y=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = 'transparent', colour = 'black'),
        plot.background = element_rect(fill='transparent', color=NA),
        panel.grid.major = element_line(colour = "transparent")) +
  geom_line(linewidth = 3, color = 'Black') +
  scale_x_continuous(breaks = seq(0, 90, 30)) +
  xlim(0,100)+
  xlab(expression('Abs. latitude (°)')) +
  ylab(expression('Species'))

increase_species_graph <- ggplot(data = latitude_species_df,
                                 aes(x = latitude, y = increase_species/increase_species[45])) +
  theme(legend.position = "right", 
        legend.text=element_text(size=15),
        legend.title=element_text(size=15),
        axis.title.y=element_text(size=rel(2.5), colour = 'black'),
        axis.title.x=element_text(size=rel(2.5), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        #axis.text.y=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = 'transparent', colour = 'black'),
        plot.background = element_rect(fill='transparent', color=NA),
        panel.grid.major = element_line(colour = "transparent")) +
  geom_line(linewidth = 3, color = 'Black') +
  scale_x_continuous(breaks = seq(0, 90, 30)) +
  xlim(0,100)+
  xlab(expression('Abs. latitude (°)')) +
  ylab(expression('Species'))

umbrella_species_graph <- ggplot(data = latitude_species_df,
                                 aes(x = latitude, y = umbrella_species/umbrella_species[45])) +
  theme(legend.position = "right", 
        legend.text=element_text(size=15),
        legend.title=element_text(size=15),
        axis.title.y=element_text(size=rel(2.5), colour = 'black'),
        axis.title.x=element_text(size=rel(2.5), colour = 'black'),
        axis.text.x=element_text(size=rel(2), colour = 'black'),
        #axis.text.y=element_text(size=rel(2), colour = 'black'),
        axis.text.y=element_blank(),
        panel.background = element_rect(fill = 'transparent', colour = 'black'),
        plot.background = element_rect(fill='transparent', color=NA),
        panel.grid.major = element_line(colour = "transparent")) +
  geom_line(linewidth = 3, color = 'Black') +
  xlim(0, 90) +
  scale_x_continuous(breaks = seq(0, 90, 30)) +
  xlab(expression('Abs. latitude (°)')) +
  ylab(expression('Species'))

## print figures
pdf('../plots/decrease_species_graph.pdf',
     width = 6, height = 6)
plot(decrease_species_graph)
dev.off()

pdf('../plots/increase_species_graph.pdf',
    width = 6, height = 6)
plot(increase_species_graph)
dev.off()

pdf('../plots/umbrella_species_graph.pdf',
    width = 6, height = 6)
plot(umbrella_species_graph)
dev.off()



