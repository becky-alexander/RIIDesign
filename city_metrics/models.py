# 9/10/2016 - Mauricio Leon - To understand this models.py we need to remember
# that Django came before the database so here we are creating the SQL tables
#

from django.db import models


CITY_TYPES = (
	('C', 'Central/Stand Alone'),
	('I', 'Inner-Ring Suburbs'),
	('O', 'Outer-Ring Suburbs'),
)

class CityMetricsCounty(models.Model):
    id = models.IntegerField(primary_key=True)
    county = models.CharField(max_length=50, blank=True, help_text='Ex. Hennepin')
    class Meta:
        db_table = u'city_metrics_county'

    def __unicode__(self):
	return "%s" % (self.county)

class City(models.Model):
	id = models.IntegerField(primary_key=True)
	city = models.CharField(max_length=100)
	county_id = models.ForeignKey(CityMetricsCounty, db_column='county_id', verbose_name='County')
	state = models.CharField(max_length=100)
	type = models.CharField(max_length=100, choices=CITY_TYPES)
	sort_order = models.IntegerField()

	def __unicode__(self):
		return " %s, %s" % (self.city, self.state)

	class Meta:
		verbose_name = 'City'
		verbose_name_plural = 'Cities'
		ordering = ('sort_order',)


class DemographicData(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')
	population = models.DecimalField(max_digits=16, decimal_places=4)
	jobs = models.DecimalField(max_digits=16, decimal_places=4)
	households = models.DecimalField(max_digits=16, decimal_places=4)

	def __unicode__(self):
		return "Population - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Demographic Data'
		verbose_name_plural = 'Demographic Data'
		ordering = ('year', 'city__city')

class Cost(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	# TOTALS
	energy_associated_costs = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='Total energy costs')
	water_associated_costs = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='Total water costs')
	travel_associated_costs = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='Total travel costs')
	waste_associated_costs = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='Total waste costs')

	# WN TOTALS
	wn_energy_associated_costs = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN total energy costs')

	# ENERGY BY TYPE
	energy_type_electricity = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	energy_type_natural_gas = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	energy_type_other = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)

	# WN ENERGY BY TYPE
	wn_energy_type_electricity = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy type electricity')
	wn_energy_type_natural_gas = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy type natural gas')
	wn_energy_type_other = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy type other')

	# ENERGY BY USE
	energy_use_residential = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	energy_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='Energy use com/ind')

	# WN ENERGY BY USE
	wn_energy_use_residential = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy use residential')
	wn_energy_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy use com/ind')

	# WATER BY USE
	water_use_residential = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	water_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='Water use com/ind')

	# WASTE BY METHOD
	waste_method_recycled = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	waste_method_landfilled = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	waste_method_incinerated = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)

	def __unicode__(self):
		return "Cost - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Cost'
		verbose_name_plural = 'Costs'

TRENDLINE_TYPES = (
	('State', 'State'),
	('US', 'US'),
)

CHARTS = (
	('energy', 'Energy'),
	('water', 'Water'),
	('travel', 'Travel'),
	('waste', 'Waste'),
	('emissions', 'GHG Emissions'),
	('cost', 'Cost'),
)


class SpecialTrendLine(models.Model):
	type = models.CharField(max_length=100, choices=TRENDLINE_TYPES)
	chart = models.CharField(max_length=100, choices=CHARTS)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	no_normalize = models.DecimalField(max_digits=16, decimal_places=4)
	capita_normalize = models.DecimalField(max_digits=16, decimal_places=4)
	household_normalize = models.DecimalField(max_digits=16, decimal_places=4)
	employment_normalize = models.DecimalField(max_digits=16, decimal_places=4)
	weather_normalize = models.DecimalField(max_digits=16, decimal_places=4)

	def __unicode__(self):
		return " %s -- %s" % (self.type, self.year)

	class Meta:
		verbose_name = 'Special Trend Line'
		verbose_name_plural = 'Special Trend Lines'
		ordering = ('year', 'type')

