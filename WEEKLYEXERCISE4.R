# Load the package needed to identify the default Git branch
library(usethis)


#Check the default branch
git_default_branch()

#Per the output, the default branch is main

# --------------------------------------------------
# Question 6a Calculate a new variable, called ‘total.medals’
# --------------------------------------------------

library(tidyverse)
library(readr)
library(ggplot2)

olympics <- read_csv("Olympics.csv")
olympics <- olympics %>%
  mutate(total.medals = gold+silver+bronze)


# --------------------------------------------------
# Question 6b For each country, how many gold medals has it won?
# --------------------------------------------------

gold_by_country <- olympics %>%
  group_by(country) %>%
  summarise(total_gold = sum(gold, na.rm = TRUE))

gold_by_country


# --------------------------------------------------
# Question 6c For each year, how many total medals were given out?
# --------------------------------------------------

medals_by_year <- olympics %>%
  group_by(year) %>%
  summarise(
    total_medals = sum(gold + silver + bronze,
                       na.rm = TRUE)
  )



medals_by_year


