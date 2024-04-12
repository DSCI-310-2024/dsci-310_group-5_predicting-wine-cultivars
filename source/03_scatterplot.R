# author: Group 5
# date: March 28 2024 

"This script generates scatterplot visualizations for the wine dataset.

Usage: 03_scatterplot.R --scatter1=<scatter1> --scatter2=<scatter2> --color=<color> --input_dir=<input_dir> --output_dir=<output_dir>

Options:
  --scatter1=<scatter1>           Variable 1 for scatter plot.
  --scatter2=<scatter2>           Variable 2 for scatter plot.
  --color=<color>                 Variable to color by for the plot.
  --input_dir=<input_dir>           Path to input directory.
  --output_dir=<output_dir>         Path to output directory.

" -> doc

# load the necessary libraries
library(tidyverse)
library(docopt)
library(ggplot2)
library(predictcultivar)

# specify the variables
opt <- docopt(doc)

main <- function(scatter1, scatter2, color, input_dir, output_dir) {
    # call function to create output directory if it doesnt exist
    create_output_dir(output_dir)
  
    # read and factor the data
    data <- read_and_factor(input_dir)

    # call function for making a scatterplot
    scatterplot <- create_scatter(data, scatter1, scatter2, color)

    ggsave(file.path(output_dir, "scatterplot.png"), scatterplot, device = "png", width = 5, height = 3)
}

main(opt[["--scatter1"]],opt[["--scatter2"]],opt[["--color"]],opt[["--input_dir"]], opt[["--output_dir"]])

