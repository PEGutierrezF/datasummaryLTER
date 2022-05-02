



# ---------------------------------------------
# Leaf litter data imputation
# 15 Apr 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  



library(missForest)

leafinputation <- "D:/LTER/24 data summary/datasummaryLTER/data/all_variables.xlsx"
excel_sheets(path = leafinputation)
dataImp <- read_excel(path = leafinputation, sheet = "leafInputate")

plotA <- dataImp[ , c(4,7,9,11)]
plotA1 <- plotA[c(1:24), ]
plotA1 <- as.data.frame(plotA1)


imp.f.pA <- missForest(plotA1, maxiter = 10, ntree = 100,
                       variablewise = TRUE,decreasing = FALSE, 
                       verbose = FALSE, replace = TRUE,
                       classwt = NULL, cutoff = NULL, strata = NULL,
                       sampsize = NULL, nodesize = NULL, maxnodes = NULL,
                       xtrue = NA, parallelize = "no")

dataimput <- imp.f.pA$ximp
dataimput

summary(dataimput)
plot(dataimput$value,type="l")


par(mfrow=c(2,1))
plot(plotA1$value,type="l")
plot(plotA1$meanA,type="l")

