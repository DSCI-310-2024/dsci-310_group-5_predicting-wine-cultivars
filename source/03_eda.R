# author: Group 5
# date: March 13 2024

"This script generates specified visualizations for the wine dataset.

Usage:
03_eda.R scatter <variable1> <variable2>
03_eda.R boxplot <variable>

Options:
<variable>  Name of the single variable for the histogram or boxplot.
<variable1>  Name of the first variable for the scatter plot.
<variable2>  Name of the second variable for the scatter plot.
--input_dir=<input_dir>		Path (including filename) to raw data
--output_dir=<output_dir>		Path to directory where the results should be saved

" -> doc

library(tidyverse)
library(docopt)
library(ggplot2)

opt <- docopt(doc)

main <- function(input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }

  col_names <- c("cultivar", "alcohol", "malic_acid", "ash", "alcalinity_of_ash", "magnesium", 
                 "total_phenols", "flavanoids", "nonflavanoid_phenols", "proanthocyanins", 
                 "color_intensity", "hue", "OD280_OD315_of_diluted_wines", "proline")
  data <- read_csv(input_dir, col_names = col_names, col_types = cols(.default = col_double(), cultivar = col_factor()))
  
  if (opt$scatter) {
    variable1 <- opt$variable1
    variable2 <- opt$variable2
    plot_scatter(data, variable1, variable2)

  } else if (opt$boxplot) {
    variable <- opt$variable
    plot_boxplot(data, variable)
  }
}

plot_scatter <- function(data, variable1, variable2) {
  scatter <- ggplot(data, aes_string(x = variable1, y = variable2, color = "cultivar")) +
    geom_point() +
    labs(title = paste("Scatter Plot of", variable1, "vs", variable2), x = variable1, y = variable2) +
    theme_minimal()
  
  ggsave("scatterplot.png", device = "png", path = output_dir, width = 10, height = 3)

}

plot_boxplot <- function(data, variable) {
  box <- ggplot(data, aes_string(x = "cultivar", y = variable, fill = "cultivar")) +
    geom_boxplot() +
    labs(title = paste("Boxplot of", variable, "by Cultivar"), x = "Cultivar", y = variable) +
    theme_minimal()
  
  ggsave("boxplot.png", device = "png", path = output_dir, width = 10, height = 3)
}

main(opt[["--input_dir"]], opt[["--output_dir"]])