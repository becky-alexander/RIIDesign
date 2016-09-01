CREATE OR REPLACE VIEW city_metrics_vmt_auto AS
(
SELECT * FROM city_metrics_vmt_auto06
UNION ALL
SELECT * FROM city_metrics_vmt_auto07
UNION ALL
SELECT * FROM city_metrics_vmt_auto08
UNION ALL
SELECT * FROM city_metrics_vmt_auto09
UNION ALL
SELECT * FROM city_metrics_vmt_auto10
UNION ALL
SELECT * FROM city_metrics_vmt_auto11
UNION ALL
SELECT * FROM city_metrics_vmt_auto12
UNION ALL
SELECT * FROM city_metrics_vmt_auto13
UNION ALL
SELECT * FROM city_metrics_vmt_auto14
);


CREATE OR REPLACE VIEW city_metrics_vmt_auto_step2 AS
SELECT city_metrics_vmt_auto.City,
city_metrics_vmt_auto.Year,
city_metrics_vmt_auto.County,
SUM(CASE WHEN city_metrics_vmt_auto.type = 'Interstate Trunk' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "interstate_trunk_highway",
SUM(CASE WHEN city_metrics_vmt_auto.type = 'U.S. Trunk' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "us_trunk_highway",
SUM(CASE WHEN city_metrics_vmt_auto.type = 'Minnesota Trunk' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "minnesota_trunk_highway",
SUM(CASE WHEN city_metrics_vmt_auto.type = 'County State Aid' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "county_state_aid_highway",
SUM(CASE WHEN city_metrics_vmt_auto.type = 'Municipal State Aid' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "municipal_state_aid_highway",
SUM(CASE WHEN city_metrics_vmt_auto.type = 'County' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "county_road",
SUM(CASE WHEN city_metrics_vmt_auto.type = 'Municipal Streets' THEN city_metrics_vmt_auto.vmt ELSE '0' END) AS "municipal_streets"
FROM city_metrics_vmt_auto
GROUP BY County, City, Year
;

CREATE OR REPLACE VIEW city_metrics_vmt_roadway_input AS
SELECT

  city_metrics_vmt_auto_step2.year,
  city_metrics_city.city,
  city_metrics_city.id AS city_id,
  SUM (city_metrics_vmt_auto_step2.interstate_trunk_highway) as interstate_trunk_highway,
  SUM (city_metrics_vmt_auto_step2.us_trunk_highway) as us_trunk_highway,
  SUM (city_metrics_vmt_auto_step2.minnesota_trunk_highway) as minnesota_trunk_highway,
  SUM (city_metrics_vmt_auto_step2.county_state_aid_highway) as county_state_aid_highway,
  SUM (city_metrics_vmt_auto_step2.municipal_state_aid_highway) as municipal_state_aid_highway,
  SUM (city_metrics_vmt_auto_step2.county_road) as county_road,
  SUM (city_metrics_vmt_auto_step2.municipal_streets) as municipal_streets
FROM city_metrics_vmt_auto_step2, city_metrics_city
WHERE city_metrics_vmt_auto_step2.city = city_metrics_city.city
AND city_metrics_city.sort_order IS NOT NULL
GROUP BY city_metrics_city.city, city_metrics_vmt_auto_step2.year, city_metrics_city.id
ORDER BY city_metrics_city.id
