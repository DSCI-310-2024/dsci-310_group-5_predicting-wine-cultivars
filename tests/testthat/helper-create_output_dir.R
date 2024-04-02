# function inputs
unfactored_populated_data <- data.frame(
  alcohol = c(12, 13, 14),
  total_phenols = c(2, 3, 4),
  cultivar = c("A", "B", "A")
)
write.csv(unfactored_populated_data, "data/unfactored_populated_data.csv")
unfactored_populated_data_dir <- "data/unfactored_populated_data.csv"

factored_populated_data <- factor(unfactored_populated_data$cultivar) 

output_dir <- "data"
invalid_input_dir <- "invalid/input/dir"
int_data <- 5

# expected function output
test_output_dir <- "data"