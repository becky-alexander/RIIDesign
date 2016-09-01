CREATE OR REPLACE VIEW city_metrics_waste_city AS
SELECT

city_metrics_city.id AS city_id,

city_metrics_waste_joined.county_id,
city_metrics_waste_joined.year,
city_metrics_waste_joined.total_fossil_emissions_county,
city_metrics_waste_joined.total_biogenic_emissions_county,
city_metrics_waste_joined.recycled,
city_metrics_waste_joined.land_dispossed,
city_metrics_waste_joined.processed_all_facilities,
city_metrics_waste_joined.methane_recovery_factor,

(city_metrics_waste_joined.recycled +
city_metrics_waste_joined.land_dispossed +
city_metrics_waste_joined.processed_all_facilities) AS total_waste_county,

(
(city_metrics_waste_joined.recycled +
city_metrics_waste_joined.land_dispossed +
city_metrics_waste_joined.processed_all_facilities)/city_metrics_demographicdata_county.population) AS per_capita_msw,

city_metrics_demographicdata_county.population AS population_county,



(
(city_metrics_waste_joined.processed_all_facilities)/(city_metrics_demographicdata_county.population)*city_metrics_demographicdata.population
) AS estimated_msw_processed,

(
(city_metrics_waste_joined.recycled/city_metrics_demographicdata_county.population)*city_metrics_demographicdata.population
) AS estimated_msw_recycled,

(
(city_metrics_waste_joined.land_dispossed)/(city_metrics_demographicdata_county.population)*city_metrics_demographicdata.population
) AS estimated_msw_land_dispossed,

(
(city_metrics_waste_joined.total_fossil_emissions_county/(city_metrics_demographicdata_county.population))*city_metrics_demographicdata.population
) AS estimated_emissions_processed,

((
(city_metrics_waste_joined.land_dispossed)/(city_metrics_demographicdata_county.population)*city_metrics_demographicdata.population) * ((-976.299*city_metrics_waste_joined.methane_recovery_factor+976.299)/1000)
) AS estimated_emissions_land_dispossed,

(
(city_metrics_waste_joined.total_fossil_emissions_county/(city_metrics_demographicdata_county.population))*city_metrics_demographicdata.population
) + ((
(city_metrics_waste_joined.land_dispossed)/(city_metrics_demographicdata_county.population)*city_metrics_demographicdata.population) * ((-976.299*city_metrics_waste_joined.methane_recovery_factor+976.299)/1000)
) AS total_emissions_msw



FROM city_metrics_waste_joined, city_metrics_city, city_metrics_demographicdata, city_metrics_demographicdata_county

/*LINK COUNTIES*/
WHERE city_metrics_waste_joined.county_id = city_metrics_demographicdata_county.county_id
AND city_metrics_city.county_id =  city_metrics_demographicdata_county.county_id
AND city_metrics_city.county_id = city_metrics_waste_joined.county_id


/*LINk CITIES*/
AND city_metrics_city.id = city_metrics_demographicdata.city_id


/*LINK YEARS*/
AND city_metrics_waste_joined.year = city_metrics_demographicdata.year
AND city_metrics_demographicdata.year = city_metrics_demographicdata_county.year
AND city_metrics_waste_joined.year = city_metrics_demographicdata_county.year

AND city_metrics_city.sort_order is not NULL
