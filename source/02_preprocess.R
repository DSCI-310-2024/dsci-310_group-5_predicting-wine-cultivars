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
library(predictcultivar)


# specify the variables
opt <- docopt(doc)

main <- function(input_dir, output_dir) {
    # call function to create output directory if it doesnt exist
    create_output_dir(output_dir)
  
    # read and factor the data
    data <- read_and_factor(input_dir)

    # call function calculating summary statistics 
    stats <- calc_stats(data) 

    # write the statistics dataframe to a csv file 
    write_csv(stats, file.path(output_dir, "summary_stats.csv")) 
}
main(opt[["--input_dir"]], opt[["--output_dir"]])
