# author: Group 5
# date: March 28 2024 

"This script generates scatterplot visualizations for the wine dataset.

Usage: 03_scatterplot.R --scatter1=<scatter1> --scatter2=<scatter2> --input_dir=<input_dir> --output_dir=<output_dir>

Options:
  --scatter1=<scatter1>           Variable 1 for scatter plot.
  --scatter2=<scatter2>           Variable 2 for scatter plot.
  --input_dir=<input_dir>           Path to input directory.
  --output_dir=<output_dir>         Path to output directory.

" -> doc

# load the necessary libraries
library(tidyverse)
library(docopt)
library(ggplot2)

# call in the functions that we created for this script
source("R/create_scatter.R")
source("R/create_output_dir.R")

# specify the variables
opt <- docopt(doc)

# call function to create output directory if it doesnt exist
# data <- create_output_dir(opt[["--input_dir"]], opt[["--output_dir"]])
# data <- create_output_dir(--data=data, --output_dir=output_dir)
# data <- create_output_dir(opt[["--data"]], opt[["--output_dir"]])
# data <- create_output_dir(--data = opt[["--data"]], --output_dir = opt[["--output_dir"]])
data <- create_output_dir(input_dir, output_dir)


# call function for making a scatterplot
# create_scatter_plot(opt[["--data"]], opt[["--scatter1"]], opt[["--scatter2"]], opt[["--output_dir"]])
create_scatter_plot(data, scatter1, scatter2, output_dir)


