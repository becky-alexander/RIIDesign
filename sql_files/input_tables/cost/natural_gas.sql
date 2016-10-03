CREATE TABLE city_metrics_cost_factor_nat_gas
(

id SERIAL PRIMARY KEY,
year VARCHAR(4),
type VARCHAR(50),
residential_nat_gas_firm NUMERIC(16,4),
com_and_ind_nat_gas_interruptible NUMERIC(16,4),
commercial_nat_gas NUMERIC(16,4),
industrial_nat_gas NUMERIC(16,4)

);

COPY city_metrics_electric_input FROM 'C:/csv_files/city_metrics_cost_factor_nat_gas.csv' DELIMITER ',' CSV HEADER;


/* This table stores the cost factors per year for nat_gas*/
