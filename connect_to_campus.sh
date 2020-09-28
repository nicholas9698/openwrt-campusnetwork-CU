#!/usr/bin/env bash
routerIP=$(python3 getRouterIP.py)
Cookies=$(python3 getSessionId.py)
JSESSIONID=""
route=""
eval $(echo $Cookies | awk '{printf("JSESSIONID=%s;route=%s",$1,$2)}')
UserInfo=$(python3 getUserInfo.py)
UserName=""
Password=""
SchoolId=""
BaseIP=""
eval $(echo $UserInfo | awk '{printf("UserName=%s;Password=%s;SchoolId=%s;BaseIP=%s",$1,$2,$3,$4)}')
curl $'http://139.198.3.98/sdjd/protalAction\u0021portalAuth.action' \
-H 'Connection: keep-alive' \
-H 'Accept: application/json, text/javascript, */*; q=0.01' \
-H 'X-Requested-With: XMLHttpRequest' \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36' \
-H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
-H 'Origin: http://139.198.3.98' \
-H $'Referer: http://139.198.3.98/sdjd/protalAction\u0021loginInit.action?wlanuserip='${routerIP}'&basip='$BaseIP'' \
-H 'Accept-Language: zh-CN,zh;q=0.9' \
-H 'Cookie: JSESSIONID='${JSESSIONID}'; lt=1; route='${route}'' \
--data-raw 'wlanuserip='${routerIP}'&localIp=&basip='$BaseIP'&lt=1&lpsUserName='$UserName'&lpsPwd='$Password'&schoolId='$SchoolId'&rmbUser=on' \
--compressed \
--insecure;
