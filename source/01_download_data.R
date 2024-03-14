# author: Group 5
# date: March 13 2024

"This script calculates the mean for a specified column
from wine.data.

Usage: 01_download_data.R --input_dir=<input_dir> --output_dir=<output_dir> 

Options:
--input_dir=<input_dir>		Path (including filename) to raw data
--output_dir=<output_dir>		Path to directory where the results should be saved

" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }

  # read in data
  col_names <- c("cultivar","alcohol","malic_acid", "ash", "alcalinity_of_ash", "magnesium", 
                 "total_phenols", "flavanoids", "nonflavanoid_phenols", "proanthocyanins", 
                 "color_intensity", "hue", "OD280_OD315_of_diluted_wines", "proline")
  data <- read_csv(output_dir, col_names = col_names)

  # Get the variable of interest from the user
  var <- "alcohol"
  # <- readline("Enter the variable to calculate statistics for: ")

  # Ensure the column exists in the dataset
  if (!var %in% names(data)) {
    stop("The specified variable does not exist in the dataset.")
  }
  
  # print out statistic of variable of interest
  var_stats <- data |>
    pull(!!sym(var)) |>
    mean(na.rm = TRUE)
  write_csv(var_stats, file.path(output_dir, "variable_stats.csv"))
}

main(opt[["--input_dir"]], opt[["--output_dir"]])