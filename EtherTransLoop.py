import requests
import json
import csv
import pandas as pd
import time


with open('NewDataFile.csv','a') as f: # Use this line to open up a csv file that you will write into. 
    
    addresses=['0xd55ff3ac8482638b1cb4dba5e62a7323057a5c16','0xe3457148b4f535b7a42bf6aaa06c6c92a0b9f9cb','0xad8f33994ec88ab208ada1d286b41c4a39515aed'] # this is a list of ethereum addresses that you want to pull data for. You can replace the list with addresses with a list of addresses of your choosing.
    for address in addresses: #This is the beginning of the loop. THe loop will cycle through the addresses listed in the list just above
        url_address='http://api.etherscan.io/api?module=account&action=txlist&address='+address+'&startblock=4500000&endblock=5590000&sort=asc&apikey=YourAPIKey' #This dynamically iteratively generates an API call by inserting the addresses from the list above. Replace "YourAPIKey" in url_address with your own API key. You can register for a free one via etherscan.io
        data_request=requests.get(url_address) #This creates an object out of the API call you make above
        json=data_request.json()  #This turns the data_request response above into a JSON object. JSON objects are generally easier to use since JSON is a widely supported data format.
        df = pd.DataFrame(json,dtype=object)  #This turns the json object from above, into a dataframe - which is a special kind of data structure in Python. 
        [df.to_csv(f, header=False) for i in range (1)] #This writes the dataframe, which is essentially an array of data, to a CSV line-by-line
        time.sleep(60) #This take a 60 second break in between API calls. That way you don't get your API limits throttled.