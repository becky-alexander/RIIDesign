CREATE TABLE city_metrics_nat_gas_input
(
  id SERIAL PRIMARY KEY,
  city_id INT REFERENCES city_metrics_city(id) NOT NULL,
  year VARCHAR(4) NOT NULL,
  utility_idA INT REFERENCES city_metrics_energy_utilities(id) NOT NULL,
  residential_nat_gasA NUMERIC (16,4) NOT NULL,
  com_and_ind_nat_gasA NUMERIC (16,4) NOT NULL,

  utility_idB INT REFERENCES city_metrics_energy_utilities(id),
  residential_nat_gasB NUMERIC (16,4),
  com_and_ind_nat_gasB NUMERIC (16,4),

  utility_idC INT REFERENCES city_metrics_energy_utilities(id),
  residential_nat_gasC NUMERIC (16,4),
  com_and_ind_nat_gasC NUMERIC (16,4)
);

COPY city_metrics_nat_gas_input FROM 'C:/csv_files/city_metrics_nat_gas_input.csv' DELIMITER ',' CSV HEADER;
