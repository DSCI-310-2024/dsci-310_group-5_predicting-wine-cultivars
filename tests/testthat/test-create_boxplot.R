# load libraries
library(testthat)
library(ggplot2)

# call in the function we are testing
source("../../R/create_boxplot.R")

# Test that the function throws an error for incorrect input types
test_that("`create_boxplot` should throw an error for incorrect input types", {
  expect_error(create_boxplot(wine_data_fake, "alcohol", temp_dir))
  expect_error(create_boxplot(wine_test_data, "fake_variable", temp_dir))
})

# Test that the function correctly saves a file
test_that("`create_boxplot` saves a plot file successfully", {
  temp_dir <- tempdir()
  create_boxplot(wine_test_data, "alcohol", temp_dir)
  expected_filename <- "alcohol_boxplot.png" 
  expect_true(file.exists(file.path(temp_dir, expected_filename)),
              info = "Plot file should exist")
})