YEARS = (
	('2000', '2000'),
	('2001', '2001'),
	('2002', '2002'),
	('2003', '2003'),
	('2004', '2004'),
	('2005', '2005'),
	('2006', '2006'),
	('2007', '2007'),
	('2008', '2008'),
	('2009', '2009'),
	('2010', '2010'),
	('2011', '2011'),
	('2012', '2012'),
	('2013', '2013'),
	('2014', '2014'),
	('2015', '2015'),
	('2016', '2016'),
	('2017', '2017'),
	('2018', '2018'),
	('2019', '2019'),
	('2020', '2020'),
)

class CityMetricsWaterInput(models.Model):
    id = models.AutoField(primary_key=True)
    city_id = models.ForeignKey(City, db_column='city_id', verbose_name='City')
    year = models.CharField(max_length=4, blank=True)
    # WATER BY SECTOR
    residential_water = models.DecimalField(max_digits=16, decimal_places=4, help_text='Gallons', verbose_name='Residential Water')
    commercial_water = models.DecimalField(max_digits=16, decimal_places=4, help_text='Gallons', verbose_name='Commercial Water')
    industrial_water = models.DecimalField(max_digits=16, decimal_places=4, help_text='Gallons', verbose_name='Industrial Water')
    other_water = models.DecimalField(max_digits=16, decimal_places=4, help_text='Gallons', verbose_name='Other Water')
    class Meta:
        db_table = u'city_metrics_water_input'
	verbose_name = 'Water'
	verbose_name_plural = 'Water'
	unique_together = ('city_id', 'year')
    def __unicode__(self):
	return " %s -- %s" % (self.city_id, self.year)

UTILITY_TYPES = (
	('Electric', 'Electric'),
	('Natural Gas', 'Natural Gas'),
)

class CityMetricsEnergyUtilities(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, verbose_name='Utility Name', unique=True)
    type = models.CharField(max_length=50, verbose_name='Type', choices=UTILITY_TYPES)
    class Meta:
        db_table = u'city_metrics_energy_utilities'
	verbose_name = 'Energy Utility'
	verbose_name_plural = 'Energy Utilities'
    def __unicode__(self):
	return "%s" % (self.name)

class CityMetricsElectricInput(models.Model):
    id = models.AutoField(primary_key=True)
    city_id = models.ForeignKey(City, db_column='city_id', verbose_name='City')
    year = models.CharField(max_length=4)
    # ELECTRICITY UTILITY 1
    utility_id1 = models.ForeignKey(CityMetricsEnergyUtilities, related_name="Utility I", verbose_name='Utility #1', db_column='utility_id1')
    residential_electricity = models.DecimalField(max_digits=16, decimal_places=4, help_text = "kWh", verbose_name='Total Residential Electricity')
    com_and_ind_electricity = models.DecimalField(max_digits=16, decimal_places=4, help_text = "kWh", verbose_name='Total Commericial & Industrial Electricity')
    residential_wind_electricity = models.DecimalField(max_digits=16, blank=True, default=0.00, decimal_places=4, help_text = "kWh", verbose_name='Residential Electricity (wind generated)')
    com_and_ind_wind_electricity = models.DecimalField(max_digits=16, blank=True, default=0.00, decimal_places=4, help_text = "kWh", verbose_name='Commericial & Industrial Electricity (wind generated)')
    # ELECTRICITY UTILITY 2
    utility_id2 = models.ForeignKey(CityMetricsEnergyUtilities, related_name="Utility II", default='NONE', verbose_name='Utility #2', db_column='utility_id2')
    residential_electricity2 = models.DecimalField(max_digits=16, decimal_places=4, blank=True, default=0.00, help_text = "kWh", verbose_name='Total Residential Electricity')
    com_and_ind_electricity2 = models.DecimalField(max_digits=16, decimal_places=4, blank=True, default=0.00, help_text = "kWh", verbose_name='Total Commericial & Industrial Electricity')
    residential_wind_electricity2 = models.DecimalField(blank=True, default=0.00, max_digits=16, decimal_places=4, help_text = "kWh", verbose_name='Residential Electricity (wind generated)')
    com_and_ind_wind_electricity2 = models.DecimalField(blank=True, default=0.00, max_digits=16, decimal_places=4, help_text = "kWh", verbose_name='Commericial & Industrial Electricity (wind generated)')
    # ELECTRICITY UTILITY 3
    utility_id3 = models.ForeignKey(CityMetricsEnergyUtilities, blank=True, default='NONE', db_column='utility_id3', related_name="Utility III", verbose_name='Utility #3')
    residential_electricity3 = models.DecimalField(blank=True, max_digits=16, decimal_places=4, default=0.00, help_text = "kWh", verbose_name='Total Residential Electricity')
    com_and_ind_electricity3 = models.DecimalField(blank=True, max_digits=16, decimal_places=4, default=0.00, help_text = "kWh", verbose_name='Total Commericial & Industrial Electricity')
    residential_wind_electricity3 = models.DecimalField(blank=True, max_digits=16, decimal_places=4, default=0.00, help_text = "kWh", verbose_name='Residential Electricity (wind generated)')
    com_and_ind_wind_electricity3 = models.DecimalField(blank=True, max_digits=16, decimal_places=4, default=0.00, help_text = "kWh", verbose_name='Total Commericial & Industrial Electricity')
    class Meta:
        db_table = u'city_metrics_electric_input'
	verbose_name = 'Electricity'
	verbose_name_plural = 'Electricity'
	unique_together = ('city_id', 'year')
    def __unicode__(self):
        return " %s -- %s" % (self.city_id, self.year)

