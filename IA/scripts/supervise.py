import sys, json
import pandas as pd
import sklearn as sk
from sklearn.neighbors import KNeighborsClassifier

# Specify the file path of the JSON file
file_path_output = '../jsons/requests/getGravite.json'


def  KnnClassification_sk_learn(fichier_accident, un_accident):
    data_accident= pd.read_csv(fichier_accident)
    accident = pd.read_csv(un_accident)
    accident = accident.drop(columns=["latitude", "longitude"], axis=1) 
    data_accident = data_accident.drop(columns=["latitude", "longitude"], axis=1) 

    knn = KNeighborsClassifier(n_neighbors=7, metric = 'manhattan') #creation de l'objet knn 
    knn.fit(data_accident.drop(columns=["descr_grav"], axis=1), data_accident['descr_grav']) # apprentissage 
    y_pred = knn.predict(accident) #prédiction
  
    return y_pred.tolist()

prediction_gravite = KnnClassification_sk_learn(sys.argv[1], sys.argv[2])

with open(file_path_output, 'w') as file:
    # Use the json.dump() function to write the list to the file
    json.dump(prediction_gravite, file)
