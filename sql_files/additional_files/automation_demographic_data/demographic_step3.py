from demographic_step2 import *
import psycopg2
from psycopg2.extensions import AsIs

pea = list()

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

    t = papa[0]
    ll = (str.rstrip(t[6:]))
    ll = ll.replace("St.", "Saint")
    ll = ll.replace("St", "Saint")
    ll = ll.replace("""'""", "")

    t = papa[1]
    y = (str.rstrip(t[6:]))
    y = y.replace(" city", "")
    y = y.replace("St.", "Saint")
    y = y.replace("St", "Saint")
    y = y.replace("""'""", "")

    tt = papa[2]
    yy = (str.rstrip(tt[7:11]))

    ttt = papa[3]
    yyy = (str.rstrip(ttt[7:]))


    tttt = papa[4]
    yyyy = (str.rstrip(tttt[7:]))

    papa2 = list()
    papa2 = (ll.title(), y.title(), str(yy), yyy, yyyy)
    print (papa2)

    yr = papa2[2]
    county = papa2[0]
    city = papa2[1]
    try:
        pop = float(papa2[3])
    except:
        pop = float(0)
    try:
        households = float(papa2[4])
    except:
        households = float(0)

    cur.execute('INSERT INTO population (year, county, city, population, households) VALUES (%s, %s, %s, %s, %s)', (yr, county, city, pop, households))

conn.commit()
cur.close()
conn.close()
