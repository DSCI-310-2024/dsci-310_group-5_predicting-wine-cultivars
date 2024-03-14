# author: Group 5
# date: March 13 2024

"This script cleans the wine data and then calculates summary statistics
for all numeric columns or a specified subset of columns.

Usage: 02_clean_and_preprocess_then_analyze.R [--columns=<cols>]
Options:
--columns=<cols>  Comma-separated list of columns to analyze [default: all].

" -> doc

library(tidyverse)
library(docopt)

opt <- docopt(doc)

main <- function(columns) {
  data_path <- 'data/wine.data'
  
  # Define the column names
  col_names <- c("cultivar", "alcohol", "malic_acid", "ash", "alcalinity_of_ash", "magnesium", 
                 "total_phenols", "flavanoids", "nonflavanoid_phenols", "proanthocyanins", 
                 "color_intensity", "hue", "OD280_OD315_of_diluted_wines", "proline")
  
  # Read the data
  data <- read_csv(data_path, col_names = col_names, col_types = cols(.default = col_double(), cultivar = col_factor()))
  
  # Clean the data (remove rows with missing values)
  data <- drop_na(data)
  
  # If 'columns' argument is 'all', set columns to all numeric columns
  if (columns == "all") {
    columns <- col_names[-1]  # Exclude 'cultivar' which is categorical
  } else {
    columns <- str_split(columns, pattern = ",", simplify = TRUE) %>%
               unlist() %>%
               trimws()  # Trim whitespace
  }
  
  # Calculate and print summary statistics for specified columns
  data %>%
    select(all_of(columns)) %>%
    summarise(across(everything(), list(mean = ~mean(.x, na.rm = TRUE),
                                        sd = ~sd(.x, na.rm = TRUE),
                                        min = ~min(.x, na.rm = TRUE),
                                        max = ~max(.x, na.rm = TRUE)))) %>%
    print()
}

# Default columns to 'all' if not specified
main(opt$columns %||% "all")
