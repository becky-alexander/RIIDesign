CREATE TABLE city_metrics_water_input
(
  id SERIAL PRIMARY KEY,
  city_id INT references city_metrics_city(id),
  year VARCHAR(4),
  residential_water NUMERIC(16,4),
  commerical_water NUMERIC(16,4),
  industrial_water NUMERIC(16,4),
  other_water NUMERIC(16,4)

);

COPY city_metrics_water_input (city_id,year,residential_water,commerical_water,industrial_water,other_water) FROM 'C:/csv_files/city_metrics_water_input.csv' DELIMITER ',' CSV HEADER;
