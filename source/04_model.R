doc <- "
Performs KNN modeling on the wine dataset and summarizes the results into figures and tables.

Usage:
  04_model.R --data=<data> --output=<output>

Options:
  --input_dir=<input_dir>		Path (including filename) to raw data
  --output_dir=<output_dir>		Path to directory where the results should be saved
"

library(tidyverse)
library(docopt)
library(tidymodels)
library(kknn)

opts <- docopt(doc)

main <- function(input_dir, output_dir) {
  # Create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  # Load the dataset
  data <- read_csv(input_dir)
  
  # Splitting the data into training and test sets
  set.seed(123)
  split <- initial_split(data, prop = 0.75, strata = cultivar)
  train_data <- training(split)
  test_data <- testing(split)
  
  # Preprocessing
  recipe <- recipe(cultivar ~ ., data = train_data) %>%
    step_scale(all_predictors()) %>%
    step_center(all_predictors()) %>%
    prep()
  
  # Fitting the KNN model
  knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
    set_engine("kknn") %>%
    set_mode("classification")
  
  # Using 5-fold cross-validation to select k
  folds <- vfold_cv(train_data, v = 5, strata = cultivar)
  grid <- tibble(neighbors = seq(1, 20))
  
  results <- tune_grid(
    workflow() %>%
      add_recipe(recipe) %>%
      add_model(knn_spec),
    resamples = folds,
    grid = grid
  )
  
  # Determine best k
  best_k <- results %>%
    select_best(metric = "accuracy")
  
  # Fit the final model
  final_model <- finalize_model(knn_spec, best_k) %>%
    fit(data = juice(recipe, new_data = NULL))
  
  # Prediction and evaluation
  predictions <- predict(final_model, bake(recipe, new_data = test_data)) %>%
    bind_cols(test_data)
  
  accuracy <- predictions %>%
    metrics(truth = cultivar, estimate = .pred_class) %>%
    filter(.metric == "accuracy") %>%
    pull(.estimate)
  
  confusion <- predictions %>%
    conf_mat(truth = cultivar, estimate = .pred_class)
  
  # Save the confusion matrix and accuracy as a table
  write_csv(bind_rows(accuracy = tibble(accuracy), confusion = as_tibble(confusion$table)), file.path(output_dir, "metrics.csv"))
 

  # Generate and save a summary figure of accuracy over k
  accuracy_plot <- results %>%
    collect_metrics() %>%
    filter(.metric == "accuracy") %>%
    ggplot(aes(x = neighbors, y = mean)) +
    geom_line() + 
    geom_point() +
    labs(title = "Accuracy by Number of Neighbors", x = "Number of Neighbors", y = "Accuracy")
    ggsave("accuracy_plot.png", device = "png", path = output_dir, width = 10, height = 3)


  cat("Model evaluation completed. Results saved to:", output_dir, "\n")
}

# Run the main function with arguments provided via command-line
main(opt[["--input_dir"]], opt[["--output_dir"]])