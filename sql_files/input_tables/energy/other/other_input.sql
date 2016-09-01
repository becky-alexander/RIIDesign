CREATE TABLE city_metrics_other_energy

(
  id SERIAL PRIMARY KEY,
  city_id INT REFERENCES city_metrics_city(id) NOT NULL,
  year VARCHAR(4) NOT NULL,

  other_fuel_type1 INT REFERENCES city_metrics_energy_utilities(id) NOT NULL,
  other_fuel_amount1_residential NUMERIC (16,4) NOT NULL,
  other_fuel_amount1_com_and_ind NUMERIC (16,4) NOT NULL,

  other_fuel_type2 INT REFERENCES city_metrics_energy_utilities(id) NOT NULL,
  other_fuel_amount2_residential NUMERIC (16,4) NOT NULL,
  other_fuel_amount2_com_and_ind NUMERIC (16,4) NOT NULL,

  other_fuel_type3 INT REFERENCES city_metrics_energy_utilities(id) NOT NULL,
  other_fuel_amount3_residential NUMERIC (16,4) NOT NULL,
  other_fuel_amount3_com_and_ind NUMERIC (16,4) NOT NULL,

  other_fuel_type4 INT REFERENCES city_metrics_energy_utilities(id) NOT NULL,
  other_fuel_amount4_residential NUMERIC (16,4) NOT NULL,
  other_fuel_amount4_com_and_ind NUMERIC (16,4) NOT NULL

);
