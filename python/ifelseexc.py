#!/usr/bin/env python3.6

user = {"admin": True, "active": True, "name": 'Vimal'}
prefix =""

if user['admin'] and user['active']:
    prefix="Active - Admin"
elif user['admin']:
    prefix="Admin"
elif user['active']:
    prefix="Active"

print(f"testing the input {prefix},  {user['name']}")