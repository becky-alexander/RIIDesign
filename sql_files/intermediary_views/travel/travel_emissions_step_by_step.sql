/* STEP 1 */





CREATE OR REPLACE VIEW city_metrics_travel_intermediary1 AS
SELECT

  city_metrics_vmt_roadway_input.year,
  city_metrics_vmt_roadway_input.city_id,

  /* This is the information that comes directly from the DOT */
  city_metrics_vmt_roadway_input.interstate_trunk_highway,
  city_metrics_vmt_roadway_input.us_trunk_highway,
  city_metrics_vmt_roadway_input.minnesota_trunk_highway,
  city_metrics_vmt_roadway_input.county_state_aid_highway,
  city_metrics_vmt_roadway_input.municipal_state_aid_highway,
  city_metrics_vmt_roadway_input.county_road,
  city_metrics_vmt_roadway_input.municipal_streets,

  /* These are the calculation to obtain the total vmt */
  (city_metrics_vmt_roadway_input.interstate_trunk_highway +
    city_metrics_vmt_roadway_input.us_trunk_highway +
    city_metrics_vmt_roadway_input.minnesota_trunk_highway +
    city_metrics_vmt_roadway_input.county_state_aid_highway +
    city_metrics_vmt_roadway_input.municipal_state_aid_highway +
    city_metrics_vmt_roadway_input.county_road +
    city_metrics_vmt_roadway_input.municipal_streets) AS total_vmt,

  /* The streets are divided in local streets and arterials where local streets are the same as municipal_streets */
  (  (city_metrics_vmt_roadway_input.interstate_trunk_highway +
     city_metrics_vmt_roadway_input.us_trunk_highway +
      city_metrics_vmt_roadway_input.minnesota_trunk_highway +
      city_metrics_vmt_roadway_input.county_state_aid_highway +
      city_metrics_vmt_roadway_input.municipal_state_aid_highway +
      city_metrics_vmt_roadway_input.county_road +
      city_metrics_vmt_roadway_input.municipal_streets) -
      city_metrics_vmt_roadway_input.municipal_streets) AS arterials,

  (city_metrics_vmt_roadway_input.municipal_streets) AS local_streets

FROM  city_metrics_vmt_roadway_input JOIN city_metrics_city ON city_metrics_city.id = city_metrics_vmt_roadway_input.city_id
WHERE city_metrics_city.sort_order IS NOT NULL







/* STEP 2 */







CREATE OR REPLACE VIEW city_metrics_travel_intermediary2 AS
SELECT
city_metrics_travel_intermediary1.year,
city_metrics_travel_intermediary1.city_id,
/* Here we are estimating the gasoline by vehicle type: passenger car and light trucks, because they are the ones that use gasoline */
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_passenger_cars * city_metrics_dist_fuel_veh_type.gasoline_passenger_cars) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_passenger_cars * city_metrics_dist_fuel_veh_type.gasoline_passenger_cars)
AS gasoline_passenger_car,

