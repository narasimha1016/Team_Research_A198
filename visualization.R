# Load library
library(tidyverse)

# Load dataset
rainfall_data <- read.csv("rainfall_india.csv")

# Save plots to a PDF
pdf("visualization.pdf")

# Scatterplot with trendline
ggplot(rainfall_data, aes(x = Jun.Sep, y = ANNUAL)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "June-Sep vs Annual Rainfall", x = "June-Sep Rainfall (mm)", y = "Annual Rainfall (mm)") +
  theme_minimal() %>% print()

# Histogram with normal curve overlay
ggplot(rainfall_data, aes(x = ANNUAL)) +
  geom_histogram(aes(y = ..density..), bins = 20, fill = "blue", alpha = 0.6) +
  stat_function(fun = dnorm, args = list(mean = mean(rainfall_data$ANNUAL, na.rm = TRUE), 
                                         sd = sd(rainfall_data$ANNUAL, na.rm = TRUE)), color = "black") +
  labs(title = "Annual Rainfall Distribution", x = "Annual Rainfall (mm)", y = "Density") +
  theme_minimal() %>% print()

# Close PDF
dev.off()
