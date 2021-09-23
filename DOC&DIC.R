



# ---------------------------------------------
# DOC and DIC from QPA and QPB
# 22 Sep 2021
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



Carbon=read.csv("data/DOC_DIC.csv")
head(Carbon)

Carbon$date <-as.POSIXct(Carbon$date,"%Y-%m-%d",tz = "UTC")

ggplot(Carbon, aes(x=date, y=value, color =stream)) +
  geom_line(size=1.2) +
  facet_grid(~variable) +
  theme(strip.text = element_text(face="bold", size=16),
        strip.background = element_rect(fill="white", colour="black",size=1))
       


Carbon %>%
  dplyr::group_by(stream, variable) %>%
  dplyr::summarize(mean=mean(value, na.rm=TRUE), 
  min=min(value, na.rm=TRUE),
  max=max(value,na.rm=TRUE), 
  sd= sd(value, na.rm=TRUE))


a <- Carbon[c(1:118, 331:434), ]
a

a %>%
  dplyr::group_by(stream, variable) %>%
  dplyr::summarize(mean=mean(value, na.rm=TRUE), 
                   min=min(value, na.rm=TRUE),
                   max=max(value,na.rm=TRUE), 
                   sd= sd(value, na.rm=TRUE))

ggplot(a, aes(x=date, y=value, color =stream)) +
  geom_line(size=1.2) +
  ylim(0,6)

