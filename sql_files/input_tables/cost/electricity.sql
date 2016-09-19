CREATE TABLE city_metrics_cost_factor_electricity
(

id SERIAL PRIMARY KEY,
year VARCHAR(4),
type VARCHAR(50),
residential_electricity NUMERIC(16,4),
commerical_electricity NUMERIC(16,4),
industrial_electricity NUMERIC(16,4),
retail_electricity NUMERIC(16,4)

);

COPY city_metrics_electric_input FROM 'C:/csv_files/city_metrics_cost_factor_electricity.csv' DELIMITER ',' CSV HEADER;


/* This table stores the cost factors per year for electricity*/
