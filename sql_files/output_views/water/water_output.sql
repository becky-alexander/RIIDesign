CREATE VIEW city_metrics_water AS
SELECT
    city_metrics_water_input.id,
    city_metrics_water_input.city_id,
    city_metrics_water_input.year,
    city_metrics_water_input.residential_water AS total_res_water,
    (
     city_metrics_water_input.commerical_water +
     city_metrics_water_input.industrial_water +
     city_metrics_water_input.other_water
   ) AS total_com_ind_water

FROM city_metrics_water_input JOIN city_metrics_city ON city_id = city_metrics_city.id
WHERE city_metrics_city.sort_order IS NOT NULL
