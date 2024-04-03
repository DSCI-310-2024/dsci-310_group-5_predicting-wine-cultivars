# load libraries
library(testthat)
library(ggplot2)

# call in the function we are testing
source("../../R/create_boxplot.R")

# Assume wine_test_data is available and structured correctly

# Since `create_boxplot` does not return a ggplot object, we skip this test

# Test that the function throws an error for incorrect input types
test_that("`create_boxplot` should throw an error for incorrect input types", {
  temp_dir <- tempdir()
  wine_data_fake <- "this is not a data frame"
  expect_error(create_boxplot(wine_data_fake, "alcohol", temp_dir),
               "The variable alcohol does not exist in the dataframe.")
  
  # Assuming your function checks for the existence of the variable in the data
  expect_error(create_boxplot(wine_test_data, "fake_variable", temp_dir),
               "The specified variable does not exist in the dataframe.")
})

# Test that the function correctly saves a file
test_that("`create_boxplot` saves a plot file successfully", {
  temp_dir <- tempdir()
  create_boxplot(wine_test_data, "alcohol", temp_dir)
  expected_filename <- "alcohol_boxplot.png" # Adjust if your function generates a different filename
  expect_true(file.exists(file.path(temp_dir, expected_filename)),
              info = "Plot file should exist")
})