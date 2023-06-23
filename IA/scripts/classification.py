import sys
import pandas as pd
import joblib
import json
import numpy as np

dataX = pd.read_csv(sys.argv[1])
modelpath = sys.argv[2]


model = joblib.load(modelpath)
pred = model.predict(dataX)


dfdict = dataX.to_dict(orient='records')[0]
dfdict['descr_grav'] = pred.tolist()[0]

output_file = "../jsons/requests/classPred.json"
with open(output_file, 'w') as json_file:
    print(dfdict)
    json.dump(dfdict, json_file)