import json, sys


lat = float(sys.argv[1])
long = float(sys.argv[2])
# Specify the file path of the JSON file
file_path_input = '../jsons/data/dictCluster.json'
file_path_output = '../jsons/requests/getCluster.json'

# Open the file in read mode
with open(file_path_input, 'r') as file:
    # Use the json.load() function to load the JSON data from the file
    data = json.load(file)


dictOut = {
    "lat":lat,
    "long":long,
    "cluster":'error'
}

for e in data:
    for coords in data[e]:
        if [lat,long] == coords:
            dictOut["cluster"] = e

with open(file_path_output, 'w') as file:
    # Use the json.dump() function to write the list to the file
    json.dump(dictOut, file)
