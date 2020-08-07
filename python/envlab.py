#! /usr/bin/env python3.6

import os

stage = os.getenv("STAGE", default="test").upper()

output = f"You are in {stage}"

if stage.startswith("PROD"):
    output = "Hey" + output

print(output)

#Note: Here I learnt how to use the OS module, and use its getenv function. I ran through some errors due to syntax but now understood it.
