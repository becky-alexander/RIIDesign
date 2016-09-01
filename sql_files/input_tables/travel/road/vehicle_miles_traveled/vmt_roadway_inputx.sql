CREATE OR REPLACE VIEW city_metrics_vmt_roadway_inputx_interstate_trunk AS
SELECT DISTINCT

  city_metrics_vmt_auto11.year,
  city_metrics_vmt_auto11.city,
  city_metrics_vmt_auto11.county,
  city_metrics_vmt_auto11.type,
  city_metrics_vmt_auto11.vmt
FROM city_metrics_vmt_auto11
WHERE type = 'Interstate Trunk';

CREATE OR REPLACE VIEW city_metrics_vmt_roadway_inputx_minnesota_trunk AS
SELECT DISTINCT

  city_metrics_vmt_auto11.year,
  city_metrics_vmt_auto11.city,
  city_metrics_vmt_auto11.county,
  city_metrics_vmt_auto11.type,
  city_metrics_vmt_auto11.vmt
FROM city_metrics_vmt_auto11
WHERE type = 'Minnesota Trunk';

CREATE OR REPLACE VIEW city_metrics_vmt_roadway_inputx_county_state_aid AS
SELECT DISTINCT

  city_metrics_vmt_auto11.year,
  city_metrics_vmt_auto11.city,
  city_metrics_vmt_auto11.county,
  city_metrics_vmt_auto11.type,
  city_metrics_vmt_auto11.vmt
FROM city_metrics_vmt_auto11
WHERE type = 'County State Aid';

CREATE OR REPLACE VIEW city_metrics_vmt_roadway_inputx_county AS
SELECT DISTINCT

  city_metrics_vmt_auto11.year,
  city_metrics_vmt_auto11.city,
  city_metrics_vmt_auto11.county,
  city_metrics_vmt_auto11.type,
  city_metrics_vmt_auto11.vmt
FROM city_metrics_vmt_auto11
WHERE type = 'County';

CREATE OR REPLACE VIEW city_metrics_vmt_roadway_inputx_municipal_streets AS
SELECT DISTINCT

  city_metrics_vmt_auto11.year,
  city_metrics_vmt_auto11.city,
  city_metrics_vmt_auto11.county,
  city_metrics_vmt_auto11.type,
  city_metrics_vmt_auto11.vmt
FROM city_metrics_vmt_auto11
WHERE type = 'Municipal Streets';

CREATE OR REPLACE VIEW city_metrics_vmt_roadway_inputx_joined AS
SELECT DISTINCT

  city_metrics_vmt_auto11.year,
  city_metrics_vmt_auto11.city,

CASE WHEN city_metrics_vmt_roadway_inputx_interstate_trunk.vmt is NULL THEN '0'
    ELSE city_metrics_vmt_roadway_inputx_interstate_trunk.vmt
  END AS interstate_trunk,

CASE WHEN city_metrics_vmt_roadway_inputx_minnesota_trunk.vmt is NULL THEN '0'
   ELSE city_metrics_vmt_roadway_inputx_minnesota_trunk.vmt
  END AS minnesota_trunk,

CASE WHEN city_metrics_vmt_roadway_inputx_county_state_aid.vmt is NULL THEN '0'
   ELSE city_metrics_vmt_roadway_inputx_county_state_aid.vmt
  END AS county_state_aid,


CASE WHEN city_metrics_vmt_roadway_inputx_county.vmt is NULL THEN '0'
   ELSE city_metrics_vmt_roadway_inputx_county.vmt
  END AS county,


CASE WHEN city_metrics_vmt_roadway_inputx_municipal_streets.vmt is NULL THEN '0'
   ELSE city_metrics_vmt_roadway_inputx_municipal_streets.vmt
  END AS municipal_streets


FROM city_metrics_vmt_auto11,
city_metrics_vmt_roadway_inputx_interstate_trunk,
city_metrics_vmt_roadway_inputx_minnesota_trunk,
city_metrics_vmt_roadway_inputx_county_state_aid,
city_metrics_vmt_roadway_inputx_county,
city_metrics_vmt_roadway_inputx_municipal_streets

WHERE city_metrics_vmt_auto11.year = city_metrics_vmt_roadway_inputx_interstate_trunk.year
AND city_metrics_vmt_auto11.year = city_metrics_vmt_roadway_inputx_municipal_streets.year
AND city_metrics_vmt_auto11.year = city_metrics_vmt_roadway_inputx_county.year
AND city_metrics_vmt_auto11.year = city_metrics_vmt_roadway_inputx_county_state_aid.year
AND city_metrics_vmt_auto11.year = city_metrics_vmt_roadway_inputx_minnesota_trunk.city

AND city_metrics_vmt_auto11.city = city_metrics_vmt_roadway_inputx_interstate_trunk.city
AND city_metrics_vmt_auto11.city = city_metrics_vmt_roadway_inputx_municipal_streets.city
AND city_metrics_vmt_auto11.city = city_metrics_vmt_roadway_inputx_county.city
AND city_metrics_vmt_auto11.city = city_metrics_vmt_roadway_inputx_county_state_aid.city
AND city_metrics_vmt_auto11.city = city_metrics_vmt_roadway_inputx_minnesota_trunk.city
