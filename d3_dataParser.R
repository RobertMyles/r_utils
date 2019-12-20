library(rvest); library(strex); library(dplyr); library(tidyr)

d3 <- read_html("https://raw.githubusercontent.com/observablehq/datasets/master/aapl/index.js") %>% 
  html_text()

value <- str_after_first(d3, "close = \\[") %>% str_before_first("\\]") %>% 
  str_extract_numbers(decimals = TRUE) %>% unlist()

date <- str_after_first(d3, "date = \\[") %>% str_before_first("];") %>% 
  str_replace_all("\\[", replacement = "'") %>%
  str_replace_all("\\]", replacement = "'") %>%
  str_split("'") %>% unlist() %>% 
  #str_replace_all(",", replacement = "-") %>% 
  as.list() %>% purrr::discard(.p = function(x) x < 1) %>% 
  unlist()

df <- tibble(date = date, value = value) %>% 
  separate(date, into = c("year", "month", "day"), sep = ",") %>% 
  mutate(month = as.numeric(month),
         month = month - 1, # JS 0-index
         month = ifelse(nchar(month) < 2, paste0("0", month), month),
         day = ifelse(nchar(day) < 2, paste0("0", day), day),
         date = paste(year, month, day, sep = ",")) %>% 
  select(date, value)