(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_light_trucks * city_metrics_dist_fuel_veh_type.gasoline_light_trucks) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_light_trucks * city_metrics_dist_fuel_veh_type.gasoline_light_trucks)
AS gasoline_light_truck,
/* Then, the total gasoline */
(
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_passenger_cars * city_metrics_dist_fuel_veh_type.gasoline_passenger_cars) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_passenger_cars * city_metrics_dist_fuel_veh_type.gasoline_passenger_cars) +
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_light_trucks * city_metrics_dist_fuel_veh_type.gasoline_light_trucks) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_light_trucks * city_metrics_dist_fuel_veh_type.gasoline_light_trucks)
)
AS total_gasoline_vmt,
/* Here we are estimating the diesel by vehicle type: diesel heavy duty vehicles, diesel light truck and diesel passenger cars */
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_heavy_duty_vehicles  * city_metrics_dist_fuel_veh_type.diesel_heavy_duty_vehicles) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_heavy_duty_vehicles * city_metrics_dist_fuel_veh_type.diesel_heavy_duty_vehicles)
AS diesel_heavy_duty_vehicles,
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_passenger_cars * city_metrics_dist_fuel_veh_type.diesel_passenger_cars) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_passenger_cars * city_metrics_dist_fuel_veh_type.diesel_passenger_cars)
AS diesel_passenger_car,
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_light_trucks * city_metrics_dist_fuel_veh_type.diesel_light_trucks) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_light_trucks * city_metrics_dist_fuel_veh_type.diesel_light_trucks)
AS diesel_light_truck,
/* Then the total diesel */
(
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_passenger_cars * city_metrics_dist_fuel_veh_type.diesel_passenger_cars) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_passenger_cars * city_metrics_dist_fuel_veh_type.diesel_passenger_cars) +
(city_metrics_travel_intermediary1.arterials * city_metrics_dist_ann_veh_dist_trav.arterials_light_trucks * city_metrics_dist_fuel_veh_type.diesel_light_trucks) +
(city_metrics_travel_intermediary1.local_streets * city_metrics_dist_ann_veh_dist_trav.local_streets_light_trucks * city_metrics_dist_fuel_veh_type.diesel_light_trucks)
) AS total_diesel_vmt
FROM city_metrics_travel_intermediary1, city_metrics_dist_ann_veh_dist_trav, city_metrics_dist_fuel_veh_type







/* STEP 3 */










CREATE OR REPLACE VIEW city_metrics_travel_intermediary3 AS
SELECT

city_metrics_travel_intermediary2.year,
city_metrics_travel_intermediary2.city_id,

city_metrics_travel_intermediary2.gasoline_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg AS gallons_gasoline_passenger_cars,
city_metrics_travel_intermediary2.gasoline_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg AS gallons_gasoline_light_trucks,
city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles / city_metrics_fuel_economy_assumptions.avg_heavy_duty_truck_mpg AS gallons_diesel_heavy_duty_trucks,
city_metrics_travel_intermediary2.diesel_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg AS gallons_diesel_passenger_cars,
city_metrics_travel_intermediary2.diesel_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg AS gallons_diesel_light_truck,

(
city_metrics_travel_intermediary2.gasoline_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.gasoline_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) AS gallons_gasoline,

(
city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles / city_metrics_fuel_economy_assumptions.avg_heavy_duty_truck_mpg +
city_metrics_travel_intermediary2.diesel_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.diesel_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) AS gallons_diesel,

((
city_metrics_travel_intermediary2.gasoline_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.gasoline_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) * city_metrics_biofuel_percentages.gasoline_ethanol) AS total_gallons_ethanol,

((
(city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles / city_metrics_fuel_economy_assumptions.avg_heavy_duty_truck_mpg) +
(city_metrics_travel_intermediary2.diesel_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg) +
(city_metrics_travel_intermediary2.diesel_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg)
) * city_metrics_biofuel_percentages.biodiesel) AS total_gallons_biodiesel,

((
city_metrics_travel_intermediary2.gasoline_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.gasoline_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) - ((city_metrics_travel_intermediary2.gasoline_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.gasoline_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) * city_metrics_biofuel_percentages.gasoline_ethanol)) AS total_gallons_gasoline,

((
city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles / city_metrics_fuel_economy_assumptions.avg_heavy_duty_truck_mpg +
city_metrics_travel_intermediary2.diesel_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.diesel_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) - ((
city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles / city_metrics_fuel_economy_assumptions.avg_heavy_duty_truck_mpg +
city_metrics_travel_intermediary2.diesel_passenger_car / city_metrics_fuel_economy_assumptions.avg_car_mpg +
city_metrics_travel_intermediary2.diesel_light_truck / city_metrics_fuel_economy_assumptions.avg_ligth_truck_mpg
) * city_metrics_biofuel_percentages.biodiesel)) AS total_gallons_diesel


FROM city_metrics_travel_intermediary2, city_metrics_biofuel_percentages, city_metrics_fuel_economy_assumptions
WHERE city_metrics_fuel_economy_assumptions.year = city_metrics_travel_intermediary2.year
AND city_metrics_biofuel_percentages.year = city_metrics_travel_intermediary2.year;