class CityMetricsNatGasInput(models.Model):
    id = models.AutoField(primary_key=True)
    city_id = models.ForeignKey(City, db_column='city_id', verbose_name='City')
    year = models.CharField(max_length=4, help_text='ex: 2012', choices=YEARS)
    utility_ida = models.ForeignKey(CityMetricsEnergyUtilities, related_name="Utility A", verbose_name='Utility #1', db_column='utility_ida')
    residential_nat_gasa = models.DecimalField(max_digits=16, decimal_places=4, help_text='therms', verbose_name='Total Residential Natural Gas')
    com_and_ind_nat_gasa = models.DecimalField(max_digits=16, decimal_places=4, help_text='therms', verbose_name='Total Commericial and Industrial Natural Gas')
    utility_idb = models.ForeignKey(CityMetricsEnergyUtilities, null=True, blank=True, related_name="Utility B", verbose_name='Utility #2', db_column='utility_idb')
    residential_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='Total Residential Natural Gas', help_text='therms')
    com_and_ind_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='Total Commericial and Industrial Natural Gas', help_text='therms')
    utility_idc = models.ForeignKey(CityMetricsEnergyUtilities, null=True, blank=True, related_name="Utility C", verbose_name='Utility #3', db_column='utility_idc')
    residential_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='Total Residential Natural Gas', help_text='therms')
    com_and_ind_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='Total Commericial and Industrial Natural Gas', help_text='therms')
    class Meta:
        db_table = u'city_metrics_nat_gas_input'
	verbose_name = 'Natural Gas'
	verbose_name_plural = 'Natural Gas'
    def __unicode__(self):
        return " %s -- %s" % (self.city_id, self.year)

class CityMetricsEnergyUtilitiesEmissionFactors(models.Model):
    id = models.AutoField(primary_key=True)
    year = models.CharField(max_length=4, blank=True, choices=YEARS)
    utility_id = models.ForeignKey(CityMetricsEnergyUtilities, db_column='utility_id', help_text='ex: Xcel Energy', related_name='utility')
    type = models.CharField(max_length=50, blank=True)
    co2_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='CO2 Emission Factor', help_text='lbs/MWH (electric) or kg/therm (gas)')
    n2o_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='N2O Emission Factor', help_text='lbs/MWH (electric) or kg/therm (gas)')
    ch4_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, verbose_name='CH4 Emission Factor', help_text='lbs/MWH (electric) or kg/therm (gas)')
    def __unicode__(self):
	return "%s" % (self.utility)
    class Meta:
        db_table = u'city_metrics_energy_utilities_emission_factors'
	verbose_name = 'Energy Utilities (emission factors)'
	verbose_name_plural = 'Energy Utilities (emission factors)'

