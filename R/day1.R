library(tidyverse)

day1 <- read_table("data/day1.txt", col_names = F)

# Part 1
part1 <- day1 %>%
  pull(X1) %>%
  sum()

part1

# Part 2
part2 <- day1 %>%
  pull(X1) %>%
  rep(500) %>%
  cumsum() %>%
  .[which(duplicated(.))] %>%
  .[1]

part2  
