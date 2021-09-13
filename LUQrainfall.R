




library("ggplot2")
library (tidyr)
library("extrafont")
library(tidyverse)
library("Hmisc")


precip.frm=read.csv("data/precipitation.csv")
attach(precip.frm)
precip.frm

stat_sum_df <- function(fun, geom="crossbar", ...) { 
  stat_summary(fun.data=fun, colour="blue", geom=geom, width=0.2, ...) 
} 

EV <- ggplot(precip.frm, aes(x= julian,y=mm, group=year)) + 
geom_line(lwd = 0.6) +
xlab("Julian Day") + ylab("Cumulative rainfall (mm)") +
ylim(c(0, 6000)) +
  xlim(0,366) +
  theme_bw() +
  
theme(axis.title.x = element_text(size = 18, angle = 0)) + # axis x
theme(axis.title.y = element_text(size = 18, angle = 90)) + # axis y
theme(axis.text.x=element_text(angle=0, size=16, vjust=0.5, color="black")) + #subaxis x
theme(axis.text.y=element_text(angle=0, size=16, vjust=0.5, color="black")) + #subaxis y

theme(axis.text=element_text(size=12),axis.title=element_text(size=14,face="bold"))+
geom_line(data=subset(precip.frm, year == "1994"), colour="darkorange", size=0.9) +
geom_line(data=subset(precip.frm, year == "2015"), colour="red", size=0.9) +
geom_line(data=subset(precip.frm, year == "2010"), colour="skyblue2", size=0.9)+
#geom_line(data=subset(precip.frm, year == "2022"), colour="mediumblue", size=1.3)+
  
annotate("text", x=35, y=5225, label= "2010", size = 6)+
annotate("segment", x = 0, xend = 20, y = 5200, yend = 5200, colour = "skyblue2", size = 2)+
  
annotate("text", x=80, y=5025, label= "2015 pan-Caribbean drought", size = 6) + 
annotate("segment", x = 0, xend = 20, y = 5000, yend = 5000, colour = "red", size = 2)+
  
annotate("text", x = 50, y=4825, label = "1994 drought", size = 6) +
annotate("segment", x = 0, xend = 20, y = 4800, yend = 4800, colour = "darkorange" ,size = 2)+

annotate("text", x = 63, y=4625, label = "Long-term Average", size = 6) +
annotate("segment", x = 0, xend = 20, y = 4600, yend = 4600, colour = "mediumblue", size = 2)+
  
annotate("text", x = 200, y=5700, label = "Cumulative Rainfall at El Verde Field Station  \n Puerto Rico, 1975-2021",
         colour = "black",size=6.5, fontface="bold") 

EV1 <- EV +  stat_summary(aes(group=1), fun=mean, geom="line", size=1, colour="blue")+
  stat_summary(fun.data = mean_cl_quantile, geom = "ribbon", size = 1, aes(group=1),alpha = 0.1)


mean_cl_quantile <- function(x, q = c(0.1, 0.9), na.rm = TRUE){
  dat <- data.frame(y = mean(x, na.rm = na.rm),
                    ymin = quantile(x, probs = q[1], na.rm = na.rm),
                    ymax = quantile(x, probs = q[2], na.rm = na.rm))
  return(dat)
}


#https://stackoverflow.com/questions/51993044/plot-time-series-with-ggplot-with-confidence-interval

EV + ggsave("Rain.jpeg",  width = 30, height = 20, units = "cm")
EV1 + ggsave("RainCI.jpeg",  width = 30, height = 20, units = "cm")



