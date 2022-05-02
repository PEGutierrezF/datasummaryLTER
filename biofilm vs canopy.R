



# ---------------------------------------------
# Relationship biofilm vs canopy
# 02 May 2022
# Pablo E. Gutiérrez-Fonseca
# pabloe.gutierrezfonseca@gmail.com
# ---------------------------------------------
#  


# Prieta A ----------------------------------------------------------------

 bio_QPA <- c(-31.6925, -26.31975, -28.02225, -27.87, -28.59, -28.66760874)
 canopy_QPA <- c(8.23, 65.72, 51.28, 32.59, 23.08, 16.81)
 df_QPA <- data.frame(bio_QPA, canopy_QPA)

 df_QPA.lm <- lm(bio_QPA ~ canopy_QPA, df_QPA)
 
 
 ggplot(df_QPA, aes(x=canopy_QPA, y=bio_QPA))+
   geom_point(size=4) +
   
   # Labels
   labs(x= 'Canopy openness (%)', y= expression(Biofilm ~ (delta^{13}*"C [\211]"))) +
   
   theme_bw()+
   #Axis  
   theme(axis.title.x = element_text(size = 16, angle = 0)) + # axis x
   theme(axis.title.y = element_text(size = 16, angle = 90)) + # axis y
   theme(axis.text.x=element_text(angle=0, size=14, vjust=0.5, color="black")) + #subaxis x
   theme(axis.text.y=element_text(angle=0, size=14, vjust=0.5, color="black")) +  #subaxis y
 
   xlim(0,100) + ylim(-34,-24) +
   geom_abline(slope = coef(df_QPA.lm)[["canopy_QPA"]], 
               intercept = coef(df_QPA.lm)[["(Intercept)"]])
 
 
# Prieta B ----------------------------------------------------------------

 bio_QPB <- c(-34.37, -27.45175, -28.72525, -27.14533333, -27.59187158, -29.957374)
 canopy_QPB <- c(11.87, 52.43, 38.65, 31.14222222, 31.46, 20.88666667)
 df_QPB <- data.frame(bio_QPB, canopy_QPB)
 
 df_QPB.lm <- lm(bio_QPB ~ canopy_QPB, df_QPB)
 
 ggplot(df_QPB, aes(x=canopy_QPB, y=bio_QPB))+
   geom_point(size=4) +
   
   # Labels
   labs(x= 'Canopy openness (%)', y= expression(Biofilm ~ (delta^{13}*"C [\211]"))) +
   
   theme_bw()+
   #Axis  
   theme(axis.title.x = element_text(size = 16, angle = 0)) + # axis x
   theme(axis.title.y = element_text(size = 16, angle = 90)) + # axis y
   theme(axis.text.x=element_text(angle=0, size=14, vjust=0.5, color="black")) + #subaxis x
   theme(axis.text.y=element_text(angle=0, size=14, vjust=0.5, color="black")) +  #subaxis y
   
   xlim(0,100) + ylim(-35,-24) +
   geom_abline(slope = coef(df_QPA.lm)[["canopy_QPA"]], 
               intercept = coef(df_QPA.lm)[["(Intercept)"]])
 
