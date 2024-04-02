# function input for tests
only_nums_2_obs <- data.frame(
    a = c(1:5), 
    b = c(2:6),
    stringsAsFactors = FALSE)

only_char_data <- data.frame(
    fruits = c("Apple", "Banana", "Orange", "Grape"), 
    cities = c("New York", "London", "Paris", "Tokyo"),
    stringsAsFactors = FALSE)

mixed_2_num <- data.frame(
    fruits = c("Apple", "Banana", "Orange", "Grape"), 
    cities = c("New York", "London", "Paris", "Tokyo"),
    c = c(4:7),
    d = c(5:8),
    stringsAsFactors = FALSE)

output_dir <- "../../data/wine_data.csv" # specify the correct input directory
fake_output_dir <- "fake_input_dir/" # invalid input directory


# expected function outputs 
only_nums_2_obs_output <- data.frame(
  a = c(min(c(1:5)) , max(c(1:5)) , mean(c(1:5)), sd(c(1:5)) ), 
  b = c(min(c(2:6)) , max(c(2:6)) , mean(c(2:6)), sd(c(2:6)) ), 
  row.names = c("Min", "Max", "Mean","SD"),
  stringsAsFactors = FALSE)
 
mixed_2_num_output <- data.frame(
  c = c(min(c(4:7)) , max(c(4:7)) , mean(c(4:7)), sd(c(4:7)) ), 
  d = c(min(c(5:8)) , max(c(5:8)) , mean(c(5:8)), sd(c(5:8)) ), 
  row.names = c("Min", "Max", "Mean","SD"),
  stringsAsFactors = FALSE)
 

