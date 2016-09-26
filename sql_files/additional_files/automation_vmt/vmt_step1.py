#Important!

import urllib
import os.path

x = 00

while x < 10:
	x = x + 1

	try:
		x = str(x).zfill(2)
		url = 'http://www.dot.state.mn.us/roadway/data/reports/vmt/%s_ccr.xls'%x
		filename = 'vmt_year_%s.xls'%x

		urllib.urlretrieve(url, filename)
		x = int(x)
	except:
		print "Sorry there is no data for year", x
x = 10

while x < 16:
	x = x + 1
	try:
		url = 'http://www.dot.state.mn.us/roadway/data/reports/vmt/%s_ccr.xlsx'%x
		filename = 'vmt_year_%s.xlsx'%x
		urllib.urlretrieve(url, filename)
	except:
		print "Sorry there is no data for year", x
