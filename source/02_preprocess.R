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

# call in the functions that we created for this script
source("R/calc_stats.R")
source("R/create_output_dir.R")

# specify the variables
opt <- docopt(doc)

main <- function(input_dir, output_dir) {
    # call function to create output directory if it doesnt exist
    data <- create_output_dir(input_dir, output_dir)

    # call function calculating summary statistics 
    stats <- summarize_all(data) 

    # write the statistics dataframe to a csv file 
    write_csv(stats, file.path(output_dir, "summary_stats.csv")) 
}
main(opt[["--input_dir"]], opt[["--output_dir"]])
