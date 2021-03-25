

# ---------------------------------------------
# Data summary of Shrimp: Quebrada Prieta A and Prieta B 
# 20 Mar 2021
# Pablo E. Gutierrez-Fonseca
# ---------------------------------------------
#  


shrimps <- read.csv("data/shrimp.csv")
head(shrimps)

sh1 <- shrimps %>%
  group_by(stream, year, Month,day) %>% 
  summarise(mean = mean(Abundance, na.rm=T),
            sd = sd(Abundance, na.rm = T)) %>%
  arrange(year, match(Month, month.name))
sh1

unique(shrimps$Month)

sh.a <- filter(sh1, stream=="QPA")  %>% rowid_to_column(var='observation')
sh.a$date <-as.Date(with(sh.a,paste(year,Month,day,sep="-")),"%Y-%b-%d")


sh.b <- filter(sh1, stream=="QPB")  %>% rowid_to_column(var='observation')
sh.b$date <-as.Date(with(sh.b,paste(year,Month,day,sep="-")),"%Y-%b-%d")

qpa <- ggplot(sh.a, aes(x=date , y=mean)) + 
  geom_line() +
  geom_point()+
  theme_classic()

qpb <- ggplot(sh.b, aes(x=date , y=mean)) + 
  geom_line() +
  geom_point()+
  theme_classic()

qpa/qpb


write.csv(sh.a, "qpa_shrimps.csv")
write.csv(sh.b, "qpb_shrimps.csv")
