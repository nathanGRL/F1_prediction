import pandas as pd

destination_file = "G:\My Drive\Portfolio\F1_Prediction\data"

df = pd.read_csv(destination_file + "\kaggle_archive\circuits.csv")
print(df.head())
print(df.info())