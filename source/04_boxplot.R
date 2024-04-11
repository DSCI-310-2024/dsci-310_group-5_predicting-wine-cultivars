# author: Group 5
# date: March 13 2024

"This script creates a boxplot.

Usage: 04_boxplot.R --variable1=<variable1> --variable2=<variable2> --input_dir=<input_dir> --output_dir=<output_dir> 

Options:
--variable1=<variable1>     X Variable for plot
--variable2=<variable2>     Y Variable for the plot
--input_dir=<input_dir>		Path (including filename) to raw data
--output_dir=<output_dir>		Path to directory where the results should be saved

" -> doc

library(tidyverse)
library(docopt)
library(ggplot2)
library(predictcultivar)

opt <- docopt(doc)

main <- function(variable1, variable2, input_dir, output_dir) {
  # call function to create output directory if it doesnt exist
  create_output_dir(output_dir)
  
  # read and factor the data
  data <- read_and_factor(input_dir)
  
  box <- create_boxplot(data, variable1, variable2)

}

main(opt[["--variable1"]],opt[["--variable2"]],opt[["--input_dir"]], opt[["--output_dir"]])
