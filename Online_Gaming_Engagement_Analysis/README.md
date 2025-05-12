# Online Gaming Engagement Analysis

This project uses a classification model built with XGBoost to predict the **engagement level** of players in an online gaming dataset based on behavioral and demographic attributes.

## 🧠 Objective
To develop a machine learning model that classifies players' engagement levels (`Low`, `Medium`, or `High`) using features such as:
- Play time
- Game genre and difficulty
- Sessions per week
- In-game purchases
- Location, age, and gender

## 🔍 Data
The dataset contains anonymized player statistics with the following features:
- Demographics (e.g., Gender, Age, Location)
- Behavioral metrics (e.g., SessionsPerWeek, AvgSessionDurationMinutes)
- Game preferences (Genre, Difficulty)
- In-game purchases

## 📈 Model
- **Algorithm**: XGBoost Classifier
- **Preprocessing**: Label encoding and one-hot encoding
- **Metrics**: Accuracy, Confusion Matrix, Classification Report

## 🔧 Tools & Libraries
- Python (pandas, scikit-learn, xgboost)

## 📊 Features
- Interactive prediction tool: users can input new player attributes and receive a predicted engagement level
- Feature correlation heatmap for insight

## 📁 Structure

Online_Gaming_Engagement_Analysis/\
├── Online_Gaming_Engagement_Classifier.py # Main script\
├── Online_Gaming_Engagement_Classifier.ipynb # Jupyter notebook version\
├── README.md\
├── online_gaming_behavior_dataset.csv # (received from kaggle)


## ✅ Example Output

Accuracy: 0.91
Predicted Engagement Level: High

---
## 📬 Contact

Michael Tartamella\
📧 mtartamella117@gmail.com\
🔗 linkedin.com/in/michael-tartamella
