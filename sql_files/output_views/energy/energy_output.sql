CREATE OR REPLACE VIEW city_metrics_energy AS
SELECT
city_metrics_electric_input.id,
city_metrics_energy_intermediary1.city_id,
city_metrics_energy_intermediary1.year,
city_metrics_energy_intermediary1.total_electricity_mmbtu AS electricity,
city_metrics_energy_intermediary1.total_nat_gas_mmbtu AS natural_gas,
city_metrics_energy_intermediary1.total_wind_electricity_mmbtu AS other,
0 AS wn_electricity,
0 AS wn_natural_gas,
0 AS wn_other,
city_metrics_energy_intermediary1.total_residential_energy_mmbtu AS total_res_energy,
city_metrics_energy_intermediary1.total_com_and_ind_energy_mmbtu AS total_com_ind_energy,
city_metrics_energy_intermediary1.total_residential_energy_mmbtu AS wn_total_res_energy,
city_metrics_energy_intermediary1.total_com_and_ind_energy_mmbtu AS wn_total_com_ind_energy

FROM city_metrics_energy_intermediary1, city_metrics_electric_input
WHERE city_metrics_energy_intermediary1.year = city_metrics_electric_input.year
AND city_metrics_energy_intermediary1.city_id = city_metrics_electric_input.city_id
