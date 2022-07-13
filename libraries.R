



install.packages("mice")

libraries <- c( "ggplot2", "plyr","dplyr", 'patchwork','tidyverse',
                "readxl", "mice")

lapply(libraries, require, character.only = TRUE)
