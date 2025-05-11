"""
VOO Stock Price Prediction using LSTM

Author: Michael Tartamella
Description: This script uses a Long Short-Term Memory (LSTM) model to forecast
future closing prices of the VOO ETF using historical data from Yahoo Finance.
"""

import numpy as np
from tensorflow import keras
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import yfinance as yf
import random
import tensorflow as tf
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score


# Set random seed for reproducibility
seed = 42
np.random.seed(seed)
random.seed(seed)
tf.random.set_seed(seed)

# Load VOO data using Yahoo Finance data
ticker_symbol = "VOO"
ticker_data = yf.Ticker(ticker_symbol)
data = ticker_data.history(period='max')  #d/mo/y/max
data = data.sort_index(ascending=True)

# Plot closing price
plt.figure(figsize=(12, 6))
plt.plot(data['Close'], label='Close', color='blue')
plt.title('VOO Closing Price Over Time')
plt.xlabel('Date')
plt.ylabel('Price')
plt.legend()

# Plot volume
plt.figure(figsize=(12, 6))
plt.plot(data['Volume'], label='Volume', color='blue')
plt.title('Volume Over Time')
plt.xlabel('Date')
plt.ylabel('Volume')
plt.legend()

# Filter close prices
stock_close = data.filter(['Close'])
dataset = stock_close.values

# Train/test split and lookback window
training_percent = 0.8
lookback_window = 60
training_data_len = int(np.ceil(len(dataset) * training_percent))

train_data_raw = dataset[:training_data_len]
test_data_raw = dataset[training_data_len:]

# Scale training data and test data
scaler = StandardScaler()
scaled_train = scaler.fit_transform(train_data_raw)
scaled_test = scaler.transform(test_data_raw)

# Create training sequences
X_train, y_train = [], []
for i in range(lookback_window, len(scaled_train)):
    X_train.append(scaled_train[i-lookback_window:i, 0])
    y_train.append(scaled_train[i, 0])
X_train = np.array(X_train)
y_train = np.array(y_train)
X_train = np.reshape(X_train, (X_train.shape[0], X_train.shape[1], 1))

# Create test sequences
full_test_input = np.concatenate((scaled_train[-lookback_window:], scaled_test), axis=0)
X_test = []
for i in range(lookback_window, len(full_test_input)):
    X_test.append(full_test_input[i-lookback_window:i, 0])
X_test = np.array(X_test)
X_test = np.reshape(X_test, (X_test.shape[0], X_test.shape[1], 1))

# Build the LSTM model using Keras and TensorFlow
model = keras.models.Sequential()
model.add(keras.layers.LSTM(units=64, return_sequences=True, input_shape=(X_train.shape[1], 1)))
model.add(keras.layers.LSTM(units=64, return_sequences=False))
model.add(keras.layers.Dense(units=128, activation='relu'))
model.add(keras.layers.Dropout(0.5))
model.add(keras.layers.Dense(units=1))

# Compile the model
model.compile(optimizer='adam', loss='mae', metrics=[keras.metrics.RootMeanSquaredError()])
model.summary()

# Train the model
training = model.fit(X_train, y_train, epochs=10, batch_size=32)

# Make predictions
predictions = model.predict(X_test)
predictions = scaler.inverse_transform(predictions)  # Inverse transform to get actual price (essentially unscale the predictions)

# Combine and plot results
train = data[:training_data_len]
test = data[training_data_len:]
test = test.copy()
test['Predictions'] = predictions

plt.figure(figsize=(12, 6))
plt.plot(train['Close'], label='Train (Actual)', color='blue')
plt.plot(test['Close'], label='Test (Actual)', color='red')
plt.plot(test['Predictions'], label='Predictions', color='green')
plt.title('VOO Closing Price Predictions')
plt.xlabel('Date')
plt.ylabel('Close Price')
plt.legend()
plt.show()


y_test = test_data_raw  # True values (already unscaled)

# Calculate evaluation metrics
rmse = np.sqrt(mean_squared_error(y_test, predictions))
mae = mean_absolute_error(y_test, predictions)
r2 = r2_score(y_test, predictions)

# Print evaluation metrics
print(f"RMSE: {rmse:.2f}")
print(f"MAE: {mae:.2f}")
print(f"R² Score: {r2:.4f}")
