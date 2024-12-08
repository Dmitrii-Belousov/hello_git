url <- "https://raw.githubusercontent.com/yoursdearboy/ib-2024-git/refs/heads/main/data/billboard100.csv"

httr::GET(url, httr::write_disk("billboard.csv", overwrite = TRUE))

library(readr)
library(dplyr)

top200 <- read.csv("billboard.csv")

top10 <- top200 %>% 
  group_by(Date) %>% 
  filter(row_number() <= 10) %>% 
  ungroup()

top10 %>% 
  write_csv("billboard_top10.csv")
