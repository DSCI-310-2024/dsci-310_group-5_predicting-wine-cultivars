# load the necessary libraries
library(testthat)

# call in the function we are testing
source("R/calc_stats.R")

test_that("`calc_stats.R` should return a data frame with all the columns of 'data' as rows", {
  # tests to be added here
})

test_that("`calc_stats.R` should return a dataframe with the number of rows that 
          corresponds to the number of numeric columns in the dataframe passed to `data`", {
  # tests to be added here
})


test_that("`calc_stats.R` should throw an error when there are no numeric columns in `data`", {
  # tests to be added here
})

test_that("`calc_stats.R` should throw an error when incorrect types 
are passed to the `data`, `output_dir`, and  arguments 'output_name'", {
  # tests to be added here
})


