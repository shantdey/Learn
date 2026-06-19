#Simple Correlation and regression
import numpy as np

from scipy import stats
import matplotlib.pyplot as plt
# Sample data
x = np.array([1, 2, 3, 4, 5]) # Independent variable

y = np.array([2, 4, 5, 4, 5]) # Dependent variable
# Perform linear regression
slope, intercept, r_value, p_value,std_err = stats.linregress(x, y)
# Regression line
y_pred = intercept + slope * x
# Print results
print("Slope:", slope)
print("Intercept:", intercept)
print("R-squared:", r_value**2)

hours = np.array([10,15,20,25,30,35,40,45,50,55])
scores = np.array([65,70,75,80,85,88,90,92,94,95])
cor = np.corrcoef(hours, scores)
print(cor)

import numpy as np
from sklearn.linear_model import LinearRegression
# Data
X = np.array([ [3, 2], [6, 5], [5, 4], [2, 3]])
y = np.array([20, 24, 28, 30])
# Model
model = LinearRegression()
model.fit(X, y)
# Coefficients
print("Intercept:", model.intercept_)
print("Coefficients:", model.coef_)
