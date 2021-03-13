#!usr/bin/python 

from operator import itemgetter
import sys

dict_ip_count = {}

for line in sys.stdin:
	line = line.strip()
	ip, num = line.split('\t')
	try:
		num = int(num)
		dict_ip_count[ip] = dict_ip_count.get(ip, 0) + num 

	except ValueError:
		pass 

sorted_dic_ip_count = sorted(dict_ip_count.items(), key=itemgetter(0))
for up, count in sorted_dic_ip_count:
	print ('%s\t%s' % (ip, count))
