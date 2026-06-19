# Linear Regression Classification with Scatterplot
# Generate simulated training data and fit linear regression model

# Load required libraries
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Simulate training data
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

# Create response variable Y (0 for BLUE, 1 for ORANGE)
Y <- ifelse(G == "ORANGE", 1, 0)

# Create data frame
train_data <- data.frame(X1 = X1, X2 = X2, G = G, Y = Y)

# Fit linear regression model
lm_model <- lm(Y ~ X1 + X2, data = train_data)

# Print model summary
cat("Linear Regression Model Summary:\n")
print(summary(lm_model))

# Get fitted values (Y_hat)
Y_hat <- predict(lm_model)

# Convert fitted values to fitted class variable G_hat using the rule
G_hat <- ifelse(Y_hat > 0.5, "ORANGE", "BLUE")
G_hat <- factor(G_hat, levels = c("BLUE", "ORANGE"))

# Add predictions to data frame
train_data$Y_hat <- Y_hat
train_data$G_hat <- G_hat

# Calculate classification accuracy
accuracy <- mean(G_hat == G)
cat("\nClassification Accuracy:", round(accuracy * 100, 2), "%\n")

# Create confusion matrix
confusion_matrix <- table(Actual = G, Predicted = G_hat)
cat("\nConfusion Matrix:\n")
print(confusion_matrix)

# Create scatterplot of training data
p1 <- ggplot(train_data, aes(x = X1, y = X2, color = G)) +
  geom_point(size = 2, alpha = 0.7) +
  scale_color_manual(values = c("BLUE" = "blue", "ORANGE" = "orange")) +
  labs(title = "Training Data Scatterplot",
       subtitle = paste("100 points per class"),
       x = "X1", y = "X2", color = "Class") +
  theme_minimal() +
  theme(legend.position = "bottom")

# Create scatterplot showing predictions vs actual
p2 <- ggplot(train_data, aes(x = X1, y = X2)) +
  geom_point(aes(color = G, shape = G_hat), size = 2, alpha = 0.7) +
  scale_color_manual(values = c("BLUE" = "blue", "ORANGE" = "orange")) +
  scale_shape_manual(values = c("BLUE" = 16, "ORANGE" = 17),
                     name = "Predicted Class") +
  labs(title = "Actual vs Predicted Classes",
       subtitle = "Color = Actual Class, Shape = Predicted Class",
       x = "X1", y = "X2", color = "Actual Class") +
  theme_minimal() +
  theme(legend.position = "bottom")

# Display plots
print(p1)
print(p2)

# Create decision boundary visualization
# Generate grid for decision boundary
x1_range <- seq(min(X1) - 1, max(X1) + 1, length.out = 100)
x2_range <- seq(min(X2) - 1, max(X2) + 1, length.out = 100)
grid <- expand.grid(X1 = x1_range, X2 = x2_range)

# Predict on grid
grid$Y_hat <- predict(lm_model, newdata = grid)
grid$G_hat <- ifelse(grid$Y_hat > 0.5, "ORANGE", "BLUE")

# Plot with decision boundary
p3 <- ggplot() +
  geom_contour(data = grid, aes(x = X1, y = X2, z = Y_hat), 
               breaks = 0.5, color = "black", size = 1) +
  geom_point(data = train_data, aes(x = X1, y = X2, color = G), 
             size = 2, alpha = 0.7) +
  scale_color_manual(values = c("BLUE" = "blue", "ORANGE" = "orange")) +
  labs(title = "Training Data with Linear Decision Boundary",
       subtitle = "Black line shows decision boundary (Ŷ = 0.5)",
       x = "X1", y = "X2", color = "Class") +
  theme_minimal() +
  theme(legend.position = "bottom")

print(p3)

# Print some statistics
cat("\nModel Coefficients:\n")
cat("Intercept:", round(coef(lm_model)[1], 4), "\n")
cat("X1 coefficient:", round(coef(lm_model)[2], 4), "\n")
cat("X2 coefficient:", round(coef(lm_model)[3], 4), "\n")

cat("\nRange of fitted values (Ŷ):\n")
cat("Min:", round(min(Y_hat), 4), "\n")
cat("Max:", round(max(Y_hat), 4), "\n")

# Show first few predictions
cat("\nFirst 10 predictions:\n")
print(head(train_data[, c("X1", "X2", "G", "Y_hat", "G_hat")], 10))
