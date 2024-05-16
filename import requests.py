pip install requests
pip install beautifulsoup4

import requests
import selenium 

# Making a GET request
r = requests.get('https://portal.azure.com/#view/Microsoft_Azure_Policy/InitiativeDetailBlade/id/%2Fproviders%2FMicrosoft.Authorization%2FpolicySetDefinitions%2F89c6cddc-1c73-4ac1-b19c-54d1a15a42f2/scopes~/%5B%22%2Fsubscriptions%2F1eea9e59-cf87-48e9-bbd0-105671b9e716%22%5D/inContextBlade~/false')

# check status code for response received
# success code - 200
print(r)

# print content of request
print(r.content)


# import webdriver 
from selenium import webdriver 

# create webdriver object 
driver = webdriver.Firefox() 

# get google.co.in 
driver.get("https://google.co.in / search?q = geeksforgeeks") 
