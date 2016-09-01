import urllib
import os.path

try:

	url = 'https://mn.gov/admin/assets/mn_cities_townships_historical_estimates_sdc_2000-2015_tcm36-250313.xlsx'
	filename = 'demographic_year_2000-2015.xlsx'

	urllib.urlretrieve(url, filename)
except:
	print "Sorry couldn't enter the demographic data"
