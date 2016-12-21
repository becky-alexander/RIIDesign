CREATE OR REPLACE VIEW intermediary_cost_water AS
SELECT(
city_metrics_cost_factors.electricity_consumed_kwh_per_gallon_water,
city_metrics_cost_factors.cost_per_gallon_water,

city_metrics_water.total_res_water,
city_metrics_water.total_com_ind_water,

(city_metrics_water.total_res_water * city_metrics_cost_factors.electricity_consumed_kwh_per_gallon_water),
(city_metrics_water.total_res_water * city_metrics_cost_factors.cost_per_gallon_water),

city_metrics_water.total_com_ind_water,

)
FROM city_metrics_cost_factors, city_metrics_water
WHERE city_metrics_cost_factors.year = city_metrics_water.year
/**/
