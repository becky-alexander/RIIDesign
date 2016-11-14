CREATE OR REPLACE VIEW city_metrics_other_type4 AS
SELECT

city_metrics_other_energy_input.city_id,
city_metrics_other_energy_input.year,
city_metrics_other_energy_input.other_fuel_type4,
city_metrics_other_energy_input.other_fuel_amount4_residential,
city_metrics_other_energy_input.other_fuel_amount4_com_and_ind,

/*ENERGY*/
((city_metrics_other_energy_input.other_fuel_amount4_residential * city_metrics_other_energy_type.kbtu) / 1000) AS residential_other_energy4,
((city_metrics_other_energy_input.other_fuel_amount4_com_and_ind * city_metrics_other_energy_type.kbtu) / 1000) AS com_and_ind_other_energy4,

((city_metrics_other_energy_input.other_fuel_amount4_residential * city_metrics_other_energy_type.kbtu) * city_metrics_other_energy_type.GHG_per_Kbtu) AS residential_other_energy_emissions4,
((city_metrics_other_energy_input.other_fuel_amount4_com_and_ind * city_metrics_other_energy_type.kbtu) * city_metrics_other_energy_type.GHG_per_Kbtu) AS com_and_ind_other_energy_emissions4


FROM city_metrics_other_energy_input, city_metrics_other_energy_type
WHERE city_metrics_other_energy_input.other_fuel_type4 = city_metrics_other_energy_type.id
