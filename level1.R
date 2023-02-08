#args <- commandArgs(TRUE)
library(plotly)
library(tidyverse)
haiStudy <- read.csv("/Users/yalegenomecenter/Desktop/level2hini.csv")

#studyaccession<-args[1]

str(haiStudy)
p <- ggplot(filter(haiStudy, b1.timepoint == 0),
            aes(x = p.accession, y = as.numeric(r1.value),
                fill = factor(b1.timepoint, levels = c(0)))) +
  guides(fill=guide_legend(title="Time Points (In Days)"))+
  
  xlab("Study Accession")+ylab("Subject Age")+
  geom_boxplot(color="blue", fill="black", alpha=0.2) +
  theme(axis.text.x = element_text(angle = 90, face = "italic", color = "blue", size = 7),panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),axis.text.y = element_text(color = "blue")) +
  #facet_grid(r1.strain~.)
  facet_wrap(r1.strain~., ncol=1)

p
