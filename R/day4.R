library(tidyverse)
# library(lubridate)

day4 <- read_lines("data/day4.txt")

"[1518-07-05 00:03] Guard #1741 begins shift" %>%
  str_extract(pattern = "#([0-9]+)") %>%
  parse_number()

  
"[1518-07-05 00:03] begins shift" %>%
  str_match(pattern = "\\] ([a-z ]+)$") %>%
  .[, 2, drop = T]

day4 %>%
  as_tibble() %>%
  mutate(
    id = str_extract(value, "#([0-9]+)") %>% parse_number(),
    minute = str_match(value, ":([0-9]+)") %>% .[, 2, drop = T],
    status = str_match(value, "\\] ([a-z ]+)$") %>% .[, 2, drop = T],
    shift = cumsum(status %in% "falls asleep")
  ) %>%
  fill(id) %>%
  filter(!is.na(status))
  
