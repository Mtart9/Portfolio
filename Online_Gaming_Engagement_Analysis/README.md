# 🎮 Online Gaming Engagement Classifier

This project uses a machine learning pipeline built with XGBoost to classify **player engagement levels** in online gaming environments. It analyzes demographic and behavioral patterns to predict whether a player’s engagement is `Low`, `Medium`, or `High`.

## 🧠 Objective

To develop a classification model that helps game developers and analysts understand player engagement by using features such as:

- Age, Gender, and Location  
- Game genre and difficulty  
- Average session duration and session frequency  
- In-game purchase activity  

## 🔍 Dataset

The dataset contains anonymized player data and includes:

- **Demographics**: Age, Gender, Location  
- **Behavioral metrics**: Sessions per week, Average session duration  
- **Game attributes**: Game genre, Difficulty  
- **Purchase behavior**: In-game purchases  
- **Target variable**: Engagement Level (`Low`, `Medium`, `High`)

Dataset source: [Kaggle - Predict Online Gaming Behavior Dataset](https://www.kaggle.com/datasets/rabieelkharoua/predict-online-gaming-behavior-dataset)

## ⚙️ Modeling Pipeline

- **Preprocessing**:  
  - One-hot encoding for categorical variables  
  - Label encoding of target variable  
  - Missing value checks

- **Model**:  
  - XGBoost Classifier  
  - Stratified K-Fold Cross-Validation  
  - Hyperparameter tuning via GridSearchCV  

- **Evaluation**:  
  - Accuracy score  
  - Confusion matrix  
  - Classification report  

## 🛠 Tools and Libraries

- Python  
- `pandas`, `scikit-learn`, `xgboost`  

## 📁 Project Structure


├── Online_Gaming_Engagement_Classifier.py    # Main training and evaluation script\
├── online_gaming_behavior_dataset.csv        # Source dataset\
├── README.md


## ✅ Sample Output

```
Best parameters: {'learning_rate': 0.1, 'max_depth': 5, 'n_estimators': 200, 'subsample': 1.0}
Best cross-validation score: 0.9143

Confusion Matrix:
[[43  2  1]
 [ 1 38  3]
 [ 0  2 40]]

Accuracy: 0.91
```

## 📬 Contact

**Michael Tartamella**  
📧 mtartamella117@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/michael-tartamella/)
