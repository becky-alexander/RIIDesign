CREATE TABLE city_metrics_city_wastewater_facility_emissions
(
id INT PRIMARY KEY,
facility_id INT REFERENCES city_metrics_wastewater_facility(id),
year VARCHAR(4),
total_waste_water_treated NUMERIC(16,4), /*gallons*/
scope2_fossil_emissions NUMERIC(16,4), /*tonnes*/
scope1_fossil_emissions NUMERIC(16,4), /*tonnes*/
biogenic_emissions NUMERIC(16,4),
electricity_use NUMERIC(16,4),
natural_gas_use NUMERIC(16,4)
);
