﻿CREATE OR REPLACE VIEW city_metrics_electricity_joined AS
SELECT

city_metrics_electricity_utility1.city_id,
city_metrics_electricity_utility1.year,


EF_utility_id1,
city_metrics_electricity_utility1.total_electricity_utility1,
city_metrics_electricity_utility1.residential_electricity,
city_metrics_electricity_utility1.com_and_ind_electricity,

city_metrics_electricity_utility1.emissions_utility1,
city_metrics_electricity_utility1.emissions_residential_utility1,
city_metrics_electricity_utility1.emissions_com_and_ind_utility1,


EF_utility_id2,
city_metrics_electricity_utility2.total_electricity_utility2,
city_metrics_electricity_utility2.residential_electricity2,
city_metrics_electricity_utility2.com_and_ind_electricity2,

city_metrics_electricity_utility2.emissions_utility2,
city_metrics_electricity_utility2.emissions_residential_utility2,
city_metrics_electricity_utility2.emissions_com_and_ind_utility2,



EF_utility_id3,
city_metrics_electricity_utility3.total_electricity_utility3,
city_metrics_electricity_utility3.residential_electricity3,
city_metrics_electricity_utility3.com_and_ind_electricity3,

city_metrics_electricity_utility3.emissions_utility3,
city_metrics_electricity_utility3.emissions_residential_utility3,
city_metrics_electricity_utility3.emissions_com_and_ind_utility3,



(
total_electricity_utility1 + total_electricity_utility2 + total_electricity_utility3
) AS total_electricity,

(
city_metrics_electricity_utility1.residential_wind_electricity +
city_metrics_electricity_utility2.residential_wind_electricity2 +
city_metrics_electricity_utility3.residential_wind_electricity3
) AS total_residential_wind_electricity,


(
city_metrics_electricity_utility1.com_and_ind_wind_electricity +
city_metrics_electricity_utility2.com_and_ind_wind_electricity2 +
city_metrics_electricity_utility3.com_and_ind_wind_electricity3
) AS total_com_and_ind_wind_electricity,

(
city_metrics_electricity_utility1.residential_electricity +  city_metrics_electricity_utility2.residential_electricity2 + city_metrics_electricity_utility3.residential_electricity3
) AS total_residential_electricity,

(
city_metrics_electricity_utility1.com_and_ind_electricity  +  city_metrics_electricity_utility2.com_and_ind_electricity2 + city_metrics_electricity_utility3.com_and_ind_electricity3
) AS total_com_and_ind_electricity,

(
emissions_utility1 + emissions_utility2 + emissions_utility3
) AS total_emissions_electricity,

(
city_metrics_electricity_utility1.emissions_residential_utility1 + city_metrics_electricity_utility2.emissions_residential_utility2 + city_metrics_electricity_utility3.emissions_residential_utility3
) AS total_residential_emissions_electricity,

(
city_metrics_electricity_utility1.emissions_com_and_ind_utility1 + city_metrics_electricity_utility2.emissions_com_and_ind_utility2 + city_metrics_electricity_utility3.emissions_com_and_ind_utility3
) AS total_com_and_ind_emissions_electricity



FROM city_metrics_electricity_utility1, city_metrics_electricity_utility2, city_metrics_electricity_utility3
WHERE city_metrics_electricity_utility1.city_id = city_metrics_electricity_utility2.city_id
AND city_metrics_electricity_utility1.city_id = city_metrics_electricity_utility3.city_id

AND city_metrics_electricity_utility1.year = city_metrics_electricity_utility2.year
AND city_metrics_electricity_utility1.year = city_metrics_electricity_utility3.year
