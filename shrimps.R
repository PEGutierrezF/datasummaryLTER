

shrimps <- read.csv("data/shrimp.csv")
head(shrimps)

sh1 <- shrimps %>%
  group_by(stream, year, Month) %>% 
  summarise(mean = mean(Abundance, na.rm=T),
            sd = sd(Abundance, na.rm = T)) %>%
  arrange(year, match(Month, month.name))
sh1

#df$Year_Month <- paste0(df$Month, " ", df$Year)

sh.a <- filter(sh1, stream=="QPB")  %>% rowid_to_column(var='observation') 
sh.b <- filter(sh1, stream=="QPA")  %>% rowid_to_column(var='observation')

qpa <- ggplot(sh.a, aes(x=observation , y=mean)) + 
  geom_line() +
  geom_point()+
  theme_classic()

qpb <- ggplot(sh.b, aes(x=observation , y=mean)) + 
  geom_line() +
  geom_point()+
  theme_classic()

qpa/qpb


write.csv(sh.a, "qpa_shrimps.csv")
write.csv(sh.b, "qpb_shrimps.csv")
