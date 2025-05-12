import pandas as pd
from sklearn.model_selection import train_test_split
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
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)


# Initialize and train XGBoost model
model = XGBClassifier(eval_metric='mlogloss')  # For classification
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)

# Evaluation
print("\nConfusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("\nClassification Report:\n", classification_report(y_test, y_pred))
print("Accuracy:", accuracy_score(y_test, y_pred))

print("\n--- Predict Engagement Level ---")
input_data = {}

# --- Include all numeric features used in training ---
input_data['PlayTimeHours'] = float(input("Enter PlayTimeHours: "))
input_data['SessionsPerWeek'] = int(input("Enter SessionsPerWeek: "))
input_data['AvgSessionDurationMinutes'] = float(input("Enter AvgSessionDurationMinutes: "))
input_data['PlayerLevel'] = int(input("Enter PlayerLevel: "))
input_data['AchievementsUnlocked'] = int(input("Enter AchievementsUnlocked: "))
input_data['Age'] = int(input("Enter Age: "))
input_data['InGamePurchases_1'] = int(input("Did the player make in-game purchases? (1=yes, 0=no): "))

# --- Categorical dummy inputs ---

# Gender
gender = input("Is the player Male? (1=yes, 0=no): ").strip()
input_data['Gender_Male'] = int(gender)

# Location
location = input("Where is the player from? (Europe/Other/USA): ").strip().lower()
input_data['Location_Europe'] = 1 if location == 'europe' else 0
input_data['Location_Other'] = 1 if location == 'other' else 0
input_data['Location_USA'] = 1 if location == 'usa' else 0

# GameGenre
genre = input("What is the game genre? (RPG/Simulation/Sports/Strategy/Other): ").strip().lower()
input_data['GameGenre_RPG'] = 1 if genre == 'rpg' else 0
input_data['GameGenre_Simulation'] = 1 if genre == 'simulation' else 0
input_data['GameGenre_Sports'] = 1 if genre == 'sports' else 0
input_data['GameGenre_Strategy'] = 1 if genre == 'strategy' else 0
input_data['GameGenre_Other'] = 1 if genre == 'other' else 0

# GameDifficulty
difficulty = input("What is the game difficulty? (Easy/Medium/Hard): ").strip().lower()
input_data['GameDifficulty_Easy'] = 1 if difficulty == 'easy' else 0
input_data['GameDifficulty_Medium'] = 1 if difficulty == 'medium' else 0
input_data['GameDifficulty_Hard'] = 1 if difficulty == 'hard' else 0

# --- Convert to DataFrame with matching column order ---
user_df = pd.DataFrame([input_data], columns=X.columns)

# --- Predict and decode label ---
user_pred = model.predict(user_df)
predicted_label = label_encoder.inverse_transform(user_pred)[0]

print(f"\n✅ Predicted Engagement Level: {predicted_label}")
