CREATE OR REPLACE VIEW city_metrics_travel AS
SELECT
    ROW_NUMBER() OVER() AS id,
    city_metrics_vmt_roadway_input.city_id,
    city_metrics_vmt_roadway_input.year,
    (city_metrics_vmt_roadway_input.interstate_trunk_highway +
      city_metrics_vmt_roadway_input.us_trunk_highway +
      city_metrics_vmt_roadway_input.minnesota_trunk_highway +
      city_metrics_vmt_roadway_input.county_state_aid_highway +
      city_metrics_vmt_roadway_input.municipal_state_aid_highway +
      city_metrics_vmt_roadway_input.county_road +
      city_metrics_vmt_roadway_input.municipal_streets) AS total_vmt
   FROM city_metrics_vmt_roadway_input 
