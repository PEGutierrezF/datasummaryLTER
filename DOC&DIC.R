



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
  geom_line() +
  facet_grid(~variable)
       

Carbon %>% group_by(stream) %>% summarise(Mean_sales = mean(value))


Carbon %>%
  dplyr::group_by(stream, variable) %>%
  dplyr::summarize(mean=mean(value, na.rm=TRUE), 
#  low = CI90lo(value), 
 # high= CI90hi(value),
  min=min(value, na.rm=TRUE),
  max=max(value,na.rm=TRUE), 
  sd= sd(value, na.rm=TRUE))

