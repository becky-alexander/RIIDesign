CREATE OR REPLACE VIEW intermediary_cost_wastewater AS
SELECT
(

  wastewater_electricity_per_million_gallons,
  wastewater_natural_gas_per_million_gallons,
  wastewater_fuel_oil_per_million_gallons,


)
FROM city_metrics_cost_factors, 
