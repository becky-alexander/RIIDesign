CREATE OR REPLACE VIEW city_metrics_electricity_utility1 AS
SELECT

city_metrics_electric_input.city_id,
city_metrics_electric_input.year,


city_metrics_electric_input.utility_id1,

CASE WHEN (city_metrics_electric_input.residential_electricity) is NULL THEN 0
  ELSE (city_metrics_electric_input.residential_electricity)
END,

CASE WHEN (city_metrics_electric_input.com_and_ind_electricity) is NULL THEN 0
  ELSE (city_metrics_electric_input.com_and_ind_electricity)
END,

CASE WHEN (city_metrics_electric_input.residential_wind_electricity) is NULL THEN 0
  ELSE (city_metrics_electric_input.residential_wind_electricity)
END,

CASE WHEN (city_metrics_electric_input.com_and_ind_wind_electricity) is NULL THEN 0
  ELSE (city_metrics_electric_input.com_and_ind_wind_electricity)
END,

CASE WHEN (city_metrics_estimated_energy_emission_factor.emission_factor) is NULL THEN 0
  ELSE (city_metrics_estimated_energy_emission_factor.emission_factor)
END AS EF_utility_id1,


CASE WHEN (city_metrics_electric_input.residential_electricity + city_metrics_electric_input.com_and_ind_electricity) is NULL  THEN 0
  ELSE
  (  city_metrics_electric_input.residential_electricity +
    city_metrics_electric_input.com_and_ind_electricity
  )
END AS  total_electricity_utility1,


CASE WHEN (city_metrics_electric_input.residential_electricity - city_metrics_electric_input.residential_wind_electricity) * (city_metrics_estimated_energy_emission_factor.emission_factor) is NULL THEN 0
  ELSE (city_metrics_electric_input.residential_electricity - city_metrics_electric_input.residential_wind_electricity) * (city_metrics_estimated_energy_emission_factor.emission_factor)
END AS emissions_residential_utility1,

 CASE WHEN (city_metrics_electric_input.com_and_ind_electricity - city_metrics_electric_input.com_and_ind_wind_electricity)  * city_metrics_estimated_energy_emission_factor.emission_factor is NULL THEN 0
   ELSE (city_metrics_electric_input.com_and_ind_electricity - city_metrics_electric_input.com_and_ind_wind_electricity)  * city_metrics_estimated_energy_emission_factor.emission_factor
 END AS emissions_com_and_ind_utility1,


CASE WHEN ((city_metrics_electric_input.residential_electricity + city_metrics_electric_input.com_and_ind_electricity) - (city_metrics_electric_input.residential_wind_electricity+city_metrics_electric_input.com_and_ind_wind_electricity) *
  (city_metrics_estimated_energy_emission_factor.emission_factor))  is NULL THEN 0
  ELSE ((city_metrics_electric_input.residential_electricity + city_metrics_electric_input.com_and_ind_electricity) - (city_metrics_electric_input.residential_wind_electricity+city_metrics_electric_input.com_and_ind_wind_electricity)) *
  (city_metrics_estimated_energy_emission_factor.emission_factor)
END AS emissions_utility1



FROM city_metrics_electric_input, city_metrics_city, city_metrics_demographicdata, city_metrics_estimated_energy_emission_factor

WHERE city_metrics_electric_input.city_id = city_metrics_city.id
AND city_metrics_electric_input.city_id = city_metrics_demographicdata.city_id
AND city_metrics_demographicdata.city_id = city_metrics_city.id
AND city_metrics_electric_input.year = city_metrics_demographicdata.year

AND city_metrics_electric_input.year = city_metrics_estimated_energy_emission_factor.year

AND city_metrics_electric_input.utility_id1 = city_metrics_estimated_energy_emission_factor.utility_id
