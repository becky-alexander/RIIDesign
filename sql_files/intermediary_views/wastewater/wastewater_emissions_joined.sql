CREATE OR REPLACE VIEW city_metrics_wastewater_joined AS
SELECT

city_metrics_wastewater_input.city_id,
city_metrics_wastewater_input.year,

(
 city_metrics_wastewater_facility1.ghg_emission_fossil_wastewater +
 city_metrics_wastewater_facility2.ghg_emission_fossil_wastewater +
 city_metrics_wastewater_facility3.ghg_emission_fossil_wastewater
) AS total_ghg_emission_fossil_wastewater,

(
 city_metrics_wastewater_facility1.ghg_emission_biogenic_wastewater +
 city_metrics_wastewater_facility2.ghg_emission_biogenic_wastewater +
 city_metrics_wastewater_facility3.ghg_emission_biogenic_wastewater
) AS total_ghg_emission_biogenic_wastewater

FROM city_metrics_wastewater_input, city_metrics_wastewater_facility1, city_metrics_wastewater_facility2, city_metrics_wastewater_facility3
WHERE city_metrics_wastewater_input.city_id = city_metrics_wastewater_facility1.city_id
AND city_metrics_wastewater_facility1.city_id = city_metrics_wastewater_facility2.city_id
AND city_metrics_wastewater_facility2.city_id = city_metrics_wastewater_facility3.city_id
AND city_metrics_wastewater_input.year = city_metrics_wastewater_facility1.year
AND city_metrics_wastewater_facility1.year = city_metrics_wastewater_facility2.year
AND city_metrics_wastewater_facility2.year = city_metrics_wastewater_facility3.year
