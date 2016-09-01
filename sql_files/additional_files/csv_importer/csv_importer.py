import csv
import psycopg2

conn_string = "dbname='lhbweb' user='lhbadmin' host='localhost' password='egBdf909'"
conn = psycopg2.connect(conn_string)
cursor = conn.cursor()


with open('city_metrics_demographicdata_county.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        print row
COPY city_metrics_demographicdata_county.csv 'M:\10Proj\100169\500 Technical\503 Calculations\sql files\additional_files\csv_importer\city_metrics_demographicdata_county.csv' DELIMITER ',' CSV HEADER;
