CREATE TABLE city_metrics_cost_factor_electricity
(
id SERIAL PRIMARY KEY,
year VARCHAR(4),
/*NSP*/
residential_electricity_nsp NUMERIC (16,4),
commerical_electricity_nsp NUMERIC (16,4),
industrial_electricity_nsp NUMERIC (16,4),
retail_electricity_nsp NUMERIC (16,4),

/*Average Minnesota*/

);

COPY city_metrics_cost_factor_electricity FROM 'C:/csv_files/city_metrics_cost_factor_electricity.csv' DELIMITER ',' CSV HEADER;
