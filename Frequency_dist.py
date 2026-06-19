import pandas as pd
import matplotlib.pyplot as plt
from collections import Counter

def create_frequency_chart(data, title="Frequency Distribution"):
    # Convert data to a Series and calculate frequencies
    df = pd.Series(data).value_counts().sort_index().reset_index()
    df.columns = ['Value', 'Frequency']
    
    print("\n--- Frequency Table ---")
    print(df.to_string(index=False))
    
    # Plotting
    plt.figure(figsize=(10, 6))
    plt.bar(df['Value'].astype(str), df['Frequency'], color='skyblue', edgecolor='black')
    
    plt.title(title)
    plt.xlabel('Value')
    plt.ylabel('Frequency')
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.show()

# --- INPUT SECTION ---

# Option 1: Using a List
#sample_list = [12, 11.5, 17.5, 14, 12, 14.5, 16, 17, 16, 15.5, 14, 14.5, 15, 8, 14, 17.5, 15, 11.5, 6, 12.5, 16.5, 13.5, 15, 12.5, 11, 12, 13.5, 13, 12, 12, 14.5, 14.5, 14.5, 14, 14.5, 14, 15, 15.5, 13, 11, 13.5, 13.5, 16.5, 11, 14, 9.5, 15, 19, 13.5, 15, 18, 12, 13.5, 17, 17, 17.5, 10, 14.5, 15.5, 8, 14, 13.5, 14, 13.5, 14.5, 13.5, 13.5, 15, 16.5, 14, 15.5, 17, 11.5, 13, 11.5]
sample_list = ['B', 'C-', 'A+', 'B', 'D', 'B+', 'C', 'C-', 'C', 'C-', 'A', 'A-', 'B', 'D', 'B', 'B+', 'D', 'B', 'C', 'B+', 'A-', 'C', 'A-', 'B+', 'C', 'B', 'A-', 'D', 'B', 'B', 'A+', 'B+', 'A', 'B-', 'C+', 'B', 'B', 'A', 'B+', 'B', 'B+', 'C+', 'B+', 'C', 'B', 'B', 'B+', 'A', 'B', 'B+', 'A', 'C-', 'A-', 'B+', 'A-', 'A+', 'A', 'B', 'C+', 'C-', 'C+', 'B-', 'B-', 'C', 'C-', 'C', 'C-', 'A-', 'B', 'C+', 'B+', 'B', 'B', 'C', 'A']
# Option 2: Using a Data File (Uncomment to use)
# To use a file, ensure 'data.csv' exists with a column named 'values'
# file_data = pd.read_csv('data.csv')['values'].tolist()

# Run the function
create_frequency_chart(sample_list, "Sample Data Distribution")