CREATE TABLE city_metrics_cost_factor_nat_gas
(
id SERIAL PRIMARY KEY,
year VARCHAR(4),
type VARCHAR(50),
residential_nat_gas NUMERIC (16,4),
com_and_ind_firm NUMERIC (16,4),
com_and_ind_interruptible NUMERIC (16,4),
commerical_nat_gas NUMERIC (16,4),
industrial_nat_gas NUMERIC (16,4),

);

COPY city_metrics_cost_factor_nat_gas FROM 'C:/csv_files/city_metrics_cost_factor_nat_gas.csv' DELIMITER ',' CSV HEADER;
