



# ---------------------------------------------
# Libraries
# 13 Jul 2022
# Pablo E. Guti�rrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



# cleans global environment
rm(list = ls())

install.packages("gganimate")

libraries <- c( "ggplot2", "plyr","dplyr", 'patchwork','tidyverse',
                "readxl", "missForest", "readxl",'xlsx','gganimate')

lapply(libraries, require, character.only = TRUE)


