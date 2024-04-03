doc <- "
Performs KNN modeling on the wine dataset and summarizes the results into figures and tables.

Usage:
  04_model.R --input_dir=<input_dir> --output_dir=<output_dir>
  # --data=<data> --output=<output>

Options:
  --input_dir=<input_dir>		Path (including filename) to raw data
  --output_dir=<output_dir>		Path to directory where the results should be saved
"

library(tidyverse)
library(docopt)
library(tidymodels)
library(kknn)

opt <- docopt(doc)

main <- function(input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }

  # Load the dataset
  data <- read_csv(input_dir)
  
  data$cultivar <- factor(data$cultivar)

  # Splitting the data into training and test sets
  set.seed(123)
  split <- initial_split(data, prop = 0.75, strata = cultivar)
  train_data <- training(split)
  test_data <- testing(split)

  # Using train_and_evaluate_knn_model function to train model
  neighbors_range <- seq(1, 20)
  results <- train_and_evaluate_knn_model(train_data, 5, neighbors_range)
  
  # Generate and save a summary figure of accuracy over k
  accuracy_plot <- ggplot(results$accuracies, aes(x = neighbors, y = mean)) +
    geom_point() +
    geom_line() +
    labs(title = "Accuracy by Number of Neighbors", x = "Number of Neighbors", y = "Accuracy")

  ggsave(file.path(output_dir, "accuracy_plot.png"), accuracy_plot, device = "png", width = 10, height = 3)
  
  # Create the final model and fit it on the training data
  final_model <- finalize_model(results$fitted_model, results$best_k)  
  final_model_fit <- fit(final_model, data = train_data, formula = cultivar ~ .)
  
  # Make predictions on the testing data
  predictions <- predict(final_model_fit, new_data = test_data) %>%
    bind_cols(test_data)

  accuracy <- predictions %>%
    metrics(truth = cultivar, estimate = .pred_class) %>%
    filter(.metric == "accuracy")  %>%
    pull(.estimate)

  write.csv(accuracy, file.path(output_dir, "accuracy_score.csv"), row.names = FALSE)
  
  confusion <- predictions %>%
    conf_mat(truth = cultivar, estimate = .pred_class)

  confusion_tib <- as_tibble(confusion$table)
  
  # Save the confusion matrix and accuracy as a table
  write_csv(confusion_tib, file.path(output_dir, "metrics.csv"))
# confusion = as_tibble(confusion$table), bind_rows(accuracy = tibble(accuracy), 
}

# Run the main function with arguments provided via command-line
main(opt[["--input_dir"]], opt[["--output_dir"]])


