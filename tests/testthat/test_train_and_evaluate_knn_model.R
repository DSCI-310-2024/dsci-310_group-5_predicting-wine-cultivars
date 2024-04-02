library(testthat)
library(tidymodels)
library(readr)
library(dplyr)

source("../../R/train_and_evaluate_knn_model.r")

# Setup:
wine_data <- read_csv("../../data/wine_data.csv")
wine_data$cultivar <- as.factor(wine_data$cultivar) 
set.seed(123)
split <- initial_split(wine_data, prop = 0.75, strata = cultivar)
train_data <- training(split)

test_that("train_and_evaluate_knn_model works on wine dataset", {
  results <- train_and_evaluate_knn_model(train_data, num_folds = 5, range_neighbors = seq(1, 10))
  
  # test that results is a list containing three elements
  expect_true(is.list(results))
  expect_equal(length(results), 3)
  
  # test that best_k is within the specified range
  expect_true(results$best_k %in% seq(1, 10))
  
  # test that accuracies are within a logical range
  expect_true(all(results$accuracies$mean >= 0 & results$accuracies$mean <= 1))
  
  # test the structure of the accuracies dataframe
  expect_true("neighbors" %in% names(results$accuracies))
  expect_true("mean" %in% names(results$accuracies))
})

# Run the tests
test()