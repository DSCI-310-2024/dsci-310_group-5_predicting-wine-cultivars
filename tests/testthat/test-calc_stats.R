# load the necessary libraries
library(testthat)
# Load the function to be tested
source("../../R/calc_stats.R")


test_that("`calc_stats.R` should return a data frame with all the columns of 'data' as rows", {
  expect_equivalent(summarize_all(only_nums_2_obs), only_nums_2_obs_output)
})


test_that("`calc_stats.R` should throw an error when there are no numeric columns in `data`", {
  expect_error(summarize_all(only_char_data))
})


test_that("`calc_stats.R` should return a dataframe with the number of rows that
          corresponds to the number of numeric columns in the dataframe passed to `data`", {
  expect_equivalent(summarize_all(mixed_2_num), mixed_2_num_output)
})


test_that("`calc_stats.R` should throw an error when incorrect types
are passed to the `data`", {
  expect_error(summarize_all(int_data))
})


