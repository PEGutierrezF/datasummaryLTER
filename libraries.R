

install.packages("xlsx")

libraries <- c( "ggplot2", "plyr","dplyr", 'patchwork','tidyverse',
                "readxl")
lapply(libraries, require, character.only = TRUE)
