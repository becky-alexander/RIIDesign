CREATE TABLE city_metrics_cost_factors

(
id SERIAL PRIMARY KEY,
year VARCHAR(4),

/*Electricity*/
residential_electricity_per_MWh NUMERIC (16,4),
commercial_electricity_per_MWh NUMERIC (16,4),
industrial_electricity_per_MWh NUMERIC (16,4),



/*Natural Gas*/
residential_nat_gas_per_therm NUMERIC (16,4),
commercial_nat_gas_per_therm NUMERIC (16,4),
industrial_nat_gas_per_therm NUMERIC (16,4),

/*VMT*/
travel_total_fuel_cost_per_mile NUMERIC (16,4),


/*Solid Waste Management*/
solid_waste_processed_per_ton NUMERIC (16,4),
solid_waste_landfilled_per_ton NUMERIC (16,4),
solid_waste_recycled_per_ton NUMERIC (16,4),

/*Potable Water Production and Distribution*/
electricity_consumed_kwh_per_gallon_water NUMERIC (16,4),
cost_per_gallon_water NUMERIC (16,4),

/*Waste Water Treatment*/
wastewater_electricity_per_million_gallons NUMERIC (16,4),
wastewater_natural_gas_per_million_gallons NUMERIC (16,4),
wastewater_fuel_oil_per_million_gallons NUMERIC (16,4),

/*Other Fuels*/
other_coal_per_short_ton NUMERIC (16,4),
other_fuel_oil_per_gallon NUMERIC (16,4),
propane_per_gallon NUMERIC (16,4),
diesel_per_gallon NUMERIC (16,4),
wood_per_ton NUMERIC (16,4)
)
;


/**/

COPY city_metrics_cost_factor_electricity FROM 'C:/csv_files/city_metrics_cost_factor_electricity.csv' DELIMITER ',' CSV HEADER;
