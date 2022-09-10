#!/usr/bin/env python3

import json

data = open("packages.json","rt").read()
data = json.loads(data)

for k in data:
    print("%s: %s" % (k, data[k]["version"]) )
    print("%s" % data[k]["copyright"] )
    print("")
