



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

sourcesQPA_new <- sourcesQPA %>% select(-month)

set.seed(14)
sourcesQPA_imp <- missForest(sourcesQPA_new)

#check imputed values
sourcesQPA_imp$ximp


# NRMSE is normalized mean squared error. 
# check imputation error
sourcesQPA_imp$OOBerror

#Continuous variables are imputed with 4% error

