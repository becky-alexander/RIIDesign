CREATE TABLE city_metrics_wastewater_input
(
  id SERIAL PRIMARY KEY,
  city_id INT REFERENCES city_metrics_city(id),
  year VARCHAR(4),

  wastewater_facility1_id INT REFERENCES city_metrics_wastewater_facility(id),
  wastewater_treated_facility1 NUMERIC(16,4),

  wastewater_facility2_id INT REFERENCES city_metrics_wastewater_facility(id),
  wastewater_treated_facility2 NUMERIC(16,4),

  wastewater_facility3_id INT REFERENCES city_metrics_wastewater_facility(id),
  wastewater_treated_facility3 NUMERIC(16,4)

);
