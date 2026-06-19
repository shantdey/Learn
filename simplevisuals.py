#using matplotlib
#Sales of different products:
import matplotlib.pyplot as plt
products = ['Product A', 'Product B', 'Product C', 'Product D']
sales = [50, 75, 60, 90]
plt.bar(products, sales)
plt.title("Product-wise Sales")
plt.xlabel("Products")
plt.ylabel("Sales")
plt.show()
#pie charts
labels = ['Product A', 'Product B', 'Product C', 'Product D']
market_share = [30, 25, 20, 25]
plt.pie(market_share, labels=labels, autopct='%1.1f%%')
plt.title("Market Share Distribution")
plt.show()
#simple line charts
import matplotlib.pyplot as plt
months = ['Jan', 'Feb', 'Mar', 'Apr']
sales = [200, 250, 300, 280]
plt.plot(months,sales, marker='o')
plt.title("Monthly Sales Trend")
plt.xlabel("Months")
plt.ylabel("Sales")
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
# Sample data
data = {
'Sales': [100, 200, 300, 400],
'Profit': [15, 40, 32, 64],
'Advertising': [10, 25, 52, 28]
}
df = pd.DataFrame(data)
# Correlation matrix
corr = df.corr()
# Heatmap
sns.heatmap(corr, annot=True)
plt.title("Correlation Heatmap")
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
# Sample data
data = {
'Department': ['HR', 'HR', 'IT', 'IT', 'Sales', 'Sales'],
'Salary': [30000, 35000, 60000, 65000, 40000, 120000]
}
df = pd.DataFrame(data)
sns.boxplot(x='Department', y='Salary', data=df)
plt.title("Salary Distribution by Department")
plt.show()

#simple barchart
import seaborn as sns
import matplotlib.pyplot as plt
products = ['A', 'B', 'C', 'D']
sales = [500, 700, 400, 650]
sns.barplot(x=products, y=sales)
plt.title("Product-wise Sales")
plt.show()

import seaborn as sns
import matplotlib.pyplot as plt
advertising = [10, 20, 30, 40, 50]
sales = [15, 25, 35, 45, 55]
sns.scatterplot(x=advertising, y=sales)
plt.title("Advertising vs Sales")
plt.xlabel("Advertising Spend")
plt.ylabel("Sales")
plt.show()