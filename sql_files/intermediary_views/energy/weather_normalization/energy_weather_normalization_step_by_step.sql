/* STEP 1*/





CREATE OR REPLACE VIEW city_metrics_energy_wn_intermediary1 AS
SELECT

city_metrics_electricity_joined.city_id,
city_metrics_electricity_joined.year,
/* Normalize Electricity */
((city_metrics_energy_intermediary1.total_electricity_mmbtu * 0.25 * (city_metrics_cdd_hdd_average.cdd_average/((city_metrics_cdd_hdd.cdd))))
+ (city_metrics_energy_intermediary1.total_electricity_mmbtu * 0.75)) AS wn_electricity,/*MMBTU*/
/* Normalize Natural Gas */
((city_metrics_energy_intermediary1.total_nat_gas_mmbtu * 0.80 * (city_metrics_cdd_hdd_average.hdd_average/((city_metrics_cdd_hdd.hdd))))
+ (city_metrics_energy_intermediary1.total_nat_gas_mmbtu * 0.20)) AS wn_nat_gas,/*MMBTU*/
/* Normalize Wind Electricity */
((city_metrics_energy_intermediary1.total_wind_electricity_mmbtu * 3.412 * 0.25 * (city_metrics_cdd_hdd_average.cdd_average/((city_metrics_cdd_hdd.cdd))))
+ (city_metrics_energy_intermediary1.total_wind_electricity_mmbtu * 3.412 * 0.75)) AS wn_wind_electricity,/*MMBTU*/

/* RESIDENTIAL */
/* Normalize Resiential Electricity */
((city_metrics_energy_intermediary1.total_residential_electricity_mmbtu * 0.25 * (city_metrics_cdd_hdd_average.cdd_average/((city_metrics_cdd_hdd.cdd)))) +
(city_metrics_energy_intermediary1.total_residential_electricity_mmbtu * 0.75)) AS wn_total_residential_electricity_mmbtu,
/* Normalize Residential Natural Gas */
((city_metrics_energy_intermediary1.total_residential_nat_gas_mmbtu * 0.80 * (city_metrics_cdd_hdd_average.hdd_average/((city_metrics_cdd_hdd.hdd)))) +
(city_metrics_energy_intermediary1.total_residential_nat_gas_mmbtu * 0.20)) AS wn_total_residential_nat_gas_mmbtu,
/* Normalize Residential Energy (Electricity + Natural Gas) */
((city_metrics_energy_intermediary1.total_residential_electricity_mmbtu * 0.25 * (city_metrics_cdd_hdd_average.cdd_average/((city_metrics_cdd_hdd.cdd)))) +
(city_metrics_energy_intermediary1.total_residential_electricity_mmbtu * 0.75) +
((city_metrics_energy_intermediary1.total_residential_nat_gas_mmbtu * 0.80 * (city_metrics_cdd_hdd_average.hdd_average/((city_metrics_cdd_hdd.hdd)))) +
(city_metrics_energy_intermediary1.total_residential_nat_gas_mmbtu * 0.20))) AS wn_total_residential_energy_mmbtu,

/* COMMERCIAL AND INDUSTRIAL */
/* Normalize Commercial Electricity */
((city_metrics_energy_intermediary1.total_com_and_ind_electricity_mmbtu * 0.25 * (city_metrics_cdd_hdd_average.cdd_average/((city_metrics_cdd_hdd.cdd)))) +
(city_metrics_energy_intermediary1.total_com_and_ind_electricity_mmbtu * 0.75)) AS wn_total_com_and_ind_electricity_mmbtu,
/* Normalize Commercial and Industrial Electricity */
((city_metrics_energy_intermediary1.total_com_and_ind_nat_gas_mmbtu * 0.80 * (city_metrics_cdd_hdd_average.hdd_average/((city_metrics_cdd_hdd.hdd)))) +
(city_metrics_energy_intermediary1.total_com_and_ind_nat_gas_mmbtu * 0.20)) AS wn_total_com_and_ind_nat_gas_mmbtu,
/* Normalize Commercial and Industrial Energy */
((city_metrics_energy_intermediary1.total_com_and_ind_electricity_mmbtu * 0.25 * (city_metrics_cdd_hdd_average.cdd_average/((city_metrics_cdd_hdd.cdd)))) +
(city_metrics_energy_intermediary1.total_com_and_ind_electricity_mmbtu * 0.75) +
((city_metrics_energy_intermediary1.total_com_and_ind_nat_gas_mmbtu * 0.80 * (city_metrics_cdd_hdd_average.hdd_average/((city_metrics_cdd_hdd.hdd)))) +
(city_metrics_energy_intermediary1.total_com_and_ind_nat_gas_mmbtu * 0.20))) AS wn_total_com_and_ind_energy_mmbtu

