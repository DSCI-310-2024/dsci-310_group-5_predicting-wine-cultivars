#' Create a scatterplot with the specified X and Y variables
#'
#' @param data A dataframe
#' @param scatter1 A column in the dataframe we are interested in visualizing on the x-axis
#' @param scatter2 A column in the dataframe we are interested in visualizing on the y-axis
#'
#' @return A ggplot scatterplot with the specified columns on the x and y axes
#' @export
#'
#' @examples
#' create_scatter_plot(wine_data, 'alcohol', 'total_phenols')

doc <- "
Usage:
  create_scatter.R --input_dir=<input_dir> --scatter1=<scatter1> --scatter2=<scatter2> --output_dir=<output_dir>

Options:
  --input_dir=<input_dir>   Path to the input CSV file.
  --scatter1=<scatter1>     A column in the dataframe we are interested in visualizing on the x-axis
  --scatter2=<scatter2>     A column in the dataframe we are interested in visualizing on the y-axis
  --output_dir=<output_dir> Path to directory where the results should be saved
"

library(docopt)
library(tidyverse)
# source("R/create_output_dir.R")
opt <- docopt(doc)

create_scatter_plot <- function(input_dir, scatter1, scatter2, output_dir) {
  data <- read.csv("data/wine_data.csv")
  
  # first check if scatter1 and scatter2 exist in the data
  if (!scatter1 %in% colnames(data) || !scatter2 %in% colnames(data)) {
    stop("One or both of the inputted variables do not exist in the dataframe")
  }
  
  # make the scatter plot
  scatter <- ggplot(data, aes(x = !!sym(scatter1), y = !!sym(scatter2), color = cultivar)) +
    geom_point() +
    labs(
      title = paste("Scatter Plot of", scatter1, "vs", scatter2),
      x = scatter1,
      y = scatter2)

  # save the scatterplot to our output directory as a png
  ggsave(file.path(output_dir, "scatterplot.png"), scatter, device = "png", width = 5, height = 3)
    
}
create_scatter_plot(opt[["--input_dir"]],opt[["--scatter1"]],opt[["--scatter2"]], opt[["--output_dir"]])


