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
    sys.argv[1]
)
json_str = re.search("window.initData = ({.*?});", response.text).group(1)

init_data = json.loads(json_str)

params = {
    "x-time-zone": "America/Detroit",
    "x-airtable-application-id": init_data["singleApplicationId"],
    "accessPolicy": init_data["accessPolicy"],
}

response = session.get(
    f"https://airtable.com/v0.3/view/{init_data['sharedViewId']}/downloadCsv", params=params
)

print(response.text.replace("ï»¿", ""))
