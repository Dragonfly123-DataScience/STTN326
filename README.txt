# README
Project Title: London Temperature Time Series Analysis  
Author: Marlie Naude (Student ID: 44038690)  
Course: STTN326 – Statistical Time Series Techniques  
Assignment: Small Test 5 – Research Assignment  

Overview:
This project simulates and analyzes daily temperature data for London over the course of 2024. It includes synthetic data generation, time series transformation, stationarity testing, model fitting, and forecasting using R.

Files Included:
1. NaudeME44038690_SmallTest5_GenerateData.py  
   - Python script that generates synthetic daily temperature data using a seasonal sine wave model with added noise.
   - Saves the output to `london_tempreture.csv`.

2. london_tempreture.csv  
   - Contains 365 rows of daily temperature data for London in 2024.
   - Columns:  
     • Date (YYYY-MM-DD)  
     • Temperature_C (°C)

3. NaudeME44038690_SmallTest5_ResearchAssignment.r  
   - R script that performs the following:
     • Reads and converts the temperature data into a time series object.
     • Visualizes the raw, detrended, differenced, and log-differenced series.
     • Conducts stationarity tests (ADF and unit root tests).
     • Analyzes autocorrelation and partial autocorrelation.
     • Fits ARIMA models using various estimation methods (MoM, MLE, LS).
     • Forecasts the next 20 days of temperature and visualizes the forecast with confidence intervals.

How to Run:
1. Run the Python script to generate `london_tempreture.csv`.  
   - Ensure the output path in the script matches your working directory.

2. Open the R script in RStudio or another R environment.  
   - Set the working directory to the location of `london_tempreture.csv`.  
   - Install required packages if not already installed: `tseries`, `urca`, `forecast`, `lubridate`, `ggplot2`, `dplyr`.

3. Execute the R script step-by-step to view plots, test results, and forecasts.

Notes:
- The temperature data is synthetic and modeled to reflect seasonal patterns typical of London.

Additional Files:

1. NaudeME44038690_SmallTest5(1).docx  
   - A Word document containing my personal interpretations, insights, and reflections on the time series analysis results.  
   - Includes commentary on stationarity tests, model selection, and forecast accuracy.

2. Small Test 5 - Research Assignment.pdf  
   - The original assignment brief outlining the requirements, objectives, and evaluation criteria for Small Test 5.  
   - Serves as a reference for understanding the scope and expectations of the project.
