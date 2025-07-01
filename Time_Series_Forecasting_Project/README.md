# 📈 Time Series Forecasting: VOO ETF with LSTM

This project uses a Long Short-Term Memory (LSTM) neural network to forecast the closing price of the Vanguard S&P 500 ETF (VOO) using historical stock price data. It showcases time series preprocessing, LSTM model architecture in TensorFlow/Keras, evaluation metrics, and prediction visualization.

## 📊 Project Overview

- **Goal**: Predict future closing prices of the VOO ETF
- **Method**: LSTM-based Recurrent Neural Network
- **Data Source**: [Yahoo Finance](https://finance.yahoo.com/)
- **Library Stack**: Python, TensorFlow/Keras, scikit-learn, yfinance, matplotlib

## 🛠️ Features

- Downloads historical data using `yfinance`
- Scales and prepares sequences for supervised learning
- Trains a multi-layer LSTM model
- Predicts and plots closing prices
- Evaluates the model using:
  - RMSE (Root Mean Squared Error)
  - MAE (Mean Absolute Error)
  - R² (R-squared Score)

## 🧪 Model Performance

Example results (depending on training split and time period):

RMSE: 15.56  
MAE: 11.93  
R² Score: 0.9545  

Note: Performance may vary depending on market volatility and the length of the dataset used.

## 📂 File Structure

├── Time_Series_Forecasting.py     # Python code and analysis\
├── Prediction_Plot.png            # Saved prediction plot\
├── README.md                      # Project documentation

## 🧠 What You’ll Learn

- Time series preprocessing for LSTM models
- Building deep learning models for sequential data
- Applying data scaling to avoid leakage
- Interpreting regression-based performance metrics

## 📬 Contact

Michael Tartamella\
📧 mtartamella117@gmail.com\
🔗 [LinkedIn](https://www.linkedin.com/in/michael-tartamella/)  