/* STEP 4*/







CREATE OR REPLACE VIEW city_metrics_travel_intermediary4 AS
SELECT
city_metrics_travel_intermediary3.year,
city_metrics_travel_intermediary3.city_id,

city_metrics_travel_intermediary3.gallons_gasoline_passenger_cars,
city_metrics_travel_intermediary3.gallons_gasoline_light_trucks,
city_metrics_travel_intermediary3.gallons_diesel_heavy_duty_trucks,
city_metrics_travel_intermediary3.gallons_diesel_passenger_cars,
city_metrics_travel_intermediary3.gallons_diesel_light_truck,
city_metrics_travel_intermediary3.gallons_gasoline,
city_metrics_travel_intermediary3.gallons_diesel,
city_metrics_travel_intermediary3.total_gallons_ethanol,
city_metrics_travel_intermediary3.total_gallons_biodiesel,
city_metrics_travel_intermediary3.total_gallons_gasoline,
city_metrics_travel_intermediary3.total_gallons_diesel,

(
((city_metrics_travel_intermediary3.gallons_gasoline_passenger_cars * city_metrics_vehicle_co2_emissions_factor.unleaded_gasoline) * (1 - city_metrics_biofuel_percentages.gasoline_ethanol)/1000)
) AS CO2_emission_gasoline_passenger_car,

(
((city_metrics_travel_intermediary3.gallons_gasoline_light_trucks * city_metrics_vehicle_co2_emissions_factor.unleaded_gasoline) * (1 - city_metrics_biofuel_percentages.gasoline_ethanol))/1000
) AS CO2_emission_gasoline_light_trucks,

(
(((city_metrics_travel_intermediary3.gallons_gasoline_passenger_cars * city_metrics_vehicle_co2_emissions_factor.unleaded_gasoline) * (1 - city_metrics_biofuel_percentages.gasoline_ethanol))/1000  ) +
(((city_metrics_travel_intermediary3.gallons_gasoline_light_trucks * city_metrics_vehicle_co2_emissions_factor.unleaded_gasoline) * (1 - city_metrics_biofuel_percentages.gasoline_ethanol))/1000)
) AS total_gasoline_CO2,

(
((city_metrics_travel_intermediary3.gallons_diesel_passenger_cars * city_metrics_vehicle_co2_emissions_factor.diesel_fuel) * (1 - city_metrics_biofuel_percentages.biodiesel)/1000)
) AS CO2_emission_diesel_passenger_car,

(
city_metrics_travel_intermediary3.gallons_diesel_light_truck * city_metrics_vehicle_co2_emissions_factor.diesel_fuel) * (1 - city_metrics_biofuel_percentages.biodiesel)/1000
 AS CO2_emission_diesel_light_trucks,
(
((city_metrics_travel_intermediary3.gallons_diesel_heavy_duty_trucks * city_metrics_vehicle_co2_emissions_factor.diesel_fuel) * (1 - city_metrics_biofuel_percentages.biodiesel))/1000
) AS CO2_emission_diesel_heavy_duty_trucks,

(
((city_metrics_travel_intermediary3.gallons_diesel_passenger_cars * city_metrics_vehicle_co2_emissions_factor.diesel_fuel) * (1 - city_metrics_biofuel_percentages.biodiesel)/1000) +
((city_metrics_travel_intermediary3.gallons_diesel_light_truck * city_metrics_vehicle_co2_emissions_factor.diesel_fuel) * (1 - city_metrics_biofuel_percentages.biodiesel))/1000) +
((city_metrics_travel_intermediary3.gallons_diesel_heavy_duty_trucks * city_metrics_vehicle_co2_emissions_factor.diesel_fuel) * (1 - city_metrics_biofuel_percentages.biodiesel))/1000
AS total_diesel_CO2

FROM city_metrics_travel_intermediary3, city_metrics_vehicle_co2_emissions_factor, city_metrics_biofuel_percentages
WHERE city_metrics_biofuel_percentages.year = city_metrics_travel_intermediary3.year;



