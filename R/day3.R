library(tidyverse)

day3 <- read_lines("data/day3.txt")

claims <- day3 %>%
  str_split("\\s?[@,:x]\\s?", simplify = T) %>%
  as_tibble() %>%
  select(id = V1, left = V2, top = V3, row = V4, col = V5) %>%
  mutate_all(parse_number) %>%
  mutate(
    claim = pmap(list(left, top, row, col), function(x, y, r, c) {
      crossing(row_val = x+seq_len(r), col_val = y+seq_len(c)) %>%
        mutate(value = 1)
    })
  ) %>%
  select(id, claim) 

part1 <- claims %>%
  unnest() %>%
  group_by(row_val, col_val) %>%
  summarize(total = sum(value)) %>%
  filter(total > 1) %>%
  nrow()

part2 <- claims %>%
  mutate(len = map_int(claim, nrow)) %>%
  unnest() %>%
  add_count(row_val, col_val) %>%
  group_by(id, len) %>%
  summarise(claim_total = sum(n)) %>%
  filter(len == claim_total) %>%
  pull(id)

