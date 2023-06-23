import pandas as pd
import sys

df = pd.read_csv("../dfClean.csv")
loc = sys.argv[1]

ligne = df.iloc[int(loc)]
print(ligne)
feature_columns = df.columns.drop('descr_grav')
X = ligne[feature_columns].values.reshape(1, -1)
X_df = pd.DataFrame(X, columns=feature_columns)

X_df.to_csv("../csvLigne.csv",index=False)

