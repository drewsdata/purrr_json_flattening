library(tidyverse)
library(here)

example_nested_list <- readRDS(here("example_nested_list.rds"))
df_example_list_values <- example_nested_list %>%
  { 
    tibble(
      app_id = map_chr(.,"id"),
      app_name = map_chr(.,"name"),
      app_label = map_chr(.,"label"),
      app_status = map_chr(.,"status"),
      app_created = map_chr(.,"created"),
      app_org = map_chr(., c(12,1,1,1), .null = NA_character_)) 
  }
