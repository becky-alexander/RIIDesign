CREATE TABLE city_metrics_cost_factors

(
id SERIAL PRIMARY KEY,
year VARCHAR(4),

/*Electricity*/
residential_electricity NUMERIC (16,4),
commerical_electricity NUMERIC (16,4),
industrial_electricity NUMERIC (16,4),
retail_electricity NUMERIC (16,4),


/*Natural Gas*/
residential_nat_gas NUMERIC (16,4),
commerical_nat_gas NUMERIC (16,4),
industrial_nat_gas NUMERIC (16,4),

/*VMT*/
travel_total_fuel_cost


/*Solid Waste Management*/
solid_waste_processed NUMERIC (16,4),
solid_waste_landfilled NUMERIC (16,4),
solid_waste_recycled NUMERIC (16,4),

/*Potable Water Production and Distribution*/
electricity_consumer_per_gallon_water NUMERIC (16,4),
cost_per_gallon_water NUMERIC (16,4),

/*Waste Water Treatment*/
wastewater_electricity NUMERIC (16,4),
wastewater_natural_gas NUMERIC (16,4),
wastewater_fuel_oil NUMERIC (16,4),

other_coal NUMERIC (16,4),
other_fuel_oil NUMERIC (16,4),
propane NUMERIC (16,4),
diesel NUMERIC (16,4),
wood NUMERIC (16,4)

;


/**/

COPY city_metrics_cost_factor_electricity FROM 'C:/csv_files/city_metrics_cost_factor_electricity.csv' DELIMITER ',' CSV HEADER;
