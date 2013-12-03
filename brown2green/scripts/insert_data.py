#!/usr/bin/python

import os
import sys

#read all lines from input file specified on command line
with open(sys.argv[1]) as file:
	lines = file.readlines()

#initialize variables for loop
count=0
row_one = []
cols = []
header_string = "" 

#for each line of the file, begin creating the insert sql statement
#write each insert statement to file specified on command line
for line in lines:
	if (count==0):
		row_one = line.split("\t")
		count += 1
		header_string += row_one[0].rstrip()
		for x in range(1,len(row_one)):
			header_string += ", " + row_one[x].rstrip()
	else:
		cols = line.split("\t")
		values_string = "'" +  cols[0].rstrip() + "'"
		for x in range(1,len(cols)):
			values_string += ", '" + cols[x].rstrip() + "'"
		#insert data into database
		print
		os.system("echo \"insert into " + sys.argv[2] + "(" + header_string + ") values(" + values_string + ");\" >> " + sys.argv[3])
		print
