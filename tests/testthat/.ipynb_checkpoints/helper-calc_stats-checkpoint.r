# dataframe with only numerical data
only_num_data <- data.frame(
    a = c(1:5), 
    b = c(77,3,67,12,98),
    c = c(311,24,268,33,6),
    d = c(4, 55,23,44,1),
    stringsAsFactors = FALSE)

# dataframe with only char data
only_char_data <- data.frame(
    fruits = c("Apple", "Banana", "Orange", "Grape"), 
    cities = c("New York", "London", "Paris", "Tokyo"),
    stringsAsFactors = FALSE)

# dataframe with both char and numerical data
mixed_data <- data.frame(
    fruits = c("Apple", "Banana", "Orange", "Grape"), 
    cities = c("New York", "London", "Paris", "Tokyo"),
    k = c(311,24,268,6),
    l = c(4,55,23,1),
    stringsAsFactors = FALSE)



output_dir <- "../../data/wine_data.csv" # specify the correct input directory
fake_output_dir <- "fake_input_dir/" # invalid input directory
