from __future__ import print_function
from os.path import join, dirname, abspath
import xlrd
import re
import csv
import psycopg2


try:
    conn = psycopg2.connect("dbname='postgres' user='postgres' host='localhost' password='Lhb1234'")
except:
    print ("I am unable to connect to the database")

cur = conn.cursor()
# Make a SQL table
cur.execute('CREATE TABLE population (id serial PRIMARY KEY, year varchar(4), county varchar(50), city varchar(50), population numeric(16,4), households numeric(16,4))')

conn.commit()
cur.close()
conn.close()


fname = join(dirname(dirname(abspath(__file__))), 'automation_demographic_data', 'demographic_year_2000-2015.xlsx')


# Open the workbook
try:
    xl_workbook = xlrd.open_workbook(fname)
except:

    fname = join(dirname(dirname(abspath(__file__))), 'automation_demographic_data', 'demographic_year_2000-2015.xlsx')
    xl_workbook = xlrd.open_workbook(fname)

# List sheet names, and pull a sheet by name
#
sheet_names = xl_workbook.sheet_names()
print('Sheet Names', sheet_names)

xl_sheet = xl_workbook.sheet_by_name(sheet_names[0])

# Pull the first row by index
#  (rows/columns are also zero-indexed)
#
row = xl_sheet.row(0)  # 1st row

# Print 1st row values and types
#
from xlrd.sheet import ctype_text

print('(Column #) type:value')
for idx, cell_obj in enumerate(row):
    cell_type_str = ctype_text.get(cell_obj.ctype, 'unknown type')
    print('(%s) %s %s' % (idx, cell_type_str, cell_obj.value))
