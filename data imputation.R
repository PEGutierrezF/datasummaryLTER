



# ---------------------------------------------
# Data imputation:  Stable isotopes Prieta A
# 12 Jul 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



# cleans global environment
rm(list = ls())



network.data <- "data/data.imp.xlsx"
excel_sheets(path = network.data)


# Source imputation Prieta A ----------------------------------------------

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



# Source imputation Prieta B ----------------------------------------------



sourcesQPB <- read_excel(path = network.data, sheet = "sourcesQPB")

# Remove characters columns 
sourcesQPB_new <- sourcesQPB %>% select(-date, -month)
# check class
sapply(sourcesQPB_new, class)

# add NA to empty cells
sourcesQPB_new[sourcesQPB_new == ""] <- NA
# convert in data.frame
sourcesQPB_new <- as.data.frame(sourcesQPB_new)

set.seed(14) # start in the same place, same results
sourcesQPB_imp <- missForest(sourcesQPB_new, verbose = T)

#check imputed values
PrietaB_imp <- sourcesQPB_imp$ximp


# NRMSE is normalized mean squared error. 
# check imputation error
sourcesQPB_imp$OOBerror

# Continuous variables are imputed with 9% error

write.xlsx(PrietaB_imp,"D:/LTER/24 data summary/datasummaryLTER/PrietaB.xlsx")


