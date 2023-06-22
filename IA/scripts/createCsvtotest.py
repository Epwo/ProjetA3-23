import pandas as pd

df = pd.read_csv("../dfClean.csv")

ligne = df.iloc[350]
feature_columns = df.columns.drop('descr_grav')
X = ligne[feature_columns].values.reshape(1, -1)
X_df = pd.DataFrame(X, columns=feature_columns)

X_df.to_csv("../csvLigne.csv",index=False)

