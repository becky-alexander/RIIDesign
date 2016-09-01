import urllib
import os.path
import csv
import psycopg2

try:

	url = 'http://www.mngeo.state.mn.us/CTU/CTU.csv'
	filename = 'city_townships_counties.csv'

	urllib.urlretrieve(url, filename)
except:
	print "Sorry couldn't enter the mngeo data"


try:
    conn = psycopg2.connect("dbname='postgres' user='postgres' host='localhost' password='Lhb1234'")
except:
    print ("I am unable to connect to the database")

cur = conn.cursor()
# Make a SQL table
cur.execute('CREATE TABLE local_govts (id serial PRIMARY KEY,  GNIS_FEATURE varchar(100), FEATURE_NAME varchar(100), CTU_TYPE VARCHAR(100), LATITUDE numeric(16,8), LONGITUDE numeric(16,8), CENSUS_CODE INT, COUNTY_NAME VARCHAR(50), CONTY_CODE_AND_FEATURE_ID NUMERIC(16,4), STATE_COUNTY_CODES_FEATURE_ID NUMERIC(18,4), COUNTY_CODE_AND_CENSUS_CODE NUMERIC(18,4), FIPS NUMERIC(18,4), ACTIVE_OR_HISTORICAL VARCHAR(100))')
conn.commit()
cur.close()
#conn.close()

f = open('city_townships_counties.csv')
csv_f = csv.reader(f)
f.next()

cur = conn.cursor()

for row in csv_f:
	gnis_feature = row[1]
	feature_name = row[2]
	ctu_type = row[3]
	latitude = row[4]
	longitude = row[5]
	census_code = row[6]
	county_name = row[8]
	county_code_and_feature_id = row[9]
	state_county_codes_and_feature_id = row[10]
	county_code_and_census_code = row[11]
	fips = row[12]
	active_or_historical = row[13]

 	print 	(gnis_feature, feature_name, ctu_type, latitude, longitude, census_code, county_name, county_code_and_feature_id, state_county_codes_and_feature_id,	county_code_and_census_code, fips, active_or_historical)

	cur.execute('INSERT INTO local_govts (GNIS_FEATURE, FEATURE_NAME, CTU_TYPE, LATITUDE, LONGITUDE, CENSUS_CODE, COUNTY_NAME, CONTY_CODE_AND_FEATURE_ID, STATE_COUNTY_CODES_FEATURE_ID, COUNTY_CODE_AND_CENSUS_CODE, FIPS, ACTIVE_OR_HISTORICAL) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', (gnis_feature, feature_name, ctu_type, latitude, longitude, census_code, county_name, county_code_and_feature_id, state_county_codes_and_feature_id, county_code_and_census_code, fips, active_or_historical))

conn.commit()
cur.close()
conn.close()
