#!/usr/bin/python3
import json
import sys
import os

# from pprint import pprint

print("This will setup local gulp environment and link to global node packages under /usr/local/lib/node_modules")

print('Reading packages.json file...')

with open('package.json') as file:
    data = json.load(file)

devDeps = data['devDependencies']

# os.system("npm install --global gulp")

for dep in devDeps:
    print("Linking development dependancy: %s" % dep)
    os.system("npm link %s" % dep)

deps = data['dependencies']

for dep in deps:
    print("Installing project dependancy: %s" % dep)
    os.system("npm install %s" % dep)
