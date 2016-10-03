from django.db import models

STATES = (
    ('AK', 'Alaska'),
    ('AL', 'Alabama'),
    ('AZ', 'Arizona'),
    ('AR', 'Arkansas'),
    ('CA', 'California'),
    ('CO', 'Colorado'),
    ('CT', 'Connecticut'),
    ('DE', 'Delaware'),
    ('FL', 'Florida'),
    ('GA', 'Georgia'),
    ('HI', 'Hawaii'),
    ('ID', 'Idaho'),
    ('IL', 'Illinois'),
    ('IN', 'Indiana'),
    ('IA', 'Iowa'),
    ('KS', 'Kansas'),
    ('KY', 'Kentucky'),
    ('LA', 'Louisiana'),
    ('ME', 'Maine'),
    ('MD', 'Maryland'),
    ('MA', 'Massachusetts'),
    ('MI', 'Michigan'),
    ('MN', 'Minnesota'),
    ('MS', 'Mississippi'),
    ('MO', 'Missouri'),
    ('MT', 'Montana'),
    ('NE', 'Nebraska'),
    ('NV', 'Nevada'),
    ('NH', 'New Hampshire'),
    ('NJ', 'New Jersey'),
    ('NM', 'New Mexico'),
    ('NY', 'New York'),
    ('NC', 'North Carolina'),
    ('ND', 'North Dakota'),
    ('OH', 'Ohio'),
    ('OK', 'Oklahoma'),
    ('OR', 'Oregon'),
    ('PA', 'Pennsylvania'),
    ('RI', 'Rhode Island'),
    ('SC', 'South Carolina'),
    ('SD', 'South Dakota'),
    ('TN', 'Tennessee'),
    ('TX', 'Texas'),
    ('UT', 'Utah'),
    ('VT', 'Vermont'),
    ('VA', 'Virginia'),
    ('WA', 'Washington'),
    ('DC', 'Washington D.C.'),
    ('WV', 'West Virginia'),
    ('WI', 'Wisconsin'),
    ('WY', 'Wyoming')
)


CITY_TYPES = (
	('C', 'Central/Stand Alone'),
	('I', 'Inner-Ring Suburbs'),
	('O', 'Outer-Ring Suburbs'),
)


class City(models.Model):
	city = models.CharField(max_length=100)
	state = models.CharField(max_length=100, choices=STATES)

	type = models.CharField(max_length=100, choices=CITY_TYPES)

	sort_order = models.IntegerField()

	def __unicode__(self):
		return " %s, %s" % (self.city, self.state)

	class Meta:
		verbose_name = 'City'
		verbose_name_plural = 'Cities'
		#ordering = ('sort_order',)


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

class CityMetricsWaterInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)

    residential_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    commerical_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    industrial_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    other_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)

    class Meta:
        db_table = u'city_metrics_water_input'

class CityMetricsNatGasInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField()

    utility_ida = models.ForeignKey(CityMetricsEnergyUtilities, db_column='utility_ida')
    com_and_ind_nat_gasa = models.DecimalField(max_digits=16, decimal_places=4)
    residential_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_idc = models.ForeignKey(CityMetricsEnergyUtilities, null=True, db_column='utility_idc', blank=True)
    com_and_ind_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)

    class Meta:
        db_table = u'city_metrics_nat_gas_input'

class CityMetricsElectricInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField()
    year = models.CharField(max_length=4)

    utility_id1 = models.ForeignKey(CityMetricsEnergyUtilities, db_column='utility_id1')
    residential_electricity = models.DecimalField(max_digits=16, decimal_places=4)
    com_and_ind_electricity = models.DecimalField(max_digits=16, decimal_places=4)
    residential_wind_electricity = models.DecimalField(max_digits=16, decimal_places=4)
    com_and_ind_wind_electricity = models.DecimalField(max_digits=16, decimal_places=4)
    utility_id2 = models.ForeignKey(CityMetricsEnergyUtilities, null=True, db_column='utility_id2', blank=True)
    residential_electricity2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_electricity2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    residential_wind_electricity2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_wind_electricity2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_id3 = models.ForeignKey(CityMetricsEnergyUtilities, null=True, db_column='utility_id3', blank=True)
    residential_electricity3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_electricity3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    residential_wind_electricity3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_wind_electricity3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)

    class Meta:
        db_table = u'city_metrics_electric_input'

class CityMetricsWastewaterInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)

    wastewater_facility1 = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True)
    wastewater_treated_facility1 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    wastewater_facility2 = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True)
    wastewater_treated_facility2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    wastewater_facility3 = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True)
    wastewater_treated_facility3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)

    class Meta:
        db_table = u'city_metrics_wastewater_input'

class CityMetricsSolidWasteInput(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county_id = models.IntegerField(null=True, blank=True)

    recycled = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    land_dispossed = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    land_dispossed_without_ch4_recovery = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id1 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id1', blank=True)
    processed_facility1 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id2 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id2', blank=True)
    processed_facility2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id3 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id3', blank=True)
    processed_facility3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id4 = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, db_column='facility_id4', blank=True)
    processed_facility4 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)

    class Meta:
        db_table = u'city_metrics_solid_waste_input'

class CityMetricsEnergyUtilitiesEmissionFactors(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    utility = models.ForeignKey(CityMetricsEnergyUtilities, null=True, blank=True)
    type = models.CharField(max_length=50, blank=True)
    co2_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ch4_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_energy_utilities_emission_factors'

class CityMetricsEnergyUtilities(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'city_metrics_energy_utilities'
