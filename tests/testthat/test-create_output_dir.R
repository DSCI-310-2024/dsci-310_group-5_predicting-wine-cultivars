# load the necessary libraries
library(testthat)

# call in the function that we are testing
source("../../R/create_output_dir.R")

test_that("`create_output_dir` correctly creates the output directory when it does not exist", {
  create_output_dir(unfactored_populated_data_dir, output_dir)  
  expect_true(dir.exists(test_output_dir), info = "Output directory should be created")
})


test_that("`create_output_dir` should throw an error for an invalid input directory", {
  expect_error(create_output_dir(invalid_input_dir, output_dir))
})


test_that("`create_output_dir` should return a dataframe", {
  expect_true((is.data.frame(create_output_dir(unfactored_populated_data_dir,output_dir))))
})


test_that("`create_output_dir` is converting cultivar into a factor", {
  data <- readr::read_csv(unfactored_populated_data_dir) # read in the data from the input directory as we do in the function
  data$cultivar <- factor(data$cultivar) # check the method we use in the function to convert it to a factor
  expect_is(data$cultivar, "factor", info = "The 'cultivar' column should be converted into a factor")
})

test_that("`create_output_dir` should throw an error when incorrect types
are passed to `input_dir` and `output_dir`", {
  expect_error(create_output_dir(int_data,output_dir))
  expect_error(create_output_dir(unfactored_populated_data_dir,int_data))
})

