# author: Group 5
# date: March 13 2024

"This script calculates the mean for a specified column
from wine.data.

Usage: calculate_wine_col_mean.R <var>
" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(var) {
  # path to the wine dataset
  data_path <- 'data/wine.data'
  
  # read in data

  col_names <- c("cultivar","alcohol","malic_acid", "ash", "alcalinity_of_ash", "magnesium", 
                 "total_phenols", "flavanoids", "nonflavanoid_phenols", "proanthocyanins", 
                 "color_intensity", "hue", "OD280_OD315_of_diluted_wines", "proline")
  data <- read_csv(data_path, col_names = col_names)

  # Ensure the column exists in the dataset
  if (!var %in% names(data)) {
    stop("The specified variable does not exist in the dataset.")
  }
  
  # print out statistic of variable of interest
  out <- data |>
    pull(!!sym(var)) |>
    mean(na.rm = TRUE)
  print(out)
}

main(opt$var)
