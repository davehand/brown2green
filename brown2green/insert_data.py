#!/usr/bin/python

import os

with open("data") as file:
	lines = file.readlines()

for line in lines:
	cols = line.split(",")
	print cols[0].rstrip()
	print cols[1].rstrip()
	print cols[2].rstrip()
	#insert data into database
	print
	os.system('ls -al')

