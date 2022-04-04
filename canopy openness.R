



# ---------------------------------------------
# Canopy cover
# 03 Apr 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



canopy <- "D:/LTER/24 data summary/datasummaryLTER/data/all_variables.xlsx"
excel_sheets(path = canopy)
canopyop <- read_excel(path = canopy, sheet = "canopy")

canopyop$date <-as.POSIXct(canopyop$date,"%Y-%m-%d",tz = "UTC")
canopyop$sd = as.numeric(canopyop$sd)


figure.canopy <- ggplot(canopyop, aes(x=date,y=value, colour=stream)) +
  geom_line(size=0.8) + 
  scale_color_manual(name = "Streams" ,
                     labels = c("Priea A", "Prieta B"),
                     values=c('#ce1256','#0570b0'))+
  geom_point() +
  geom_errorbar(aes(ymax=value+sd, ymin=value-sd), na.rm=TRUE, 
                #position = position_dodge(width = 0.9),stat = "identity", 
                width = 0, colour = "gray50") +
  # Labels
  labs(x= 'Year', y= 'Canopy openness (%, SD)') +

  theme_bw()+
  
  #Legend 
  theme(legend.key.size = unit(0.6, "cm"))+
  theme(legend.title=element_text(size=14)) + # legend title size
  theme(legend.text = element_text(color = "black", size = 16))+  #factor name 
  theme(legend.position=c(0.85, 0.9)) +
  #theme(legend.title=element_blank()) +
  theme(legend.text=element_text(size=14)) +  

  ylim(0,100)+
  #Axis  
  theme(axis.title.x = element_text(size = 16, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 16, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=14, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=14, vjust=0.5, color="black"))  #subaxis y

figure.canopy

ggsave("Canopy openness.jpeg", path = "figures", figure.canopy, width = 200, height = 180, units = "mm")
