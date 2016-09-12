/*Remember that the demographic data for county is separated from the demographic data for city, but they both connect to each other*/

CREATE TABLE city_metrics_county
(
  id SERIAL PRIMARY KEY,
  county VARCHAR(50)
);

COPY city_metrics_county FROM 'C:/csv_files/city_metrics_county.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE city_metrics_demographicdata_county
(
  id SERIAL PRIMARY KEY,
  year VARCHAR(4),
  county_id INT REFERENCES city_metrics_county(id),
  population NUMERIC(16,4)
);
COPY city_metrics_demographicdata_county FROM 'C:/csv_files/city_metrics_demographicdata_county.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE city_metrics_city
(
  id SERIAL PRIMARY KEY,
  city VARCHAR(100) NOT NULL,
  county_id INT REFERENCES city_metrics_county(id),
  state VARCHAR(100) NOT NULL,
  type VARCHAR(100),
  sort_order INT
);

COPY city_metrics_city FROM 'C:/csv_files/city_metrics_city.csv' DELIMITER ',' CSV HEADER;
