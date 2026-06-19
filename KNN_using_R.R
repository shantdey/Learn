# K-Nearest Neighbors Classification
# Using the same simulated data as linear regression example

# Load required libraries
library(ggplot2)
library(class)  # for knn function
library(RColorBrewer)

# Set seed for reproducibility
set.seed(123)

# Simulate the same training data as before
n_per_class <- 100

# Generate BLUE class data (centered around one region)
blue_x1 <- rnorm(n_per_class, mean = 2, sd = 1)
blue_x2 <- rnorm(n_per_class, mean = 2, sd = 1)

# Generate ORANGE class data (centered around another region)
orange_x1 <- rnorm(n_per_class, mean = 4, sd = 1)
orange_x2 <- rnorm(n_per_class, mean = 4, sd = 1)

# Combine data
X1 <- c(blue_x1, orange_x1)
X2 <- c(blue_x2, orange_x2)
G <- factor(c(rep("BLUE", n_per_class), rep("ORANGE", n_per_class)))

# Create data frame
train_data <- data.frame(X1 = X1, X2 = X2, G = G)

# Function to implement KNN and calculate accuracy
knn_classify <- function(train_data, k_value) {
  # Extract features and labels
  train_features <- train_data[, c("X1", "X2")]
  train_labels <- train_data$G
  
  # Apply KNN (using training data as test data for visualization)
  knn_pred <- knn(train = train_features, test = train_features, 
                  cl = train_labels, k = k_value)
  
  # Calculate accuracy
  accuracy <- mean(knn_pred == train_labels)
  
  return(list(predictions = knn_pred, accuracy = accuracy))
}

# Test different values of K
k_values <- c(1, 3, 5, 10, 15, 25)
results <- list()

cat("K-Nearest Neighbors Results:\n")
cat("============================\n")

for (k in k_values) {
  result <- knn_classify(train_data, k)
  results[[as.character(k)]] <- result
  
  cat("K =", k, ": Accuracy =", round(result$accuracy * 100, 2), "%\n")
  
  # Create confusion matrix
  conf_matrix <- table(Actual = train_data$G, Predicted = result$predictions)
  cat("Confusion Matrix for K =", k, ":\n")
  print(conf_matrix)
  cat("\n")
}

# Choose optimal K based on accuracy
accuracies <- sapply(results, function(x) x$accuracy)
optimal_k <- as.numeric(names(which.max(accuracies)))
cat("Optimal K:", optimal_k, "with accuracy:", round(max(accuracies) * 100, 2), "%\n\n")

# Create visualization function for decision boundaries
create_knn_boundary_plot <- function(train_data, k_value, title_suffix = "") {
  # Create a fine grid for decision boundary
  x1_range <- seq(min(train_data$X1) - 1, max(train_data$X1) + 1, length.out = 100)
  x2_range <- seq(min(train_data$X2) - 1, max(train_data$X2) + 1, length.out = 100)
  grid <- expand.grid(X1 = x1_range, X2 = x2_range)
  
  # Predict on grid using KNN
  grid_pred <- knn(train = train_data[, c("X1", "X2")], 
                   test = grid,
                   cl = train_data$G, 
                   k = k_value)
  
  grid$Predicted <- grid_pred
  
  # Create the plot
  p <- ggplot() +
    # Background colored by predictions
    geom_tile(data = grid, aes(x = X1, y = X2, fill = Predicted), alpha = 0.3) +
    # Actual data points
    geom_point(data = train_data, aes(x = X1, y = X2, color = G), 
               size = 2, alpha = 0.8) +
    scale_color_manual(values = c("BLUE" = "blue", "ORANGE" = "orange"),
                       name = "Actual Class") +
    scale_fill_manual(values = c("BLUE" = "lightblue", "ORANGE" = "lightsalmon"),
                      name = "Predicted Region") +
    labs(title = paste("KNN Decision Boundary (K =", k_value, ")", title_suffix),
         x = "X1", y = "X2") +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  return(p)
}

# Create plots for different K values
cat("Generating plots for different K values...\n")

