# author: Group 5
# date: March 13 2024

"This script calculates the mean for a specified column
from wine.data.

Usage: 01_download_data.R  

" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function() { 
  # read in data
  data <- read_csv("https://raw.githubusercontent.com/DSCI-310-2024/dsci-310_group-5_predicting-wine-cultivars/main/data/wine.csv")
  write_csv(data,"data/wine_data.csv")
}

main()