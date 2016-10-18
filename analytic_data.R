library(tidyverse)
rawdata <- read_csv(file = "raw_data.csv")
rawdata <- read_csv(file = "raw_data.csv", na=c("","NA"))
categorical_variables <- select(rawdata,sex)
categorical_variables$sex <- as.factor(categorical_variables$sex)
levels(categorical_variables$sex) <-list("Male"=1, "Female"=2)
pos_affect_item <- select(rawdata,delighted,elated,enthusiastic,excited)
neg_affect_item <- select(rawdata,afraid,angry,anxious,ashamed)
Extraversion_item <-select(rawdata,Extraversion)
Neuroticism_item <-select(rawdata,Neuroticism)
View(Neuroticism_item)
psych::describe(pos_affect_item)
psych::describe(neg_affect_item)
psych::describe(Extraversion_item)
psych::describe(Neuroticism_item)
neg_affect_item
is_bad_value <- neg_affect_item<0|neg_affect_item>3
View(is_bad_value)
neg_affect_item[is_bad_value] <- NA
View(neg_affect_item)
na_affect <- psych::alpha(as.data.frame(neg_affect_item),check.keys = FALSE)$scores
pa_affect <- psych::alpha(as.data.frame(pos_affect_item),check.keys = FALSE)$scores
View(analytic_data)
save(analytic_data,file = "analytic_data.Rdata")
write_csv(analytic_data,path ="analytic_data.csv")