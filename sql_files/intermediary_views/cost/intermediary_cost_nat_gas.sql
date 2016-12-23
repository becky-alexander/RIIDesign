CREATE OR REPLACE VIEW intermediary_costs_nat_gas AS 
SELECT

(
/*Natural Gas Cost Factors*/
city_metrics_cost_factors.residential_nat_gas_per_therm,
city_metrics_cost_factors.commercial_nat_gas_per_therm,
city_metrics_cost_factors.industrial_nat_gas_per_therm,
((city_metrics_cost_factors.commercial_nat_gas_per_therm + city_metrics_cost_factors.industrial_nat_gas_per_therm)/2) AS com_and_ind_nat_gas_per_therm,

/*Natural Gas Amount*/
city_metrics_nat_gas_joined.total_residential_nat_gas,
city_metrics_nat_gas_joined.total_com_and_ind_nat_gas
)

FROM city_metrics_cost_factors, city_metrics_nat_gas_joined
WHERE city_metrics_cost_factors.year = city_metrics_nat_gas_joined.year
