

## ------------------------------------------------------------------------
library("dplyr")
library("tidyr")

## ------------------------------------------------------------------------
refine_original <- read.csv("titanic_original.csv")
dt_fr <- data.frame(refine_original)

## ------------------------------------------------------------------------
titanic_table<-dplyr::tbl_df(dt_fr)

## ---- echo = FALSE-------------------------------------------------------
titanic_table
names(titanic_table)
glimpse(titanic_table)

## ------------------------------------------------------------------------
titanic_table$embarked
levels(titanic_table$embarked)
summary(titanic_table$embarked)

## ------------------------------------------------------------------------
titanic_table <- titanic_table %>% 
  mutate(embarked = factor(embarked, labels=c('S','C','Q','S'))) %>%       
  mutate(embarked = factor(embarked, labels=c('S','C','Q')))

summary(titanic_table$embarked)

## ------------------------------------------------------------------------
summarise(titanic_table,avg_age =mean(age, na.rm=TRUE))

## ------------------------------------------------------------------------
titanic_table <- titanic_table %>% replace_na(list(age = 29.88113))

## ------------------------------------------------------------------------
titanic_table$boat
summary(titanic_table$boat)      

## ------------------------------------------------------------------------
fct =levels(titanic_table$boat)
fct
fct[1]='NA'
titanic_table <- titanic_table %>%  
mutate(boat = factor(boat, labels=fct))
summary(titanic_table$boat) 

## ------------------------------------------------------------------------
summary(titanic_table$cabin)

## ------------------------------------------------------------------------
titanic_table <-mutate( titanic_table,has_cabin_number = as.integer(cabin != ''))
select(titanic_table,cabin, has_cabin_number)
## ------------------------------------------------------------------------
write.csv(titanic_table, file="titanic_clean.csv")

