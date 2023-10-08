import pandas as pd
import numpy as np
import warnings
import numpy as np
from scipy.spatial.distance import euclidean
from fastdtw import fastdtw
import pickle
import sys

warnings.filterwarnings('ignore')

train_data = pd.read_csv('./train_data.csv').values.reshape(-1, 120, 3)
test_data = np.load(str(sys.argv[1])).reshape(120, 3)

# Calculate dtw distance
def dtw_distance(series1, series2):
    """Compute the Dynamic Time Warping distance between two series."""
    distance, _ = fastdtw(series1, series2, dist=euclidean)
    return distance

n = len(train_data)

distances = np.zeros(n)
for i in range(n):
    distances[i] = dtw_distance(test_data, train_data[i])

distances = distances.reshape(1, 240)

# K-Means Clustering
# model load
with open('kmeans.pkl', 'rb') as f:
    loaded_kmeans = pickle.load(f)

predictions = loaded_kmeans.predict(distances)

print(predictions[0])