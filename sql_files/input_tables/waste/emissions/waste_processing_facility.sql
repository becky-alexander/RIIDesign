CREATE TABLE city_metrics_waste_processing_facility
(
  id SERIAL PRIMARY KEY,
  facility_name VARCHAR(50)
);

COPY city_metrics_waste_processing_facility FROM 'C:/csv_files/city_metrics_waste_processing_facility.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE city_metrics_waste_processing_facility_emission_factors
(
  id SERIAL PRIMARY KEY,
  year VARCHAR(4),
  facility_id INT REFERENCES city_metrics_waste_processing_facility(id),
  fossil_emission_rate NUMERIC(16,4),
  biogenic_emission_rate NUMERIC(16,4),
  total_fossil_emissions NUMERIC(16,4),
  total_biogenic_emissions NUMERIC (16,4),
  exported_electricity NUMERIC(16,4),
  total_waste NUMERIC(16,4)
);

COPY city_metrics_waste_processing_facility_emission_factors FROM 'C:/csv_files/city_metrics_waste_processing_facility_emission_factors.csv' DELIMITER ',' CSV HEADER;
