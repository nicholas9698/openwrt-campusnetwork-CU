import json
with open("userinfo.json",encoding="utf-8") as f:
    data = json.load(f)
    userName = data['UserName']
    password = data['Password']
    schoolId = data['SchoolId']
    baseIP = data['BaseIP']
    print(userName,password,schoolId,baseIP)
