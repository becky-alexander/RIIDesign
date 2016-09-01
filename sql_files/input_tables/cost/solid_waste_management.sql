CREATE TABLE city_metrics_cost_factor_solid_waste
(

id SERIAL PRIMARY KEY,
year VARCHAR(4),
# Dollar per Ton
incineration NUMERIC (16,4),
landfill NUMERIC (16,4),
recycling NUMERIC (16,4)

);
