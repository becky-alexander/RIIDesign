CREATE OR REPLACE VIEW  city_metrics_waste_facility1 AS
SELECT

/*Import year and county*/
city_metrics_solid_waste_input.year,
city_metrics_solid_waste_input.county_id,
/*Import facility and amount*/
city_metrics_solid_waste_input.facility_id1,
city_metrics_solid_waste_input.processed_facility1,
/*Import information about facility*/
city_metrics_waste_processing_facility_emission_factors.facility_id,

  /*Import the emission rates, if there are any*/

  /*Import the information necessary to estimate emission rates, if there rates are null*/
city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions,
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions,
city_metrics_waste_processing_facility_emission_factors.exported_electricity,
    /*Import the total waste at facility*/
city_metrics_waste_processing_facility_emission_factors.total_waste AS total_waste_at_facility,


/*Calculate  the total emissions a the facility*/
(city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions +
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions)
AS total_emissions_at_facility,


/*Calculate the fossil emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions) /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)
END AS fossil_emission_rate,


/*Calculate the biogenic emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN NULL
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste))
END AS biogenic_emission_rate,


/*FOSSIL EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate * city_metrics_solid_waste_input.processed_facility1
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN NULL
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility1))
END AS fossil_emissions_county,


/*BIOGENIC EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate * city_metrics_solid_waste_input.processed_facility1
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN NULL
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility1))
END AS biogenic_emissions_county

FROM city_metrics_solid_waste_input, city_metrics_waste_processing_facility_emission_factors
WHERE city_metrics_waste_processing_facility_emission_factors.facility_id = city_metrics_solid_waste_input.facility_id1
AND city_metrics_waste_processing_facility_emission_factors.year = city_metrics_solid_waste_input.year;

/* FACILITY 2 */

CREATE OR REPLACE VIEW  city_metrics_waste_facility2 AS
SELECT

/*Import year and county*/
city_metrics_solid_waste_input.year,
city_metrics_solid_waste_input.county_id,
/*Import facility and amount*/
city_metrics_solid_waste_input.facility_id2,
city_metrics_solid_waste_input.processed_facility2,
/*Import information about facility*/
city_metrics_waste_processing_facility_emission_factors.facility_id,

  /*Import the emission rates, if there are any*/

  /*Import the information necessary to estimate emission rates, if there rates are null*/
city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions,
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions,
city_metrics_waste_processing_facility_emission_factors.exported_electricity,
    /*Import the total waste at facility*/
city_metrics_waste_processing_facility_emission_factors.total_waste AS total_waste_at_facility,


/*Calculate  the total emissions a the facility*/
(city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions +
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions)
AS total_emissions_at_facility,


/*Calculate the fossil emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions) /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)
END AS fossil_emission_rate,


/*Calculate the biogenic emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste))
END AS biogenic_emission_rate,


/*FOSSIL EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate * city_metrics_solid_waste_input.processed_facility2
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility2))
END AS fossil_emissions_county,


/*BIOGENIC EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate * city_metrics_solid_waste_input.processed_facility2
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility2))
END AS biogenic_emissions_county

FROM city_metrics_solid_waste_input, city_metrics_waste_processing_facility_emission_factors
WHERE city_metrics_waste_processing_facility_emission_factors.facility_id = city_metrics_solid_waste_input.facility_id2
AND city_metrics_waste_processing_facility_emission_factors.year = city_metrics_solid_waste_input.year;




/* FACILITY 3 */



CREATE OR REPLACE VIEW  city_metrics_waste_facility3 AS
SELECT

/*Import year and county*/
city_metrics_solid_waste_input.year,
city_metrics_solid_waste_input.county_id,
/*Import facility and amount*/
city_metrics_solid_waste_input.facility_id3,
city_metrics_solid_waste_input.processed_facility3,
/*Import information about facility*/
city_metrics_waste_processing_facility_emission_factors.facility_id,

  /*Import the emission rates, if there are any*/

  /*Import the information necessary to estimate emission rates, if there rates are null*/
city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions,
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions,
city_metrics_waste_processing_facility_emission_factors.exported_electricity,
    /*Import the total waste at facility*/
city_metrics_waste_processing_facility_emission_factors.total_waste AS total_waste_at_facility,


/*Calculate  the total emissions a the facility*/
(city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions +
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions)
AS total_emissions_at_facility,


/*Calculate the fossil emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions) /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)
END AS fossil_emission_rate,


/*Calculate the biogenic emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste))
END AS biogenic_emission_rate,


/*FOSSIL EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate * city_metrics_solid_waste_input.processed_facility3
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility3))
END AS fossil_emissions_county,


/*BIOGENIC EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate * city_metrics_solid_waste_input.processed_facility3
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility3))
END AS biogenic_emissions_county

FROM city_metrics_solid_waste_input, city_metrics_waste_processing_facility_emission_factors
WHERE city_metrics_waste_processing_facility_emission_factors.facility_id = city_metrics_solid_waste_input.facility_id3
AND city_metrics_waste_processing_facility_emission_factors.year = city_metrics_solid_waste_input.year;


/* FACILITY 4 */

