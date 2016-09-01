from vmt_step2 import *
from operator import itemgetter
from itertools import groupby
import psycopg2
from psycopg2.extensions import AsIs

pea = list()
resultFile = open("output.csv",'wb')
num_cols = xl_sheet.ncols   # Number of columns

#Opening the database #
try:
    conn = psycopg2.connect("dbname='postgres' user='postgres' host='localhost' password='Lhb1234'")
except:
    print ("I am unable to connect to the database")

cur = conn.cursor()



for row_idx in range(1, xl_sheet.nrows):    # Iterate through rows
    papa = list()
    d = {row_idx:[]}
    #print (row_idx)
    for col_idx in range(0, num_cols):
        cell_obj = xl_sheet.cell(row_idx, col_idx)
        papa.append(str(cell_obj))


    t = papa[1]
    y = (str.rstrip(t[12:]))
    y = y.replace("""'""", "")

    tt = papa[2]
    yy = (str.rstrip(tt[12:]))
    yy = yy.replace("""'""", "")
    yy = yy.replace("- ", "")
    yy = yy.replace("KS)-NONMUNICPAL", "nonmunicipal")
    yy = yy.replace("NICIPAL", "nonmunicipal")

    ttt = papa[3]
    yyy = (str.rstrip(ttt[12:]))
    yyy = yyy.replace("""'""", "")
    yyy = yyy.replace("ISTH  ", "")
    yyy = yyy.replace("MNTH  ", "")
    yyy = yyy.replace("CSAH  ", "")
    yyy = yyy.replace("CNTY  ", "")
    yyy = yyy.replace("USTH  ", "")
    yyy = yyy.replace("MUN   ", "")
    yyy = yyy.replace("MSAS  ", "")
    yyy = yyy.replace("MSAS - ", "")
    yyy = yyy.replace("9 - ", "")
    yyy = yyy.replace("CR - COUNTY ROAD", "County")
    yyy = yyy.replace("CSAH - County State-Aid Highway", "County State-Aid")
    yyy = yyy.replace("23 - ", "")
    yyy = yyy.replace("MN - ", "")
    yyy = yyy.replace("US - ", "")
    yyy = yyy.replace("M - ", "")
    yyy = yyy.replace("CR - ", "")
    yyy = yyy.replace("I - ", "")
    yyy = yyy.replace("T - ", "")
    yyy = yyy.replace(" Highway", "")
    yyy = yyy.replace(" Road", "")
    yyy = yyy.replace("SPRK - ", "")
    yyy = yyy.replace("NATW - ", "")
    yyy = yyy.replace("SFOR - ", "")
    yyy = yyy.replace(" State-Aid", " STATE AID")
    yyy = yyy.replace("Streets", "")
    yyy = yyy.replace("Street", "STREETS")
    yyy = yyy.replace("MUNIC.", "MUNICIPAL")
    tttt = papa[5]
    yyyy = (str.rstrip(tttt[7:]))

    papa2 = list()
    papa2 = (("20%s")%x, y.title(), yy.title(), yyy.title(), yyyy)
    #print (papa2)

# Makings Lists

    yr = papa2[0]
    county = papa2[1]
    city = papa2[2]
    typx = papa2[3]
    try:
        vmts = float(papa2[4])
    except:
        vmts = 0
    print (papa2)

# Make a SQL table
    #qwert = ("INSERT INTO city_metrics_vmt_auto (year, county, city, type, vmt) VALUES (%s, "b", 'c', 'd', '100')", 'this')
    cur.execute('INSERT INTO %s (year, county, city, type, vmt) VALUES (%s, %s, %s, %s, %s)', (AsIs(pyc), yr, county, city, typx, vmts))

    #cur.execute(qwert)


conn.commit()
cur.close()
conn.close()
