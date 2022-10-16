# load packages
library(tidyverse)
library(lubridate)
library(janitor)
library(readxl)
library(scales)

# load data
tg_df <- read_excel("tg-data.xlsx", "tg-data") %>%
  clean_names()

tg_df$date <- excel_numeric_to_date(tg_df$date)

# [Apr 1st - Oct 14 2022] - percent edit plot
tg_df %>%
  ggplot(aes(x = date, y = percent_edit)) +
  geom_area() +
  geom_smooth(method = "lm") +
  scale_y_continuous(labels = scales::percent_format(accuracy = 0.01)) +
  labs(title = "Game Health",
        subtitle = "Ball Edits",
        x = "",
        y = "Ball Edit %") +
  theme_classic()
#test