FROM city_metrics_nat_gas_joined, city_metrics_electricity_joined, city_metrics_cdd_hdd, city_metrics_cdd_hdd_average, city_metrics_energy_intermediary1
WHERE city_metrics_electricity_joined.city_id = city_metrics_nat_gas_joined.city_id
AND city_metrics_nat_gas_joined.year = city_metrics_cdd_hdd.year
AND city_metrics_electricity_joined.year = city_metrics_nat_gas_joined.year
AND city_metrics_energy_intermediary1.city_id = city_metrics_electricity_joined.city_id
AND city_metrics_energy_intermediary1.year = city_metrics_electricity_joined.year;









/* STEP 2*/






CREATE OR REPLACE VIEW city_metrics_energy_wn_intermediary2 AS
SELECT

city_metrics_energy_wn_intermediary1.city_id,
city_metrics_energy_wn_intermediary1.year,
city_metrics_energy_wn_intermediary1.wn_electricity,/*MMBTU*/
city_metrics_energy_wn_intermediary1.wn_nat_gas,/*MMBTU*/
city_metrics_energy_wn_intermediary1.wn_wind_electricity,/*MMBTU*/
city_metrics_energy_wn_intermediary1.wn_total_residential_energy_mmbtu,
city_metrics_energy_wn_intermediary1.wn_total_com_and_ind_energy_mmbtu,
city_metrics_energy_wn_intermediary1.wn_total_residential_electricity_mmbtu,
city_metrics_energy_wn_intermediary1.wn_total_residential_nat_gas_mmbtu,
city_metrics_energy_wn_intermediary1.wn_total_com_and_ind_electricity_mmbtu,

--Emissions--

--Electricity--

city_metrics_electricity_joined.total_electricity,
city_metrics_electricity_joined.total_residential_wind_electricity,
city_metrics_electricity_joined.total_residential_electricity,
city_metrics_electricity_joined.total_com_and_ind_electricity,

city_metrics_electricity_joined.total_emissions_electricity,
city_metrics_electricity_joined.total_residential_emissions_electricity,
city_metrics_electricity_joined.total_com_and_ind_emissions_electricity,

--Natural Gas--

city_metrics_nat_gas_joined.total_nat_gas,
city_metrics_nat_gas_joined.total_residential_nat_gas,
city_metrics_nat_gas_joined.total_com_and_ind_nat_gas,

city_metrics_nat_gas_joined.total_emissions_nat_gas,
city_metrics_nat_gas_joined.total_residential_emissions_nat_gas,
city_metrics_nat_gas_joined.total_com_and_ind_emissions_nat_gas,
-- WN emissions --
  -- Electiricity --
  CASE WHEN city_metrics_electricity_joined.total_electricity = 0 THEN 1
  ELSE
  (city_metrics_electricity_joined.total_emissions_electricity * (city_metrics_energy_wn_intermediary1.wn_electricity/city_metrics_electricity_joined.total_electricity))
  END AS wn_electricity_emissions,
  -- Nat Gas --
  CASE WHEN city_metrics_nat_gas_joined.total_nat_gas = 0 THEN 1
  ELSE
  (city_metrics_nat_gas_joined.total_emissions_nat_gas * (city_metrics_energy_wn_intermediary1.wn_nat_gas/city_metrics_nat_gas_joined.total_nat_gas))
  END AS  wn_nat_gas_emissions,
  -- Total Energy --

 -- Residential/Electicity --
 CASE WHEN city_metrics_electricity_joined.total_residential_electricity = 0 THEN 1
 ELSE
 (city_metrics_electricity_joined.total_residential_emissions_electricity * (city_metrics_energy_wn_intermediary1.wn_total_residential_electricity_mmbtu/city_metrics_electricity_joined.total_residential_electricity))
 END AS wn_residential_electricity_emissions,
  -- Com&Ind/Electicity --
  CASE WHEN city_metrics_electricity_joined.total_com_and_ind_electricity = 0 THEN 1
  ELSE
  (city_metrics_electricity_joined.total_com_and_ind_emissions_electricity * (city_metrics_energy_wn_intermediary1.wn_total_com_and_ind_electricity_mmbtu / city_metrics_electricity_joined.total_com_and_ind_electricity))
  END AS wn_com_and_ind_electricity_emissions,
 --Residential/NatGas --
   CASE WHEN city_metrics_nat_gas_joined.total_residential_emissions_nat_gas = 0 THEN 1
   ELSE (city_metrics_nat_gas_joined.total_residential_emissions_nat_gas * (city_metrics_energy_wn_intermediary1.wn_total_residential_nat_gas_mmbtu/city_metrics_nat_gas_joined.total_residential_emissions_nat_gas))
   END AS wn_residential_nat_gas_emissions,
 --Com%Ind/NatGas
   CASE WHEN city_metrics_nat_gas_joined.total_com_and_ind_emissions_nat_gas = 0 THEN 1
   ELSE (city_metrics_nat_gas_joined.total_com_and_ind_emissions_nat_gas * (city_metrics_energy_wn_intermediary1.wn_total_com_and_ind_nat_gas_mmbtu/city_metrics_nat_gas_joined.total_com_and_ind_emissions_nat_gas))
   END AS wn_com_and_ind_nat_gas_emissions
