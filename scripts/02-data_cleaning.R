#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers.
# Author: Ruiying Li
# Date: 24 September 2024 [...UPDATE THIS...]
# Contact: ruiying.li@mail.utoronto.ca
# License: MIT
# Pre-requisites:None
# Any other information needed?

#### Workspace setup ####
library(tidyverse)

raw_data <- read.csv("data/raw_data/raw_data.csv")

#cleaning data
cleaned_data<-raw_data |>
   janitor::clean_names() |> 
   separate(col = dates,
           into = c("year", "month"),
           sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
         
  )

 #### Save data ####
write.csv(cleaned_data, "data/analysis_data/analysis_data.csv")

