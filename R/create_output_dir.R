#' Title
#'
#' @param scatter1 - the first scatterplot variable
#' @param scatter2 - the second scatterplot variable
#' @param input_dir - the path to the input directory
#' @param output_dir - the path to the output directory
#'
#' @return creates an output directory is one does not already exist
#' @export
#'
#' @examples
#' create_output_dir(opt[["--scatter1"]], opt[["--scatter2"]], opt[["--input_dir"]], opt[["--output_dir"]])
create_output_dir <- function(scatter1, scatter2, input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
