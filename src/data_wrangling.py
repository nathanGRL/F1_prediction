import requests
import pandas as pd

def extract_all_openf1_data(session_key):
    """Extract data from all OpenF1 endpoints for a given session_key"""
    endpoints = {
        'car_data': 'https://api.openf1.org/v1/car_data',
        'drivers': 'https://api.openf1.org/v1/drivers',
        'laps': 'https://api.openf1.org/v1/laps',
        'pit': 'https://api.openf1.org/v1/pit',
        'stints': 'https://api.openf1.org/v1/stints',
        'weather': 'https://api.openf1.org/v1/weather'
    }
    
    dataframes = {}
    
    for name, url in endpoints.items():
        try:
            print(f"Extracting {name}...")
            params = {'session_key': session_key}
            response = requests.get(url, params=params)
            response.raise_for_status()
            data = response.json()
            
            # Ensure data is a list for DataFrame creation
            if not isinstance(data, list):
                data = [data]
            
            df = pd.DataFrame(data)
            dataframes[name] = df
            print(f"✓ {name}: {len(df)} records extracted")
            
        except Exception as e:
            dataframes[name] = pd.DataFrame()
            print(f"✗ Failed to extract {name}: {e}")
    
    return dataframes

# Usage: Extract all data for a specific session
session_key = 9159  # Replace with your desired session key
all_data = extract_all_openf1_data(session_key)

# Access individual DataFrames
car_data_df = all_data['car_data']
drivers_df = all_data['drivers']
laps_df = all_data['laps']
pit_df = all_data['pit']
stints_df = all_data['stints']
weather_df = all_data['weather']

# Display info about each DataFrame
for name, df in all_data.items():
    print(f"\n{name.upper()} DataFrame:")
    print(f"Shape: {df.shape}")
    print(f"Columns: {list(df.columns)}")
