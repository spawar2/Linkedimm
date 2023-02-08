install.packages("plotly")
install.packages("tidyverse")
install.packages("htmlwidgets")
library(plotly)
library(tidyverse)
library(htmlwidgets)

scatterPlot <- Sample_Data %>% 
  ggplot(aes(x = s.accession, y = p.age, colour = p.gender)) + 
  geom_point() + 
  labs(x = "Study Accession Number", 
       y = "Subject Age", colour = "") +
  geom_hline(yintercept=0, linetype="dashed", color = "#2C528C", size=0.5) +
  theme(legend.position="bottom") 

ggplotly(scatterPlot)
  
p <- ggplot(Sample_Data, aes(x=factor(1), fill=p.gender))+
  geom_bar(width = 1)+
    labs(x = "", 
       y = "", colour = "") +
theme(plot.margin = margin(4,0.5,4,0.5, "cm"),axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()
,axis.text.x = element_text(angle = 0, face = "italic", color = "blue", size = 10),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
panel.background = element_blank(),legend.title = element_blank())+
coord_polar("y")
  
q <- ggplot(Sample_Data, aes(x=factor(1), fill=p.race))+ geom_bar(width = 1)+ labs(x = "", y = "", colour = "") + theme(plot.margin = margin(4,0.5,4,0.5, "cm"),axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(), axis.text.x = element_text(angle = 0, face = "italic", color = "blue", size = 10),panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),legend.title = element_blank())+ coord_polar("y")

require(gridExtra)
grid.arrange(p,q, ncol=2)

