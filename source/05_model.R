doc <- "
Performs KNN modeling on the wine dataset and summarizes the results into figures and tables.

Usage:
  04_model.R --input_dir=<input_dir> --output_dir=<output_dir> --response=<response>

Options:
  --input_dir=<input_dir>		Path (including filename) to raw data
  --output_dir=<output_dir>		Path to directory where the results should be saved
  --response=<response>   The response variable in the model
"

library(tidyverse)
library(docopt)
library(tidymodels)
library(kknn)
library(predictcultivar)

opt <- docopt(doc)

main <- function(input_dir, output_dir, response) {
  # call function to create output directory if it doesn't exist
  create_output_dir(output_dir)
  
  # read and factor the data
  data <- read_and_factor(input_dir)

  # Using train_and_evaluate_knn_model function to train model
  neighbors_range <- seq(1, 20)
  results <- model_workflow(data, 5, neighbors_range, response)

  # Generate and save a summary figure of accuracy over k
  # accuracy_plot <- ggplot(results$metrics, aes(x = neighbors, y = Accuracy)) +
  #   geom_point() +
  #   geom_line() +
  #   labs(title = "Accuracy by Number of Neighbors", x = "Number of Neighbors", y = "Accuracy")
  # 
  # ggsave(file.path(output_dir, "accuracy_plot.png"), accuracy_plot, device = "png", width = 10, height = 3)
  broom::tidy(results$cmat) %>% write.csv(file = file.path(output_dir, "confusion_matrix.csv"), row.names = FALSE)

}

# Run the main function with arguments provided via command-line
main(opt[["--input_dir"]], opt[["--output_dir"]], opt[["--response"]])


