library(tidyverse)
library(widyr)

day2 <- read_table("data/day2.txt", col_names = F) %>%
  select(pattern = X1)

checksum <- function(x, n) {
  y <- x %>%
    str_split("", simplify = T) %>%
    table() %>%
    as.vector()
  return(sum(any(y == n)))
}

day2 %>%
  mutate(
    two = map_lgl(pattern, checksum, n = 2),
    three = map_lgl(pattern, checksum, n = 3)
  ) %>%
  summarize_at(vars(-starts_with("pattern")), sum) %>%
  mutate(
    product = two * three
  )

# Part 2

part2 <- day2 %>% pull(pattern)

common_chars <- function(x) {
  hamming <- stringdist::stringdistmatrix(x, x, "hamming")
  correct_idx <- which(hamming == 1) %% length(x) 
  # return(correct_idx)
  correct <- x[correct_idx] %>% str_split("")
  return(glue::glue_collapse(correct[[1]][-which(correct[[1]] != correct[[2]])]) %>% as.character())
}

# sometimes tidy methods dont work
# crossing(item1 = test, item2 = test) %>%
#   mutate(
#     hamming = map2_dbl(item1, item2, stringdist::stringdist, method = "hamming")
#   ) %>%
#   filter(hamming == 1) %>%
#   slice(1) %>%
#   mutate(
#     common = map2(item1, item2, function(x, y) {
#       c(x, y) %>% 
#         str_split("") 
#     })
#   )
