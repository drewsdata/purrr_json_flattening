library(tidyverse)
library(httr)

url <- "https://github.com/gratalis/purrr_json_flattening/raw/70183081bea9b4ec7611f612a84b43d2495b8400/example_nested_list.rds"
GET(url, write_disk("example_nested_list.rds", overwrite=TRUE))
example_nested_list <- readRDS("example_nested_list.rds")

df_example_list_values <- example_nested_list %>%
  { 
    tibble(
      app_id = map_chr(.,"id"),
      app_name = map_chr(.,"name"),
      app_label = map_chr(.,"label"),
      app_status = map_chr(.,"status"),
      app_created = map_chr(.,"created"),
      app_org = map_chr(., c(12,1,1,1), .null = NA_character_),
      app_links = map_dfc(.,c(13,3), .null = NA_character_))
  }
