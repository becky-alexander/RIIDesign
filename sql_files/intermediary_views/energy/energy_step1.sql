CREATE OR REPLACE VIEW city_metrics_energy_intermediary1 AS
SELECT

city_metrics_electricity_joined.city_id,
city_metrics_electricity_joined.year,
(city_metrics_electricity_joined.total_electricity * 3.412) AS total_electricity_mmbtu,
(city_metrics_nat_gas_joined.total_nat_gas / 10) AS total_nat_gas_mmbtu,
((city_metrics_electricity_joined.total_residential_wind_electricity + city_metrics_electricity_joined.total_com_and_ind_wind_electricity) * 3.412) AS total_wind_electricity_mmbtu,
(city_metrics_electricity_joined.total_residential_electricity * 3.412) AS total_residential_electricity_mmbtu,/* the 3.412 is to convert mwh to mmbtu*/
(city_metrics_nat_gas_joined.total_residential_nat_gas / 10) AS total_residential_nat_gas_mmbtu,
((city_metrics_electricity_joined.total_residential_electricity * 3.412) +  (city_metrics_nat_gas_joined.total_residential_nat_gas / 10)) AS total_residential_energy_mmbtu,
(city_metrics_electricity_joined.total_com_and_ind_electricity * 3.412) AS total_com_and_ind_electricity_mmbtu,
(city_metrics_nat_gas_joined.total_com_and_ind_nat_gas / 10) AS total_com_and_ind_nat_gas_mmbtu,
((city_metrics_electricity_joined.total_com_and_ind_electricity * 3.412) +  (city_metrics_nat_gas_joined.total_com_and_ind_nat_gas / 10)) AS total_com_and_ind_energy_mmbtu,


/* Emissions */


city_metrics_electricity_joined.total_emissions_electricity,
city_metrics_electricity_joined.total_residential_emissions_electricity,
city_metrics_electricity_joined.total_com_and_ind_emissions_electricity,


city_metrics_nat_gas_joined.total_emissions_nat_gas,
city_metrics_nat_gas_joined.total_residential_emissions_nat_gas,
city_metrics_nat_gas_joined.total_com_and_ind_emissions_nat_gas



FROM city_metrics_nat_gas_joined, city_metrics_electricity_joined, city_metrics_cdd_hdd, city_metrics_cdd_hdd_average
WHERE city_metrics_electricity_joined.city_id = city_metrics_nat_gas_joined.city_id
AND city_metrics_nat_gas_joined.year = city_metrics_cdd_hdd.year
AND city_metrics_electricity_joined.year = city_metrics_nat_gas_joined.year
