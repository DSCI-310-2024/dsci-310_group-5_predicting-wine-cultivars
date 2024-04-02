#' This function calculates the minimum, maximum, mean, and standard deviation for all numeric columns
#' in a given dataframe and saves the results to a CSV file.
#'
#' @param data        A dataframe
#' @param output_dir  The file path to save the output to
#'
#' @return A CSV file containing summary statistics for each numeric column 
#' @export
#'
#' @examples
#' # Calculate summary statistics for wine_data and save results to 'results/' directory
#' summarize_all(wine_data, "results/")

summarize_all <- function(data, output_dir, output_name) {
    # Select only numeric columns
    numeric_columns <- data %>%
        select_if(is.numeric)
    
    # Produce an error if there are no numeric columns
    if (is_empty <- nrow(numeric_columns) == 0 || ncol(numeric_columns) == 0) {
        stop("There are no numeric columns in the dataframe.")
    }

    var_names <- names(numeric_columns)

    # Create an empty data frame to store statistics
    summary_df <- data.frame(
        matrix(NA, nrow = 4, ncol = length(var_names)),
        row.names = c("Min", "Max", "Mean", "SD")
    )
    colnames(summary_df) <- var_names

    # Calculate statistics for each column
    for (var in var_names) {
        summary_df["Min", var] <- min(numeric_columns[[var]], na.rm = TRUE)
        summary_df["Max", var] <- max(numeric_columns[[var]], na.rm = TRUE)
        summary_df["Mean", var] <- mean(numeric_columns[[var]], na.rm = TRUE)
        summary_df["SD", var] <- sd(numeric_columns[[var]], na.rm = TRUE)
    }

    # Save the output to a csv
    write_csv(summary_df, file.path(output_dir, output_name))  
    return(summary_df)
}