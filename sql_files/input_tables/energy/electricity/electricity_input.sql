/*In this table we are going to input the residential and commerical energy of each city by utility.
If the city has only 1 utility, then write 0 in each of the remaing fields for utilities*/

CREATE TABLE city_metrics_electric_input
(
  id SERIAL PRIMARY KEY,
  city_id INT REFERENCES city_metrics_city(id) NOT NULL,
  year VARCHAR (4) NOT NULL,

  utility_id1 INT REFERENCES city_metrics_energy_utilities(id) NOT NULL,
  residential_electricity NUMERIC (16,4) NOT NULL,
  com_and_ind_electricity NUMERIC (16,4) NOT NULL,
  residential_wind_electricity NUMERIC(16,4) NOT NULL,
  com_and_ind_wind_electricity NUMERIC(16,4) NOT NULL,

  utility_id2 INT REFERENCES city_metrics_energy_utilities(id),
  residential_electricity2 NUMERIC (16,4),
  com_and_ind_electricity2 NUMERIC (16,4),
  residential_wind_electricity2 NUMERIC(16,4),
  com_and_ind_wind_electricity2 NUMERIC(16,4),

  utility_id3 INT REFERENCES city_metrics_energy_utilities(id),
  residential_electricity3 NUMERIC (16,4),
  com_and_ind_electricity3 NUMERIC (16,4),
  residential_wind_electricity3 NUMERIC(16,4),
  com_and_ind_wind_electricity3 NUMERIC(16,4)
);

COPY city_metrics_electric_input FROM 'C:/csv_files/city_metrics_electric_input.csv' DELIMITER ',' CSV HEADER;
