#NaudeME44038690_SmallTest5_GenerateData
import pandas as pd
import numpy as np

# Set seed for reproducibility
np.random.seed(123)

# Number of observations
n = 365  # 1 year of daily data

# Generate date range
dates = pd.date_range(start="2024-01-01", periods=n, freq="D")

# --- Generate seasonal London-like temperatures (°C) ---
# Winter ~ 5°C, Spring ~ 12°C, Summer ~ 20°C, Autumn ~ 12°C
# We'll model this with a sine wave + noise
base_temp = 12  # average annual temp
amplitude = 8   # seasonal swing
noise = np.random.normal(0, 2, n)  # daily variability

temperature = base_temp + amplitude * np.sin(2 * np.pi * np.arange(n) / 365 - np.pi/2) + noise
temperature = np.round(temperature, 1)

# Create dataframe
weather = pd.DataFrame({
    "Date": dates,
    "Temperature_C": temperature
})

# Define file path
file_path = r"C:\Users\marli\OneDrive\NWU\Bsc Business Analytics\_3rd Year\STTN326\Assignment\Naude_44038690_SmallTest5ResearchAssignment\london_temperature.csv"

# Save to CSV
weather.to_csv(file_path, index=False)

print(f"CSV file saved to:\n{file_path}")