CREATE OR REPLACE VIEW  city_metrics_waste_facility4 AS
SELECT

/*Import year and county*/
city_metrics_solid_waste_input.year,
city_metrics_solid_waste_input.county_id,
/*Import facility and amount*/
city_metrics_solid_waste_input.facility_id4,
city_metrics_solid_waste_input.processed_facility4,
/*Import information about facility*/
city_metrics_waste_processing_facility_emission_factors.facility_id,

  /*Import the emission rates, if there are any*/

  /*Import the information necessary to estimate emission rates, if there rates are null*/
city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions,
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions,
city_metrics_waste_processing_facility_emission_factors.exported_electricity,
    /*Import the total waste at facility*/
city_metrics_waste_processing_facility_emission_factors.total_waste AS total_waste_at_facility,


/*Calculate  the total emissions a the facility*/
(city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions +
city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions)
AS total_emissions_at_facility,


/*Calculate the fossil emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions) /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)
END AS fossil_emission_rate,


/*Calculate the biogenic emission rate*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste))
END AS biogenic_emission_rate,


/*FOSSIL EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.fossil_emission_rate * city_metrics_solid_waste_input.processed_facility4
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_fossil_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility4))
END AS fossil_emissions_county,


/*BIOGENIC EMISSION COUNTY*/
CASE
  WHEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate
    IS NOT NULL THEN city_metrics_waste_processing_facility_emission_factors.biogenic_emission_rate * city_metrics_solid_waste_input.processed_facility4
  WHEN city_metrics_waste_processing_facility_emission_factors.total_waste = 0 THEN 1
  ELSE
  (((city_metrics_waste_processing_facility_emission_factors.total_biogenic_emissions /
  (city_metrics_waste_processing_facility_emission_factors.total_waste)) * city_metrics_solid_waste_input.processed_facility4))
END AS biogenic_emissions_county

FROM city_metrics_solid_waste_input, city_metrics_waste_processing_facility_emission_factors
WHERE city_metrics_waste_processing_facility_emission_factors.facility_id = city_metrics_solid_waste_input.facility_id4
AND city_metrics_waste_processing_facility_emission_factors.year = city_metrics_solid_waste_input.year;




/* JOINED */


CREATE OR REPLACE VIEW city_metrics_waste_joined AS
SELECT


city_metrics_solid_waste_input.year,
city_metrics_solid_waste_input.county_id,
city_metrics_solid_waste_input.recycled,
city_metrics_solid_waste_input.land_dispossed,
city_metrics_solid_waste_input.land_dispossed_without_ch4_recovery,
(
(
(city_metrics_solid_waste_input.land_dispossed - city_metrics_solid_waste_input.land_dispossed_without_ch4_recovery)/city_metrics_solid_waste_input.land_dispossed
) * 0.75
) AS methane_recovery_factor,

(
city_metrics_solid_waste_input.processed_facility1 +
city_metrics_solid_waste_input.processed_facility2 +
city_metrics_solid_waste_input.processed_facility3 +
city_metrics_solid_waste_input.processed_facility4
) AS processed_all_facilities,

(
city_metrics_waste_facility1.fossil_emissions_county +
city_metrics_waste_facility2.fossil_emissions_county +
city_metrics_waste_facility3.fossil_emissions_county +
city_metrics_waste_facility4.fossil_emissions_county
) AS total_fossil_emissions_county,

(
city_metrics_waste_facility1.biogenic_emissions_county +
city_metrics_waste_facility2.biogenic_emissions_county +
city_metrics_waste_facility3.biogenic_emissions_county +
city_metrics_waste_facility4.biogenic_emissions_county
) AS total_biogenic_emissions_county

FROM  city_metrics_solid_waste_input, city_metrics_waste_facility1, city_metrics_waste_facility2, city_metrics_waste_facility3, city_metrics_waste_facility4
WHERE city_metrics_solid_waste_input.year = city_metrics_waste_facility1.year
AND city_metrics_waste_facility1.year = city_metrics_waste_facility2.year
AND city_metrics_waste_facility2.year = city_metrics_waste_facility3.year
AND city_metrics_waste_facility3.year = city_metrics_waste_facility4.year
AND city_metrics_solid_waste_input.county_id = city_metrics_waste_facility1.county_id
AND city_metrics_waste_facility1.county_id = city_metrics_waste_facility2.county_id
AND city_metrics_waste_facility2.county_id = city_metrics_waste_facility3.county_id
AND city_metrics_waste_facility3.county_id = city_metrics_waste_facility4.county_id
