import pandas as pd
import numpy as np
data = {
'Name': ['A', 'B', 'C', 'A', 'D'],
'Salary': [50000, 60000, np.nan, 50000, np.nan],
'Department': ['HR', 'IT', 'HR', 'HR', 'IT']
}
df = pd.DataFrame(data)
print("Original DataFrame:\n", df)

df = df.drop_duplicates()
print("\nAfter Removing Duplicates:\n", df)

median_salary = df['Salary'].median()
df['Salary'].fillna(median_salary, inplace=True)
print("\nAfter Filling NaN with Median:\n", df)

avg_salary = df.groupby('Department')['Salary'].mean()
print("\nAverage Salary by Department:\n", avg_salary)