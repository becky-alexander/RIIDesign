CREATE TABLE city_metrics_solid_waste_input
(
  id SERIAL PRIMARY KEY,
  year VARCHAR(4),
  county_id INT,
  recycled NUMERIC(16,4),
  land_dispossed NUMERIC (16,4),
  land_dispossed_without_ch4_recovery NUMERIC (16,4),

  facility_id1 INT REFERENCES city_metrics_waste_processing_facility,
  processed_facility1 NUMERIC(16,4),

  facility_id2 INT REFERENCES city_metrics_waste_processing_facility,
  processed_facility2 NUMERIC(16,4),

  facility_id3 INT REFERENCES city_metrics_waste_processing_facility,
  processed_facility3 NUMERIC(16,4),

  facility_id4 INT REFERENCES city_metrics_waste_processing_facility,
  processed_facility4 NUMERIC(16,4)
);

COPY city_metrics_solid_waste_input FROM 'C:/csv_files/city_metrics_solid_waste_input.csv' DELIMITER ',' CSV HEADER;
