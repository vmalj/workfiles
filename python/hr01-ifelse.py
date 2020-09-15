#!/usr/bin/env python3.6

# Given an integer, perform the following conditional actions:
#     If n is odd, print Weird
#     If n is even and in the inclusive range of 2 to 5, print Not Weird
#     If n is even and in the inclusive range of 6 to 20, print Weird
#     If n is even and greater than 20, print Not Weird

import sys

n = int(input("Enter a number:"))

if n%2==0 and (n>2 or n in range(2,6)):
    print(f"{n} is not weird")
else:
    print(f"{n} is weird")
