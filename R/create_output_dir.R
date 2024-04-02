#' Function for making a scatterplot and placing it in the output directory
#'
#' Makes the output directory if it does not already exist,
#' reads the data in and makes sure it is in the right format
#'
#' @param input_dir The path to the input directory
#' @param output_dir The path to the output directory
#'
#' @return returns a dataframe of the data loaded from input_dir
#' @export
#'
#' @examples
#' create_output_dir('../data/wine_data.csv', '../results/')

library(readr)

create_output_dir <- function(input_dir, output_dir) {
  # create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  # read the data in from the input directory
  data <- readr::read_csv(input_dir)
  # change cultivar into a factor
  data$cultivar <- factor(data$cultivar) 
  return(data)
}

