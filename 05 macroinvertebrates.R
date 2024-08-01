



# --------------------------------------------------------
# Macroinvertebrates from Prieta B
# Date: Wed Jul 31 2024 19:04:40
# Pablo E. Gutierrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# --------------------------------------------------------




macroinv <- read_xlsx("data/all_variables.xlsx", sheet = "macroinvertebrate_QPB")
head(macroinv)


macroinv$date <-as.POSIXct(macroinv$date,"%Y-%m-%d",tz = "UTC")
start_date <- as.POSIXct("2009-08-01", tz = "UTC")  # Start date
end_date <- as.POSIXct("2019-08-01", tz = "UTC")    # End date


macroinv$SE = as.numeric(macroinv$SE)




macroinvert <- ggplot(macroinv, aes(x=date,y=Abundance)) +
  geom_line(linetype = "dotted", colour = "#ce1256") +  # Add dotted line
  geom_point(colour = "#ce1256", size = 2) +
  
  geom_errorbar(aes(ymax=Abundance+SE, ymin=Abundance-SE), na.rm=TRUE, position="dodge",
                colour = "#ce1256") +
  
  xlab('Sampling event (2009-2019)')+ 
  ylab("Abundance ("*~ind~m^-2*")") +
  
  # ylim(0,20000)+
  scale_x_datetime(
    limits = c(start_date, end_date),  # Set the start and end dates
    date_breaks = "1 year", # Set breaks to one year
    date_labels = "%Y" # Format the labels as years
  ) +
  
  theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis y
  
  theme_classic() 

macroinvert
