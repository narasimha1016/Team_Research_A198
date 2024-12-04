# Load the required library
library(tidyverse)

# Load the dataset
rainfall_data <- read.csv("rainfall_india.csv")

# Perform Spearman's Rho correlation
spearman_test <- cor.test(rainfall_data$Jun.Sep, rainfall_data$ANNUAL, method = "spearman")

# Print test results
spearman_test