/* STEP 5*/




CREATE OR REPLACE VIEW city_metrics_travel_intermediary5 AS
SELECT

city_metrics_travel_intermediary4.year,
city_metrics_travel_intermediary4.city_id,

city_metrics_travel_intermediary4.CO2_emission_gasoline_passenger_car,
city_metrics_travel_intermediary4.CO2_emission_gasoline_light_trucks,
city_metrics_travel_intermediary4.total_gasoline_CO2,
city_metrics_travel_intermediary4.CO2_emission_diesel_passenger_car,
city_metrics_travel_intermediary4.CO2_emission_diesel_light_trucks,
city_metrics_travel_intermediary4.CO2_emission_diesel_heavy_duty_trucks,
city_metrics_travel_intermediary4.total_diesel_CO2,

(city_metrics_travel_intermediary2.gasoline_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_gasoline_passenger_cars) /1000000 AS ch4_emissions_gasoline_passenger_cars,
(city_metrics_travel_intermediary2.gasoline_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_gasoline_light_trucks) /1000000 AS ch4_emissions_gasoline_light_trucks,
(city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_diesel_heavy_duty_vehicles) /1000000 AS ch4_emissions_diesel_heavy_duty_vehicles,
(city_metrics_travel_intermediary2.diesel_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_diesel_passenger_cars) /1000000 AS ch4_emissions_diesel_passenger_cars,
(city_metrics_travel_intermediary2.diesel_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_diesel_light_trucks) /1000000 AS ch4_emissions_diesel_light_trucks,

(city_metrics_travel_intermediary2.gasoline_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_gasoline_passenger_cars) /1000000 AS n2o_emissions_gasoline_passenger_cars,
(city_metrics_travel_intermediary2.gasoline_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_gasoline_light_trucks) /1000000 AS n2o_emissions_gasoline_light_trucks,
(city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_diesel_heavy_duty_vehicles) /1000000 AS n2o_emissions_diesel_heavy_duty_vehicles,
(city_metrics_travel_intermediary2.diesel_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_diesel_passenger_cars) /1000000 AS n2o_emissions_diesel_passenger_cars,
(city_metrics_travel_intermediary2.diesel_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_diesel_light_trucks) /1000000 AS n2o_emissions_diesel_light_trucks,

(
(city_metrics_travel_intermediary2.gasoline_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_gasoline_passenger_cars) /1000000 +
(city_metrics_travel_intermediary2.gasoline_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_gasoline_light_trucks) /1000000
) AS total_gasoline_CH4,

(
(city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_diesel_heavy_duty_vehicles) /1000000) +
(city_metrics_travel_intermediary2.diesel_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_diesel_passenger_cars) /1000000 +
(city_metrics_travel_intermediary2.diesel_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.ch4_diesel_light_trucks) /1000000
 AS total_diesel_CH4,


(city_metrics_travel_intermediary2.gasoline_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_gasoline_passenger_cars) /1000000 +
(city_metrics_travel_intermediary2.gasoline_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_gasoline_light_trucks) /1000000
 AS total_gasoline_N2O,

(
(city_metrics_travel_intermediary2.diesel_heavy_duty_vehicles * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_diesel_heavy_duty_vehicles) /1000000) +
(city_metrics_travel_intermediary2.diesel_passenger_car * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_diesel_passenger_cars) /1000000 +
(city_metrics_travel_intermediary2.diesel_light_truck * city_metrics_vehicle_ch4_and_n2o_emissions_factor.n2o_diesel_light_trucks) /1000000
 AS total_diesel_N2O

FROM city_metrics_travel_intermediary2, city_metrics_travel_intermediary4, city_metrics_vehicle_ch4_and_n2o_emissions_factor
WHERE city_metrics_travel_intermediary2.year = city_metrics_travel_intermediary4.year
AND city_metrics_travel_intermediary2.city_id = city_metrics_travel_intermediary4.city_id;




/* STEP 6*/





CREATE OR REPLACE VIEW city_metrics_travel_intermediary6 AS
SELECT


