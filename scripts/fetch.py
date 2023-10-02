import json
import re
import sys

import requests

session = requests.Session()
session.headers.update(
    {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/117.0",
    }
)

response = session.get(
    "https://airtable.com/appO5SjrHmmAvfP27/shrYnsCb5j4NnoWTG/tblgI0KbgdTmF2YkJ",
)
json_str = re.search("window.initData = ({.*?});", response.text).group(1)

init_data = json.loads(json_str)

params = {
    "x-time-zone": "America/Detroit",
    "x-airtable-application-id": init_data["singleApplicationId"],
    "accessPolicy": init_data["accessPolicy"],
}

response = session.get(
    "https://airtable.com/v0.3/view/viwT9G6w3PwLyAgJm/downloadCsv", params=params
)

print(response.text.replace("ï»¿", ""))
