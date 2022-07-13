



# ---------------------------------------------
# Data imputation:  Stable isotopes
# 12 Jul 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



# cleans global environment
rm(list = ls())



network.data <- "data/data.imp.xlsx"
excel_sheets(path = network.data)

sourcesQPA <- read_excel(path = network.data, sheet = "sourcesQPA")

# Remove characters columns 
sourcesQPA_new <- sourcesQPA %>% select(-date, -month)
# check class
sapply(sourcesQPA_new, class)

# add NA to empty cells
sourcesQPA_new[sourcesQPA_new == ""] <- NA
# convert in data.frame
sourcesQPA_new <- as.data.frame(sourcesQPA_new)

set.seed(14) # start in the same place, same results
sourcesQPA_imp <- missForest(sourcesQPA_new, verbose = T)

#check imputed values
sourcesQPA_imp$ximp


# NRMSE is normalized mean squared error. 
# check imputation error
sourcesQPA_imp$OOBerror

# Continuous variables are imputed with 4% error

