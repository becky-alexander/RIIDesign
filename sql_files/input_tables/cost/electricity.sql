CREATE TABLE city_metrics_cost_factor_electricity
(

id SERIAL PRIMARY KEY,
year VARCHAR(4),
# Dollar per Ton
 NUMERIC (16,4),
 NUMERIC (16,4),
 NUMERIC (16,4)

);