city_metrics_travel_intermediary5.year,
city_metrics_travel_intermediary5.city_id,

(
(city_metrics_travel_intermediary4.CO2_emission_gasoline_passenger_car) +
(city_metrics_travel_intermediary5.ch4_emissions_gasoline_passenger_cars * 21)+
(city_metrics_travel_intermediary5.n2o_emissions_gasoline_passenger_cars * 310)
) AS CO2e_emissions_gasoline_passenger_cars,

(city_metrics_travel_intermediary4.CO2_emission_gasoline_light_trucks +
(city_metrics_travel_intermediary5.ch4_emissions_gasoline_light_trucks * 21)+
(city_metrics_travel_intermediary5.n2o_emissions_gasoline_light_trucks * 310))
AS CO2e_emissions_gasoline_light_trucks,

(city_metrics_travel_intermediary4.CO2_emission_diesel_passenger_car +
(city_metrics_travel_intermediary5.ch4_emissions_diesel_passenger_cars * 21)+
(city_metrics_travel_intermediary5.n2o_emissions_diesel_passenger_cars * 310))
AS CO2e_emissions_diesel_passenger_cars,

(city_metrics_travel_intermediary4.CO2_emission_diesel_light_trucks +
(city_metrics_travel_intermediary5.ch4_emissions_diesel_light_trucks * 21)+
(city_metrics_travel_intermediary5.n2o_emissions_diesel_light_trucks * 310))
AS CO2e_emissions_diesel_light_trucks,

(city_metrics_travel_intermediary4.CO2_emission_diesel_heavy_duty_trucks +
(city_metrics_travel_intermediary5.ch4_emissions_diesel_heavy_duty_vehicles * 21) +
(city_metrics_travel_intermediary5.n2o_emissions_diesel_heavy_duty_vehicles * 310))
AS CO2e_emissions_diesel_heavy_duty_trucks,


(city_metrics_travel_intermediary4.total_gasoline_CO2 +
(city_metrics_travel_intermediary5.total_gasoline_CH4 * 21) +
(city_metrics_travel_intermediary5.total_gasoline_N2O * 310))
AS total_CO2e_gasoline,

(city_metrics_travel_intermediary4.total_diesel_CO2 +
(city_metrics_travel_intermediary5.total_diesel_CH4 * 21) +
(city_metrics_travel_intermediary5.total_diesel_N2O * 310))
AS total_CO2e_diesel,

((city_metrics_travel_intermediary4.total_gasoline_CO2 +
(city_metrics_travel_intermediary5.total_gasoline_CH4 * 21) +
(city_metrics_travel_intermediary5.total_gasoline_N2O * 310)) +
(city_metrics_travel_intermediary4.total_diesel_CO2 +
(city_metrics_travel_intermediary5.total_diesel_CH4 * 21) +
(city_metrics_travel_intermediary5.total_diesel_N2O * 310)))
AS total_fossil_CO2e,

(((city_metrics_travel_intermediary4.total_gasoline_CO2 +
(city_metrics_travel_intermediary5.total_gasoline_CH4 * 21) +
(city_metrics_travel_intermediary5.total_gasoline_N2O * 310)) +
(city_metrics_travel_intermediary4.total_diesel_CO2 +
(city_metrics_travel_intermediary5.total_diesel_CH4 * 21) +
(city_metrics_travel_intermediary5.total_diesel_N2O * 310)))/( (city_metrics_travel_intermediary1.local_streets + city_metrics_travel_intermediary1.arterials) /1000000))
AS total_fossil_CO2e_per_million_vmt


FROM city_metrics_travel_intermediary5, city_metrics_travel_intermediary4, city_metrics_travel_intermediary1
WHERE city_metrics_travel_intermediary5.year = city_metrics_travel_intermediary4.year
AND city_metrics_travel_intermediary1.year = city_metrics_travel_intermediary4.year
AND city_metrics_travel_intermediary1.city_id = city_metrics_travel_intermediary4.city_id
AND city_metrics_travel_intermediary1.city_id = city_metrics_travel_intermediary5.city_id
