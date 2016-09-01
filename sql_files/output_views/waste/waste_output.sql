CREATE OR REPLACE VIEW city_metrics_waste AS
SELECT

    0 AS id,
    city_metrics_waste_city.city_id AS city_id,
    city_metrics_waste_city.year,
    city_metrics_waste_city.estimated_msw_recycled * 1000 AS recycled,
    city_metrics_waste_city.estimated_msw_land_dispossed * 1000 AS landfilled,
    city_metrics_waste_city.estimated_msw_processed * 1000 AS incinerated
 FROM city_metrics_waste_city
