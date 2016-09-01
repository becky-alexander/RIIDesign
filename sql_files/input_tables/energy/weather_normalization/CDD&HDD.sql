CREATE TABLE city_metrics_cdd_hdd
(
  id SERIAL PRIMARY KEY,
  year VARCHAR (4) NOT NULL,
  cdd NUMERIC(16,4),
  hdd NUMERIC(16,4)
);

COPY city_metrics_cdd_hdd FROM 'C:/csv_files/city_metrics_cdd_hdd.csv' DELIMITER ',' CSV HEADER;

CREATE VIEW city_metrics_cdd_hdd_average AS
SELECT

(AVG(city_metrics_cdd_hdd.cdd))AS cdd_average,
(AVG(city_metrics_cdd_hdd.hdd))AS hdd_average

FROM city_metrics_cdd_hdd
