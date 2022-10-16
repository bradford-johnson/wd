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
    geom_line() +
    geom_smooth(method = "lm", se = FALSE, color = "red") +
    scale_y_continuous(labels = scales::percent_format(accuracy = 0.01)) +
    labs(title = "Ball Edit % Trends",
      x = "",
      y = "Ball Edit %") +
    theme_classic()

# average ball edit percent - month
  tg_df %>%
    mutate(month = month(date, label = TRUE, abbr = TRUE)) %>%
    group_by(month) %>%
    summarise(avg_edit_percent = mean(percent_edit)) %>%
    ggplot(aes(x = month, y = avg_edit_percent, fill = avg_edit_percent)) +
    geom_col() +
    scale_y_continuous(labels = scales::percent_format(accuracy = 0.01)) +
    labs(title = "Monthly Average: Ball Edit %",
         x = "",
         y = "") +
    theme_classic() +
    theme(legend.position = "none")