class CityMetricsWasteProcessingFacility(models.Model):
    id = models.AutoField(primary_key=True)
    facility_name = models.CharField(max_length=50, blank=True)
    def __unicode__(self):
	return "%s" % (self.facility_name)
    class Meta:
        db_table = u'city_metrics_waste_processing_facility'
	verbose_name = 'Solid Waste Facility'
	verbose_name_plural = 'Solid Waste Facilities'


class CityMetricsSolidWasteInput(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True, choices=YEARS)
    county_id = models.ForeignKey(CityMetricsCounty, db_column='id', null=True, blank=True, verbose_name='County')
    recycled = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    land_dispossed = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    land_dispossed_without_ch4_recovery = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    facility_id1 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id1', blank=True, related_name="Facility I", verbose_name='Utility #1')
    processed_facility1 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    facility_id2 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id2', blank=True, related_name="Facility II", verbose_name='Utility #2')
    processed_facility2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    facility_id3 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id3', blank=True, related_name="Facility III", verbose_name='Utility #3')
    processed_facility3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    facility_id4 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id4', blank=True, related_name="Facility IV", verbose_name='Utility #4')
    processed_facility4 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True, default=0.00)
    class Meta:
        db_table = u'city_metrics_solid_waste_input'
	verbose_name =  'Solid Waste'
    def __unicode__(self):
        return " %s -- %s" % (self.county_id, self.year)

class CityMetricsWastewaterFacility(models.Model):
    id = models.AutoField(primary_key=True)
    wastewater_facility = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'city_metrics_wastewater_facility'
	verbose_name = 'Wastewater Facility'
	verbose_name_plural = 'Wastewater Facilities'
    def __unicode__(self):
	return "%s" % (self.wastewater_facility)

class CityMetricsWastewaterInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.ForeignKey(City, db_column='city_id', verbose_name='City')
    year = models.CharField(max_length=4, blank=True, choices=YEARS)
    wastewater_facility1_id = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True,  related_name="Facility_I", db_column='wastewater_facility1_id')
    wastewater_treated_facility1 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    wastewater_facility2_id = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True,  related_name="Facility_II", db_column='wastewater_facility2_id')
    wastewater_treated_facility2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    wastewater_facility3_id = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True,  related_name="Facility_III", db_column='wastewater_facility3_id')
    wastewater_treated_facility3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_wastewater_input'
	verbose_name = 'Wastewater Treated'
	verbose_name_plural = 'Wastewater Treated'
    def __unicode__(self):
	return " %s -- %s" % (self.city_id, self.year)


class CityMetricsOtherEnergyType(models.Model):
    id = models.AutoField(primary_key=True)
    other_fuel_name = models.CharField(max_length=50, blank=True)
    unit = models.CharField(max_length=50)
    kbtu = models.DecimalField(max_digits=16, decimal_places=4)
    ghg_tonnes = models.DecimalField(max_digits=16, decimal_places=4)
    ghg_per_kbtu = models.DecimalField(max_digits=16, decimal_places=4)
    class Meta:
        db_table = u'city_metrics_other_energy_type'
	verbose_name = 'Other Fuel (type)'
	verbose_name_plural = 'Other Fuels (types)'	
    def __unicode__(self):
	return "%s" % (self.other_fuel_name)

