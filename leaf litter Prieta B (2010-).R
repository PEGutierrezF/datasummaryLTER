



# UVM office
leaf <- "C:/Users/pgutierr/OneDrive - University of Vermont/LTER/24 data summary/datasummaryLTER/data/all_variables.xlsx"
# Personal
leaf <- "D:/LTER/24 data summary/datasummaryLTER/data/all_variables.xlsx"
excel_sheets(path = leaf)
leaflitter <- read_excel(path = leaf, sheet = "leaf_PB_2010")
head(leaflitter)


leaflitter$Week<-as.POSIXct(leaflitter$Week,"%Y-%m-%d",tz = "UTC")
start_date <- as.POSIXct("2010-11-01", tz = "UTC")  # Start date
end_date <- as.POSIXct("2021-12-31", tz = "UTC")    # End date

leaf <- ggplot(leaflitter,aes(x=Week,y=Mean)) +
  xlab('Sampling event (2010-2022)')+ ylab("Mean litter input rate ("*g~m^-2~d^-1*")") +
  geom_point(colour = "#0570b0", size = 2) +
  geom_errorbar(aes(ymax=Mean+SD, ymin=Mean-SD),na.rm=TRUE, position="dodge",
                colour = "#0570b0") +
  
  ylim(0,10)+
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

leaf
ggsave("Leaf Prieta 2010.jpeg", path = "figures", leaf, width = 250, height = 180, units = "mm")


highest_rows <- head(leaflitter[order(leaflitter$Mean, decreasing = TRUE), ], 6)
# Print the selected rows
print(highest_rows)



# Coefficient of Variation ------------------------------------------------
leaflitter$CoefVar <- (leaflitter$SD / leaflitter$Mean)*100


leaflitter$Week<-as.POSIXct(leaflitter$Week,"%Y-%m-%d",tz = "UTC")
start_date <- as.POSIXct("2010-11-01", tz = "UTC")  # Start date
end_date <- as.POSIXct("2021-12-31", tz = "UTC")    # End date

p <- ggplot(leaflitter,aes(x=Week,y=CoefVar)) +
  xlab('Sampling event (2010-2022)')+ ylab("Coefficient of variation") +
  geom_line(size = 0.5) +

   # ylim(0,10)+
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


# Convert 'Week' column to POSIXct format
leaflitter$Week <- as.POSIXct(leaflitter$Week, "%Y-%m-%d", tz = "UTC")

# Calculate Coefficient of Variation
leaflitter$CoefVar <- (leaflitter$SD / leaflitter$Mean) * 100

# Set start and end dates
start_date <- as.POSIXct("2010-11-01", tz = "UTC")  # Start date
end_date <- as.POSIXct("2021-12-31", tz = "UTC")    # End date

# Create the plot
p <- ggplot(leaflitter, aes(x = Week, y = CoefVar)) +
  xlab('Sampling event (2010-2022)') + ylab("Coefficient of variation") +
  geom_line(size = 0.5) +
  scale_x_datetime(
    limits = c(start_date, end_date),  # Set the start and end dates
    date_breaks = "2 year", # Set breaks to one year
    date_labels = "%Y" # Format the labels as years
  ) +
  theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
  theme(axis.text.x = element_text(angle = 0, size = 12, vjust = 0.5, color = "black")) + # subaxis x
  theme(axis.text.y = element_text(angle = 0, size = 12, vjust = 0.5, color = "black")) + # subaxis y
  theme_classic()
p
ggsave("Leaf Prieta 2010 CoeffVar.jpeg", path = "figures", p, width = 250, height = 180, units = "mm")



# inset plots -------------------------------------------------------------
library(cowplot)
plot.with.inset <-
  ggdraw() +
  draw_plot(leaf) +
  draw_plot(p, x = 0.67, y = .5, width = .3, height = .3)
plot.with.inset
# Can save the plot with ggsave()
ggsave("Inset.jpeg", path = "figures", plot.with.inset, width = 250, height = 180, units = "mm")



# gganimate ---------------------------------------------------------------
+ gganimate::transition_reveal(Week)
# Save at gif:
anim_save("287-smooth-animation-with-tweenr.gif")
