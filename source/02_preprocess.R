# author: Group 5
# date: March 13 2024

"This script cleans the wine data and then calculates summary statistics
for all numeric columns.

Usage: 02_preprocess.R --input_dir=<input_dir> --output_dir=<output_dir> 

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
  
  # Read the data
  data <- read_csv(input_dir)
  
  # Calculate and print summary statistics for specified columns
  summary_stats <- data %>%
    select(alcohol:proline) %>%
    summarise(across(everything(), list(mean = ~mean(.x, na.rm = TRUE),
                                        sd = ~sd(.x, na.rm = TRUE),
                                        min = ~min(.x, na.rm = TRUE),
                                        max = ~max(.x, na.rm = TRUE))))

  write_csv(summary_stats, file.path(output_dir, "summary_stats.csv"))  
}


main(opt[["--input_dir"]], opt[["--output_dir"]])  