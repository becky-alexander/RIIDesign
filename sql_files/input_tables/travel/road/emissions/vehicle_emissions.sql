/* BIOFUEL PERCENTAGES */

CREATE TABLE city_metrics_biofuel_percentages
(
  id SERIAL PRIMARY KEY,
  year VARCHAR(4),
  gasoline_ethanol NUMERIC(16,4),
  biodiesel NUMERIC(16,4)
);

COPY city_metrics_biofuel_percentages FROM 'C:/csv_files/city_metrics_biofuel_percentages.csv' DELIMITER ',' CSV HEADER;

/* DISTRIBUTION ANNUAL VEHICLE DISTANCE TRAVELLED */

CREATE TABLE city_metrics_dist_ann_veh_dist_trav
  (
  id SERIAL PRIMARY KEY,
  arterials_heavy_duty_vehicles NUMERIC(16,4),
  arterials_light_trucks NUMERIC(16,4),
  arterials_passenger_cars NUMERIC(16,4),
  local_streets_heavy_duty_vehicles NUMERIC(16,4),
  local_streets_light_trucks NUMERIC(16,4),
  local_streets_passenger_cars NUMERIC(16,4)
);

COPY city_metrics_dist_ann_veh_dist_trav FROM 'C:/csv_files/city_metrics_dist_ann_veh_dist_trav.csv' DELIMITER ',' CSV HEADER;

/* DISTRIBUTION OF FUEL BY VEHICLE TYPE */

CREATE TABLE city_metrics_dist_fuel_veh_type
  (
  id SERIAL PRIMARY KEY,
  diesel_heavy_duty_vehicles NUMERIC(16,8),
  diesel_light_trucks NUMERIC(16,8),
  diesel_passenger_cars NUMERIC(16,8),
  gasoline_heavy_duty_vehicles NUMERIC(16,8),
  gasoline_light_trucks NUMERIC(16,8),
  gasoline_passenger_cars NUMERIC(16,8)
);

COPY city_metrics_dist_fuel_veh_type FROM 'C:/csv_files/city_metrics_dist_fuel_veh_type.csv' DELIMITER ',' CSV HEADER;

/* FUEL ECONOMY ASSUMPTIONS -- updated yearly */

CREATE TABLE city_metrics_fuel_economy_assumptions
(
  id SERIAL PRIMARY KEY,
  year VARCHAR(4),
  avg_car_mpg NUMERIC(16,4),
  avg_ligth_truck_mpg NUMERIC(16,4),
  avg_heavy_duty_truck_mpg NUMERIC(16,4)
);

COPY city_metrics_fuel_economy_assumptions FROM 'C:/csv_files/city_metrics_fuel_economy_assumptions.csv' DELIMITER ',' CSV HEADER;

/* VEHICLE METHANE AND NITROUS OXIDE EMISSION FACTORS */

CREATE TABLE city_metrics_vehicle_ch4_and_n2o_emissions_factor/*g CO2 per mile*/
  (
  id SERIAL PRIMARY KEY,

  ch4_gasoline_passenger_cars NUMERIC(16,4),
  ch4_gasoline_light_trucks NUMERIC(16,4),
  ch4_diesel_passenger_cars NUMERIC(16,4),
  ch4_diesel_light_trucks NUMERIC(16,4),
  ch4_diesel_heavy_duty_vehicles NUMERIC(16,4),

  n2o_gasoline_passenger_cars NUMERIC(16,4),
  n2o_gasoline_light_trucks NUMERIC(16,4),
  n2o_diesel_passenger_cars NUMERIC(16,4),
  n2o_diesel_light_trucks NUMERIC(16,4),
  n2o_diesel_heavy_duty_vehicles NUMERIC(16,4)
);

COPY city_metrics_vehicle_ch4_and_n2o_emissions_factor FROM 'C:/csv_files/city_metrics_vehicle_ch4_and_n2o_emissions_factor.csv' DELIMITER ',' CSV HEADER;

/* VEHICLE CARBON DIOXIDE EMISSION FACTORS */

CREATE TABLE city_metrics_vehicle_co2_emissions_factor/*kg CO2 per gallon*/
  (
  id SERIAL PRIMARY KEY,
  unleaded_gasoline NUMERIC(16,4),
  ethanol NUMERIC(16,4),
  diesel_fuel NUMERIC(16,4),
  biodiesel NUMERIC(16,4)
);

COPY city_metrics_vehicle_co2_emissions_factor FROM 'C:/csv_files/city_metrics_vehicle_co2_emissions_factor.csv' DELIMITER ',' CSV HEADER;
