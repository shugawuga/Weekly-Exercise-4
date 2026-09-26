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
# Per the output, the default branch is main.


# --------------------------------------------------
# Question 7a Which countries had the largest delegation of athletes in 1992? 
#Create a tibble that contains only the variables country and athletes.
# --------------------------------------------------


# --------------------------------------------------
# Question 7a
# --------------------------------------------------

library(tidyverse)

olympics <- read_csv("Olympics.csv")

olympics_1992 <- olympics %>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  arrange(desc(athletes))

olympics_1992


# --------------------------------------------------
# Question 7b For the following five countries, plot the number of gold medals 
#earned over time: United States, France, Germany, Russia, and China.
# --------------------------------------------------

gold_medals_plot <- olympics %>%
  filter(country %in%
           c("United States",
             "France",
             "Germany",
             "Russia",
             "China")) %>%
  ggplot(aes(x = year,
             y = gold,
             color = country)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Gold Medals Through Time",
    x = "Year",
    y = "Gold Medals"
  )

gold_medals_plot


