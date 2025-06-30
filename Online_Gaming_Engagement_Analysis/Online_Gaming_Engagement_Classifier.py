import pandas as pd
from sklearn.model_selection import train_test_split, StratifiedKFold, GridSearchCV
from sklearn.preprocessing import LabelEncoder
from xgboost import XGBClassifier
from sklearn.metrics import classification_report, accuracy_score, confusion_matrix


# Load the dataset
file_path = "C:/Users/Micha/Desktop/Data/online_gaming_behavior_dataset.csv"
df = pd.read_csv(file_path)
print(df)
print(df.dtypes)
print(type(df.index))

# Check for missing values
print("\nMissing values in each column:")
print(df.isnull().sum())

# Convert specified categorical columns into dummy/indicator variables, dropping the first category to avoid multicollinearity
df = pd.get_dummies(df, columns=['Gender', 'Location', 'GameGenre', 'InGamePurchases', 'GameDifficulty'], drop_first=True)
print(df)
print(df.dtypes)
print(type(df.index))

# Encode the target variable
label_encoder = LabelEncoder()
df['EngagementLevel_encoded'] = label_encoder.fit_transform(df['EngagementLevel'])

# Drop unnecessary columns
X = df.drop(['PlayerID', 'EngagementLevel', 'EngagementLevel_encoded'], axis=1)
y = df['EngagementLevel_encoded'] # This is the target variable
print(y)

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

# Stratified cross-validation for XGBoost
cv = StratifiedKFold(n_splits=4, shuffle=True, random_state=42)

# Define parameter grid for XGBoost
grid_param = {
    'n_estimators': [100, 200],
    'max_depth': [3, 5, 7],
    'learning_rate': [0.05, 0.1, 0.2],
    'subsample': [0.8, 1.0]
}

grid_search = GridSearchCV(
    XGBClassifier(eval_metric='mlogloss'),
    grid_param,
    cv=cv,
    scoring='accuracy',
    n_jobs=-1,
    verbose=1
)
grid_search.fit(X_train, y_train)

print(f"Best parameters: {grid_search.best_params_}")
print(f"Best cross-validation score: {grid_search.best_score_:.4f}")

# Use the best estimator for final training and prediction
model = grid_search.best_estimator_

# Make predictions
y_pred = model.predict(X_test)

# Evaluation
print("\nConfusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("\nClassification Report:\n", classification_report(y_test, y_pred))
print("Accuracy:", accuracy_score(y_test, y_pred))