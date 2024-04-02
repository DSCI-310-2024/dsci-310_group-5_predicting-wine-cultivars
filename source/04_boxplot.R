# author: Group 5
# date: March 13 2024

"This script creates a boxplot.

Usage: 04_boxplot.R --variable1=<variable1> --input_dir=<input_dir> --output_dir=<output_dir> 

Options:
--variable1=<variable1>     Variable for plot
--input_dir=<input_dir>		Path (including filename) to raw data
--output_dir=<output_dir>		Path to directory where the results should be saved

" -> doc

library(tidyverse)
library(docopt)
library(ggplot2)

opt <- docopt(doc)

main <- function(variable1, input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  data <- read_csv(input_dir)
  data$cultivar <- factor(data$cultivar)
  
  box <-ggplot(data, aes(x = cultivar, y = !!sym(variable1), color = cultivar)) +
    geom_boxplot() +
    labs(
      title = paste("Boxplot of", variable1, "by Cultivar"),
      x = "Cultivar",
      y = variable1)  
  
  ggsave(file.path(output_dir, "boxplot.png"), box, device = "png", width = 5, height = 3)

}

main(opt[["--variable1"]],opt[["--input_dir"]], opt[["--output_dir"]])
