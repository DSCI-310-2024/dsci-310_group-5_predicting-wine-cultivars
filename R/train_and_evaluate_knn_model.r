#' Function for Training and Evaluating a KNN Model
#'
#' Trains a KNN model on the training dataset using cross-validation to find the optimal number
#' of neighbors. Evaluates the model's performance based on accuracy.
#'
#' @param train_data A data frame containing the training data.
#' @param num_folds The number of folds to use for cross-validation.
#' @param range_neighbors A sequence of numbers indicating the range of neighbors to tune over.
#'
#' @return A list containing the fitted model, the best number of neighbors (best_k), 
#'         and a data frame of accuracies for each number of neighbors considered.
#' @export
#'
#' @examples
#' 
#' set.seed(123)
#' data_split <- initial_split(wine_data, prop = 0.75, strata = Species)
#' train_data <- training(data_split)
#' neighbors_range <- seq(1, 20)
#' 
#' train_and_evaluate_knn_model(train_data, 5, neighbors_range)

train_and_evaluate_knn_model <- function(train_data, num_folds, range_neighbors) {

  # Preprocessing:
  recipe <- recipe(Species ~ ., data = train_data) %>%
    step_scale(all_predictors()) %>%
    step_center(all_predictors())

  # KNN model:
  knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
    set_engine("kknn") %>%
    set_mode("classification")
  
  # Grid of neighbor values to tune over:
  grid_vals <- tibble(neighbors = range_neighbors)
  
  # Cross-validation setup:
  folds <- vfold_cv(train_data, v = num_folds, strata = Species)
  
  # Model tuning:
  fit <- workflow() %>%
    add_recipe(recipe) %>%
    add_model(knn_spec) %>%
    tune_grid(resamples = folds, grid = grid_vals) %>%
    collect_metrics()
  
  # Filter for accuracy metric:
  accuracies <- fit %>%
    filter(.metric == "accuracy")
  
  # Determine the best number of neighbors based on accuracy:
  best_k <- accuracies %>%
    arrange(desc(mean)) %>%
    slice(1) %>%
    pull(neighbors)
  
  return(list(fitted_model = fit, best_k = best_k, accuracies = accuracies))
}
