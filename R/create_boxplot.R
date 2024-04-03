#' Create a Boxplot for a Specified Variable by Cultivar
#'
#' This function creates a boxplot of a specified variable by cultivar from the given dataset.
#' @param data A dataframe containing the dataset.
#' @param variable Name of the variable to plot.
#' @param output_dir Directory where the boxplot image will be saved.
#'
#' @return Saves a boxplot as a PNG file in the specified output directory.
#' @export
#'
#' @examples
#' create_boxplot(wine_data, variable = 'alcohol', output_dir = 'results')

library(ggplot2)

create_boxplot <- function(data, variable, output_dir) {
  plot <- ggplot(data, aes(x = cultivar, y = !!sym(variable))) +
    geom_boxplot() +
    theme_minimal()
  
  # Create the output directory if it doesn't exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }
  
  # Save the plot
  ggsave(filename = paste0(output_dir, "/", variable, "_boxplot.png"), plot = plot, width = 8, height = 6)
}