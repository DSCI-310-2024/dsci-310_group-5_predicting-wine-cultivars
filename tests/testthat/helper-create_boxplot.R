# function input for create_output_dir function
library(ggplot2)

# Check whether the data box contains a specific variable
check_variable_in_dataframe <- function(data, variable) {
  if (!variable %in% names(data)) {
    stop(paste("Error: The variable", variable, "is not found in the given dataframe."))
  }
}

# Check if the directory for the given path exists, and create if it does not
ensure_directory_exists <- function(path) {
  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }
}