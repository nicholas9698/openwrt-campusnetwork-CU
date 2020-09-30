#Simulate sign-in to get Cookie
#Cookie expiration time is 30 minutes

import requests
import sys

routerIP = sys.argv[1]
login_url = "http://139.198.3.98/sdjd/protalAction!index.action?wlanuserip="+routerIP+"&basip=124.128.40.39"
res = requests.get(login_url)
cookies_org = res.cookies
cookies = requests.utils.dict_from_cookiejar(cookies_org)
if 'JSESSIONID' in cookies:
    print(cookies["JSESSIONID"])
if 'route' in cookies:
    print(cookies["route"])
