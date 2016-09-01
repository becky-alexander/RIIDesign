CREATE OR REPLACE VIEW city_metrics_wastewater_facility2 AS
SELECT

city_metrics_wastewater_input.city_id,
city_metrics_wastewater_input.year,
city_metrics_wastewater_input.wastewater_facility2_id,
city_metrics_wastewater_input.wastewater_treated_facility2,

city_metrics_city_wastewater_facility_emissions.total_waste_water_treated,
city_metrics_city_wastewater_facility_emissions.scope2_fossil_emissions,
city_metrics_city_wastewater_facility_emissions.scope1_fossil_emissions,
(
city_metrics_city_wastewater_facility_emissions.scope2_fossil_emissions +
city_metrics_city_wastewater_facility_emissions.scope1_fossil_emissions
) AS fossil_emissions,
city_metrics_city_wastewater_facility_emissions.biogenic_emissions,
city_metrics_city_wastewater_facility_emissions.electricity_use,
city_metrics_city_wastewater_facility_emissions.natural_gas_use,

CASE WHEN city_metrics_city_wastewater_facility_emissions.total_waste_water_treated = 0 THEN 1
ELSE (
(city_metrics_city_wastewater_facility_emissions.scope2_fossil_emissions +
city_metrics_city_wastewater_facility_emissions.scope1_fossil_emissions)/city_metrics_city_wastewater_facility_emissions.total_waste_water_treated
) END AS fossil_ghg_emission_rate,

CASE WHEN city_metrics_city_wastewater_facility_emissions.total_waste_water_treated = 0 THEN 1
ELSE (city_metrics_city_wastewater_facility_emissions.biogenic_emissions/city_metrics_city_wastewater_facility_emissions.total_waste_water_treated)
END AS biogenic_ghg_emission_rate,

CASE WHEN city_metrics_city_wastewater_facility_emissions.total_waste_water_treated = 0 THEN 1
ELSE (
((city_metrics_city_wastewater_facility_emissions.scope2_fossil_emissions +
city_metrics_city_wastewater_facility_emissions.scope1_fossil_emissions)/city_metrics_city_wastewater_facility_emissions.total_waste_water_treated)*city_metrics_wastewater_input.wastewater_treated_facility2
) END AS ghg_emission_fossil_wastewater,

CASE WHEN city_metrics_city_wastewater_facility_emissions.total_waste_water_treated = 0 THEN 1
ELSE (
(city_metrics_city_wastewater_facility_emissions.biogenic_emissions/city_metrics_city_wastewater_facility_emissions.total_waste_water_treated)*city_metrics_wastewater_input.wastewater_treated_facility2
) END AS ghg_emission_biogenic_wastewater



FROM city_metrics_wastewater_input, city_metrics_city_wastewater_facility_emissions
WHERE city_metrics_wastewater_input.wastewater_facility2_id = city_metrics_city_wastewater_facility_emissions.facility_id
AND city_metrics_wastewater_input.year = city_metrics_city_wastewater_facility_emissions.year
