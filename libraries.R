



# ---------------------------------------------
# Libraries
# 13 Jul 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  

install.packages("xlsx")

libraries <- c( "ggplot2", "plyr","dplyr", 'patchwork','tidyverse',
                "readxl", "missForest", "readxl",'xlsx')

lapply(libraries, require, character.only = TRUE)
