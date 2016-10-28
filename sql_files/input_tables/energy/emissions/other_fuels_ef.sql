/*In this table we are going to register any new utiliy. Please check that the utility has not already been registed */

CREATE TABLE city_metrics_energy_utilities_emission_factors
(
  id SERIAL PRIMARY KEY,
  year VARCHAR(4),
  utility_id INT REFERENCES city_metrics_energy_utilities(id),
  type VARCHAR (50),
  co2_ef NUMERIC(16,4),
  n2o_ef NUMERIC(16,4),
  ch4_ef NUMERIC(16,4)
);

COPY city_metrics_energy_utilities_emission_factors FROM 'C:/csv_files/city_metrics_energy_utilities_emission_factors.csv' DELIMITER ',' CSV HEADER;

CREATE OR REPLACE VIEW  city_metrics_estimated_energy_emission_factor AS
SELECT

city_metrics_energy_utilities_emission_factors.year,

city_metrics_energy_utilities_emission_factors.co2_ef,
city_metrics_energy_utilities_emission_factors.n2o_ef,
city_metrics_energy_utilities_emission_factors.ch4_ef,
city_metrics_energy_utilities_emission_factors.utility_id,

CASE WHEN ((((city_metrics_energy_utilities_emission_factors.co2_ef * 1) + (city_metrics_energy_utilities_emission_factors.n2o_ef * 310) +
(city_metrics_energy_utilities_emission_factors.ch4_ef * 21))/2204.6)) < 0.005499
AND ((((city_metrics_energy_utilities_emission_factors.co2_ef * 1) + (city_metrics_energy_utilities_emission_factors.n2o_ef * 310) +
(city_metrics_energy_utilities_emission_factors.ch4_ef * 21))/2204.6)) > 0.001
THEN 0.005499
ELSE (((city_metrics_energy_utilities_emission_factors.co2_ef * 1) + (city_metrics_energy_utilities_emission_factors.n2o_ef * 310) +
(city_metrics_energy_utilities_emission_factors.ch4_ef * 21))/2204.6)
END AS emission_factor

FROM city_metrics_energy_utilities_emission_factors
/* The numbers 1, 310 and 21 in the second to last line correspond the Global Warming Potential of each gas: CO2, N20 and CH4 correspondingly. */
/* The nummber 2204.6 is to convert the number from pounds to kg */
