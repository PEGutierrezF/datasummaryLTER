



# ---------------------------------------------
# Data imputation:  Stable isotopes
# 12 Jul 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  


sourcesQPA <- read.csv("data/sourcesQPA.csv")
head(sourcesQPA)


sourcesQPA_imp <- mice(sourcesQPA, m = 100,  seed=14)
summary(sourcesQPA_imp)

complete(sourcesQPA_imp)