class CityMetricsOtherEnergyInput(models.Model):
    id = models.AutoField(primary_key=True)
    city_id = models.ForeignKey(City, db_column='city_id', verbose_name='City')
    year = models.CharField(max_length=4, choices=YEARS)
    # OTHER FUEL TYPE 1
    other_fuel_type1 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type1',  related_name="other_fuel_I")
    other_fuel_amount1_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount1_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    # OTHER FUEL TYPE 2
    other_fuel_type2 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type2',  related_name="other_fuel_II")
    other_fuel_amount2_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount2_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    # OTHER FUEL TYPE 3
    other_fuel_type3 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type3', related_name="other_fuel_III")
    other_fuel_amount3_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount3_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    # OTHER FUEL TYPE 4
    other_fuel_type4 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type4', related_name="other_fuel_IV")
    other_fuel_amount4_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount4_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    # OTHER FUEL TYPE 5
    other_fuel_type5 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type5', related_name="other_fuel_V")
    other_fuel_amount5_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount5_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    class Meta:
        db_table = u'city_metrics_other_energy_input'
	verbose_name = 'Other Fuel'
	verbose_name_plural = 'Other Fuels'
    def __unicode__(self):
        return " %s -- %s" % (self.city_id, self.year)







class Energy(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	# BY TYPE
	electricity = models.DecimalField(max_digits=16, decimal_places=4)
	natural_gas = models.DecimalField(max_digits=16, decimal_places=4)
	other = models.DecimalField(max_digits=16, decimal_places=4)

	# WN BY TYPE
	# WN = Weather Normalized
	wn_electricity = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN electricity')
	wn_natural_gas = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN natural gas')
	wn_other = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN other')

	# TOTALS BY USE
	total_res_energy = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='Residential energy')
	total_com_ind_energy = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='Com/Ind energy')

	# WN TOTALS BY USE
	wn_total_res_energy = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN Residential energy')
	wn_total_com_ind_energy = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN Com/Ind energy')

	def __unicode__(self):
		return "Energy - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Energy'
		verbose_name_plural = 'Energy'


class Water(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	# TOTALS BY USE
	total_res_water = models.DecimalField(max_digits=16, decimal_places=4)
	total_com_ind_water = models.DecimalField(max_digits=16, decimal_places=4)

	def __unicode__(self):
		return "Water - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Water'
		verbose_name_plural = 'Water'


class Travel(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	total_vmt = models.DecimalField(max_digits=16, decimal_places=4)

	def __unicode__(self):
		return "Travel - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Travel'
		verbose_name_plural = 'Travel'


class Waste(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	recycled = models.DecimalField(max_digits=16, decimal_places=4)
	landfilled = models.DecimalField(max_digits=16, decimal_places=4)
	incinerated = models.DecimalField(max_digits=16, decimal_places=4)

	def __unicode__(self):
		return "Waste - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Waste'
		verbose_name_plural = 'Waste'


class Emissions(models.Model):
	city = models.ForeignKey(City)
	year = models.CharField(max_length=4, help_text='ex: 2012')

	# TOTALS
	energy_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='Energy emission totals')
	water_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='Other emission totals')
	travel_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='Travel emission totals')
	waste_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='Waste emission totals')

	# WN TOTALS
	wn_energy_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN Total energy emissions')
	wn_water_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN Total water emissions')
	wn_travel_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN Total travel emissions')
	wn_waste_associated_emissions = models.DecimalField(max_digits=16, decimal_places=4, verbose_name='WN Total waste emissions')

	# ENERGY BY TYPE
	energy_type_electricity = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	wn_energy_type_electricity = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy type electricity')
	energy_type_natural_gas = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	wn_energy_type_natural_gas = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy type natural gas')
	energy_type_other = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	wn_energy_type_other = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy type other')

	# ENERGY BY USE
	energy_use_residential = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	wn_energy_use_residential = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy use residential')
	energy_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	wn_energy_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4, default=0.00, verbose_name='WN energy use com/ind')

	# WASTE BY METHOD
	waste_method_recycled = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	waste_method_landfilled = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)
	waste_method_incinerated = models.DecimalField(max_digits=16, decimal_places=4, default=0.00)

	def __unicode__(self):
		return "Emissions - %s, %s" % (self.city.city, self.city.state)

	class Meta:
		verbose_name = 'Emission'
		verbose_name_plural = 'Emissions'
