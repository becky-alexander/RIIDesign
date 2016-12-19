CREATE OR REPLACE VIEW intermediary_cost_electricity
SELECT
(
city_metrics_cost_factors.id,
city_metrics_cost_factors.year,

/*Electricity Cost Factors*/
city_metrics_cost_factors.residential_electricity_per_MWh,
city_metrics_cost_factors.commerical_electricity_per_MWh,
city_metrics_cost_factors.industrial_electricity_per_MWh,
city_metrics_cost_factors.retail_electricity_per_MWh,
((city_metrics_cost_factors.commerical_electricity_per_MWh + city_metrics_cost_factors.industrial_electricity_per_MWh)/2) AS com_and_ind_electricity_per_Mwh,

/*Electric Amount*/
city_metrics_electricity_joined.total_residential_electricity, 
city_metrics_electricity_joined.total_com_and_ind_electricity,

FROM city_metrics_cost_factors, city_metrics_electricity_joined
WHERE city_metrics_electricity_joined.year = city_metrics_cost_factors.year

;