----
FROM city_metrics_nat_gas_joined, city_metrics_electricity_joined, city_metrics_cdd_hdd, city_metrics_cdd_hdd_average, city_metrics_energy_wn_intermediary1
WHERE city_metrics_nat_gas_joined.year = city_metrics_cdd_hdd.year
AND city_metrics_electricity_joined.year = city_metrics_nat_gas_joined.year
AND city_metrics_energy_wn_intermediary1.year = city_metrics_nat_gas_joined.year
AND city_metrics_energy_wn_intermediary1.city_id = city_metrics_electricity_joined.city_id
AND city_metrics_energy_wn_intermediary1.city_id = city_metrics_nat_gas_joined.city_id
AND city_metrics_energy_wn_intermediary1.year = city_metrics_electricity_joined.year;







/* STEP 3 */






CREATE OR REPLACE VIEW city_metrics_energy_wn_intermediary3 AS
SELECT

city_metrics_energy_wn_intermediary2.city_id,
city_metrics_energy_wn_intermediary2.year,
city_metrics_energy_wn_intermediary2.wn_electricity,/*MMBTU*/
city_metrics_energy_wn_intermediary2.wn_nat_gas,/*MMBTU*/
city_metrics_energy_wn_intermediary2.wn_wind_electricity,/*MMBTU*/
city_metrics_energy_wn_intermediary2.wn_total_residential_energy_mmbtu,
city_metrics_energy_wn_intermediary2.wn_total_com_and_ind_energy_mmbtu,
city_metrics_energy_wn_intermediary2.wn_total_residential_electricity_mmbtu,
city_metrics_energy_wn_intermediary2.wn_total_residential_nat_gas_mmbtu,
city_metrics_energy_wn_intermediary2.wn_total_com_and_ind_electricity_mmbtu,

-- WN emissions --

  -- Electiricity --
city_metrics_energy_wn_intermediary2.wn_electricity_emissions,

  -- Nat Gas --
city_metrics_energy_wn_intermediary2.wn_nat_gas_emissions,

  -- Total Energy --

 -- Residential/Electicity --
city_metrics_energy_wn_intermediary2.wn_residential_electricity_emissions,

  -- Com&Ind/Electicity --
city_metrics_energy_wn_intermediary2.wn_com_and_ind_electricity_emissions,

 --Residential/NatGas --
city_metrics_energy_wn_intermediary2.wn_residential_nat_gas_emissions,

 --Com%Ind/NatGas
city_metrics_energy_wn_intermediary2.wn_com_and_ind_nat_gas_emissions,

----
(city_metrics_energy_wn_intermediary2.total_residential_emissions_electricity +
 city_metrics_energy_wn_intermediary2.total_residential_emissions_nat_gas +
 city_metrics_energy_wn_intermediary2.total_com_and_ind_emissions_electricity +
 city_metrics_energy_wn_intermediary2.total_com_and_ind_emissions_nat_gas) AS energy_associated_emissions

FROM city_metrics_energy_wn_intermediary2
