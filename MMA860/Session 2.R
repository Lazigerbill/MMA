library(tidyverse)
library(dplyr)
library(readxl)

df <- read_excel("/Users/localadmin/Downloads/MMA_860_Grocery_Data1.xlsx")

glimpse(df)

q1_df <- select(df, Grocery_Bill, Distance_to_Store)
glimpse(q1_df)
	
ggplot(q1_df, aes(y=Grocery_Bill, x=Distance_to_Store)) + geom_point() + labs(title="Grocery Bill vs Distance to Store")


q2_df <- select(df, Family_Income, N_Adults)
q2_df$N_Adults <- as.factor(q2_df$N_Adults)
glimpse(q2_df)
ggplot(q2_df, aes(y=Family_Income, x=N_Adults)) + geom_boxplot() + labs(title="Family Income vs Number of Adults") + stat_summary(fun.y=mean, geom="point", shape=23, size=4)
