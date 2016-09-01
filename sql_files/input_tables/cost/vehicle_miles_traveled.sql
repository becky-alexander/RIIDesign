CREATE TABLE city_metrics_cost_factor_vmt
(

id SERIAL PRIMARY KEY,
year VARCHAR(4),

gallons_gasoline NUMERIC(16,4),
cost_per_gallons_gasoline NUMERIC(16,4),

gallons_ethanol NUMERIC(16,4),
cost_per_gallons_ethanol NUMERIC(16,4),

gallons_diesel NUMERIC(16,4),
cost_per_gallons_diesel NUMERIC(16,4),

gallons_biodiesel NUMERIC(16,4),
cost_per_gallons_biodiesel NUMERIC(16,4)

);
