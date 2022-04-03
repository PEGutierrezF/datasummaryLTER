




setwd("D:/Curriculum/14_ Colaboracion/R help/Elena/")

canopy <- "D:/LTER/24 data summary/datasummaryLTER/data/all_variables.xlsx"
excel_sheets(path = canopy)

canopyop <- read_excel(path = canopy, sheet = "canopy")


canopyop$date <-as.POSIXct(canopyop$date,"%Y-%m-%d",tz = "UTC")


canopyop$sd = as.numeric(canopyop$sd)

c <- ggplot(canopyop, aes(x=date,y=value, colour=stream)) +
  geom_line(size=0.8) + 
  scale_color_manual(values=c('#ce1256','#0570b0'))+
  geom_point() +
  geom_errorbar(aes(ymax=value+sd, ymin=value-sd), na.rm=TRUE, 
                #position = position_dodge(width = 0.9),stat = "identity", 
                width = 0, colour = "gray50") +
  # Labels
  labs(x= '', y= 'Canopy openness (%)') +
 # labs(tag = "B") +
  
  theme_bw()+
  theme(legend.position="none")  +
  ylim(0,100)+
  #Axis  
  theme(axis.title.x = element_text(size = 12, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 12, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=10, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=10, vjust=0.5, color="black"))  #subaxis y
c

c1 <- c + annotate("rect", xmin = as.POSIXct("2017-09-6"), xmax = as.POSIXct("2017-09-21"), 
                   ymin = -Inf, ymax = Inf,  fill = "#df65b0", alpha=.5) +
  
  geom_segment(aes(x = as.POSIXct(c("2017-02-01")), y = 77, xend = as.POSIXct(c("2017-02-01")), yend = 69), 
               arrow = arrow(length = unit(0.2, "cm")),size = 1, color = "black") +
  
  geom_segment(aes(x = as.POSIXct(c("2017-11-30")), y = 77, xend = as.POSIXct(c("2017-11-30")), yend = 69), 
               arrow = arrow(length = unit(0.2, "cm")),size = 1, color = "black") +
  
  geom_segment(aes(x = as.POSIXct(c("2018-06-01")), y = 77, xend = as.POSIXct(c("2018-06-01")), yend = 69), 
               arrow = arrow(length = unit(0.2, "cm")),size = 1, color = "black") +
  
  geom_segment(aes(x = as.POSIXct(c("2019-02-01")), y = 77, xend = as.POSIXct(c("2019-02-01")), yend = 69), 
               arrow = arrow(length = unit(0.2, "cm")),size = 1, color = "black")

c1
