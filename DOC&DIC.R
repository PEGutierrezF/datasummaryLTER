



# ---------------------------------------------
# DOC and DIC from QPA and QPB
# 22 Sep 2021
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



Carbon=read.csv("data/DOC_DIC.csv")
Carbon

Carbon$date <-as.POSIXct(Carbon$date,"%Y-%m-%d",tz = "UTC")

ggplot(Carbon, aes(x=date, y=variables, group=stream))
       
