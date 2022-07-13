



install.packages("mice")

libraries <- c( "ggplot2", "plyr","dplyr", 'patchwork','tidyverse',
                "readxl", "missForest")

lapply(libraries, require, character.only = TRUE)
