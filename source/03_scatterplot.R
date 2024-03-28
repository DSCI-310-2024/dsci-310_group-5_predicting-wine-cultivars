# author: Group 5
# date: March 13 2024 

"This script generates scatterplot visualizations for the wine dataset.

Usage: 03_scatterplot.R --scatter1=<scatter1> --scatter2=<scatter2> --input_dir=<input_dir> --output_dir=<output_dir>

Options:
  --scatter1=<scatter1>           Variable 1 for scatter plot.
  --scatter2=<scatter2>           Variable 2 for scatter plot.
  --input_dir=<input_dir>           Path to input directory.
  --output_dir=<output_dir>         Path to output directory.

" -> doc

library(tidyverse)
library(docopt)
library(ggplot2)

opt <- docopt(doc)

create_output_dir <- function(scatter1, scatter2, input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  data <- read_csv(input_dir)
  data$cultivar <- factor(data$cultivar)
  
  scatter <-
    ggplot(data, aes( x = !!sym(scatter1), y = !!sym(scatter2),color = cultivar)) +
    geom_point() +
    labs(
      title = paste("Scatter Plot of", scatter1, "vs", scatter2),
      x = scatter1,
      y = scatter2)  
  
  ggsave(file.path(output_dir, "scatterplot.png"), scatter, device = "png", width = 5, height = 3)
  
  
}
create_output_dir(opt[["--scatter1"]], opt[["--scatter2"]], opt[["--input_dir"]], opt[["--output_dir"]])