# Plot for K=1 (most flexible)
p1 <- create_knn_boundary_plot(train_data, 1, "- Most Flexible")
print(p1)

# Plot for K=5 (moderate flexibility)
p5 <- create_knn_boundary_plot(train_data, 5, "- Moderate Flexibility")
print(p5)

# Plot for K=15 (less flexible)
p15 <- create_knn_boundary_plot(train_data, 15, "- Less Flexible")
print(p15)

# Plot for optimal K
p_optimal <- create_knn_boundary_plot(train_data, optimal_k, "- Optimal K")
print(p_optimal)

# Compare predictions for different K values
comparison_data <- train_data
for (k in c(1, 5, 15)) {
  pred_col <- paste0("K", k, "_pred")
  comparison_data[[pred_col]] <- knn(train = train_data[, c("X1", "X2")], 
                                     test = train_data[, c("X1", "X2")],
                                     cl = train_data$G, 
                                     k = k)
}

# Show prediction comparison for first 15 points
cat("Prediction Comparison (First 15 points):\n")
cat("========================================\n")
print(comparison_data[1:15, c("X1", "X2", "G", "K1_pred", "K5_pred", "K15_pred")])

# Create accuracy vs K plot
accuracy_df <- data.frame(
  K = k_values,
  Accuracy = sapply(k_values, function(k) results[[as.character(k)]]$accuracy)
)

p_accuracy <- ggplot(accuracy_df, aes(x = K, y = Accuracy)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 3) +
  geom_point(data = accuracy_df[accuracy_df$K == optimal_k, ], 
             aes(x = K, y = Accuracy), color = "green", size = 4) +
  labs(title = "KNN Accuracy vs K Value",
       subtitle = paste("Green point shows optimal K =", optimal_k),
       x = "K (Number of Neighbors)", 
       y = "Classification Accuracy") +
  scale_y_continuous(labels = scales::percent_format()) +
  theme_minimal()

print(p_accuracy)

# Function to visualize individual predictions
visualize_knn_example <- function(train_data, test_point, k_value) {
  # Calculate distances to all training points
  distances <- sqrt((train_data$X1 - test_point[1])^2 + (train_data$X2 - test_point[2])^2)
  
  # Find K nearest neighbors
  nearest_indices <- order(distances)[1:k_value]
  nearest_points <- train_data[nearest_indices, ]
  
  # Make prediction
  prediction <- names(sort(table(nearest_points$G), decreasing = TRUE))[1]
  
  # Create visualization
  p <- ggplot() +
    geom_point(data = train_data, aes(x = X1, y = X2, color = G), 
               size = 2, alpha = 0.5) +
    geom_point(data = nearest_points, aes(x = X1, y = X2, color = G), 
               size = 3, alpha = 0.8, shape = 1, stroke = 2) +
    geom_point(aes(x = test_point[1], y = test_point[2]), 
               color = "black", size = 4, shape = 4, stroke = 3) +
    scale_color_manual(values = c("BLUE" = "blue", "ORANGE" = "orange")) +
    labs(title = paste("KNN Example (K =", k_value, ")"),
         subtitle = paste("Black X = Test Point, Circled points = Nearest Neighbors\nPrediction:", prediction),
         x = "X1", y = "X2", color = "Class") +
    theme_minimal()
  
  return(p)
}

# Example prediction for a specific point
test_point <- c(3, 3)  # Point between the two clusters
p_example <- visualize_knn_example(train_data, test_point, 5)
print(p_example)

cat("\nKNN Analysis Summary:\n")
cat("====================\n")
cat("• KNN is a non-parametric method that classifies based on majority vote of K nearest neighbors\n")
cat("• Smaller K values (like K=1) create more flexible decision boundaries\n")
cat("• Larger K values create smoother, less flexible boundaries\n")
cat("• Optimal K =", optimal_k, "achieved", round(max(accuracies) * 100, 2), "% accuracy on this dataset\n")
cat("• KNN decision boundaries adapt to local data patterns, unlike linear regression's straight line\n")