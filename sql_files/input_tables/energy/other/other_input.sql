CREATE TABLE city_metrics_other_energy_type

(
  id SERIAL PRIMARY KEY,
  other_fuel_name VARCHAR(50),
  unit VARCHAR(50),
  kbtu NUMERIC(16,4),
  ghg_tonnes NUMERIC(16.4),
  GHG_per_Kbtu NUMERIC(16,4)

);



COPY city_metrics_electric_input FROM 'C:/csv_files/city_metrics_other_energy_type.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE city_metrics_other_energy_input
/* For this one look at the RII sheet, the tab that says "Other Fuels Summary"*/
(
  id SERIAL PRIMARY KEY,
  city_id INT REFERENCES city_metrics_city(id) NOT NULL,
  year VARCHAR(4) NOT NULL,

  other_fuel_type1 INT REFERENCES city_metrics_other_energy_type(id) NOT NULL,
  other_fuel_amount1_residential NUMERIC (16,4) NOT NULL,
  other_fuel_amount1_com_and_ind NUMERIC (16,4) NOT NULL,

  other_fuel_type2 INT REFERENCES city_metrics_other_energy_type(id) NOT NULL,
  other_fuel_amount2_residential NUMERIC (16,4),
  other_fuel_amount2_com_and_ind NUMERIC (16,4),

  other_fuel_type3 INT REFERENCES city_metrics_other_energy_type(id) NOT NULL,
  other_fuel_amount3_residential NUMERIC (16,4),
  other_fuel_amount3_com_and_ind NUMERIC (16,4),

  other_fuel_type4 INT REFERENCES city_metrics_other_energy_type(id) NOT NULL,
  other_fuel_amount4_residential NUMERIC (16,4),
  other_fuel_amount4_com_and_ind NUMERIC (16,4),

  other_fuel_type5 INT REFERENCES city_metrics_other_energy_type(id) NOT NULL,
  other_fuel_amount5_residential NUMERIC (16,4),
  other_fuel_amount5_com_and_ind NUMERIC (16,4)

);

COPY city_metrics_electric_input FROM 'C:/csv_files/city_metrics_electric_input.csv' DELIMITER ',' CSV HEADER;
