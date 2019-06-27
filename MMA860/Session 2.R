library(tidyverse)
library(dplyr)
library(readxl)

# Load Excel data from Download folder
df <- read_excel("/Users/localadmin/Downloads/MMA_860_Grocery_Data1.xlsx")
glimpse(df)

# Question #1: Scatter plot with Grocery bill and distance to store
q1_df <- select(df, Grocery_Bill, Distance_to_Store)
glimpse(q1_df)
	
ggplot(q1_df, aes(y=Grocery_Bill, x=Distance_to_Store)) 
	+ geom_point() 
	+ labs(title="Grocery Bill vs Distance to Store")

# Question #2: Box Plot of family income broken out by number of adults
q2_df <- select(df, Family_Income, N_Adults)
q2_df$N_Adults <- as.factor(q2_df$N_Adults)
glimpse(q2_df)
ggplot(q2_df, aes(y=Family_Income, x=N_Adults)) 
	+ geom_boxplot() 
	+ labs(title="Family Income vs Number of Adults") 
	+ stat_summary(fun.y=mean, geom="point", shape=23, size=4)

# Question #3: Histogram of family income
q3_df <- select(df, Family_Income)
glimpse(q3_df)
hist(q3_df$Family_Income)

# Question #4: Bar chart showing the total sales by family size
q4_df <- select(df, Family_Size, Grocery_Bill)
glimpse(q4_df)
q4_df$Family_Size <- as.factor(q4_df$Family_Size)
by_fam_size <- group_by(q4_df, Family_Size)
agg_df <- summarise(by_fam_size, Grocery_Bill = sum(Grocery_Bill))
glimpse(agg_df)

ggplot(agg_df, aes(y=Grocery_Bill, x=Family_Size)) + geom_bar(stat = "identity") + labs(title="Total Sales vs Family Size") 

# Question #5: The best way to visualize family income, grocery bill and vergetariancs in one chart
q5_df <- select(df, Family_Income, Grocery_Bill, Vegetarian)
glimpse(q5_df)
by_veg <- group_by(q5_df, Vegetarian)
veg <- ggplot(q5_df, aes(x=Family_Income, y=Grocery_Bill)) + geom_point(aes(size=3, colour=as.factor(Vegetarian)))
veg
