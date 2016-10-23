# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class CityMetricsCityWastewaterFacilityEmissions(models.Model):
    id = models.IntegerField(primary_key=True)
    facility = models.ForeignKey(CityMetricsWastewaterFacility, null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    total_waste_water_treated = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    scope2_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    scope1_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    biogenic_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    electricity_use = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    natural_gas_use = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_city_wastewater_facility_emissions'

class CityMetricsOtherEnergyInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city = models.ForeignKey(CityMetricsCity)
    year = models.CharField(max_length=4)
    other_fuel_type1 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type1')
    other_fuel_amount1_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount1_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_type2 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type2')
    other_fuel_amount2_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount2_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_type3 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type3')
    other_fuel_amount3_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount3_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_type4 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type4')
    other_fuel_amount4_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount4_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_type5 = models.ForeignKey(CityMetricsOtherEnergyType, db_column='other_fuel_type5')
    other_fuel_amount5_residential = models.DecimalField(max_digits=16, decimal_places=4)
    other_fuel_amount5_com_and_ind = models.DecimalField(max_digits=16, decimal_places=4)
    class Meta:
        db_table = u'city_metrics_other_energy_input'

class CityMetricsSpecialtrendline(models.Model):
    id = models.IntegerField(primary_key=True)
    type = models.CharField(max_length=100)
    chart = models.CharField(max_length=100)
    year = models.CharField(max_length=4)
    no_normalize = models.DecimalField(max_digits=16, decimal_places=4)
    capita_normalize = models.DecimalField(max_digits=16, decimal_places=4)
    household_normalize = models.DecimalField(max_digits=16, decimal_places=4)
    employment_normalize = models.DecimalField(max_digits=16, decimal_places=4)
    weather_normalize = models.DecimalField(max_digits=16, decimal_places=4)
    class Meta:
        db_table = u'city_metrics_specialtrendline'

class DjangoSite(models.Model):
    id = models.IntegerField(primary_key=True)
    domain = models.CharField(max_length=100)
    name = models.CharField(max_length=50)
    class Meta:
        db_table = u'django_site'

class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()
    class Meta:
        db_table = u'django_migrations'

class ReversionRevision(models.Model):
    id = models.IntegerField(primary_key=True)
    manager_slug = models.CharField(max_length=200)
    date_created = models.DateTimeField()
    user_id = models.IntegerField(null=True, blank=True)
    comment = models.TextField()
    class Meta:
        db_table = u'reversion_revision'

class DjangoSession(models.Model):
    session_key = models.CharField(max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        db_table = u'django_session'

class SiteContentWebpage(models.Model):
    id = models.IntegerField(primary_key=True)
    is_active = models.BooleanField()
    title = models.CharField(max_length=200)
    slug = models.CharField(max_length=50)
    template_override = models.CharField(max_length=40, blank=True)
    chart_title = models.CharField(max_length=100, blank=True)
    content = models.TextField(blank=True)
    class Meta:
        db_table = u'site_content_webpage'

class SiteContentHeaderlink(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    direct_url = models.CharField(max_length=200, blank=True)
    web_page = models.ForeignKey(SiteContentWebpage, null=True, blank=True)
    display_order = models.IntegerField()
    is_active = models.BooleanField()
    class Meta:
        db_table = u'site_content_headerlink'

class CityMetricsVehicleCh4AndN2OEmissionsFactor(models.Model):
    id = models.IntegerField(primary_key=True)
    ch4_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ch4_gasoline_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ch4_diesel_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ch4_diesel_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ch4_diesel_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_gasoline_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_diesel_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_diesel_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_diesel_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vehicle_ch4_and_n2o_emissions_factor'

class SiteContentHeadersublink(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    header_link = models.ForeignKey(SiteContentHeaderlink)
    direct_url = models.CharField(max_length=200, blank=True)
    web_page = models.ForeignKey(SiteContentWebpage, null=True, blank=True)
    display_order = models.IntegerField()
    is_active = models.BooleanField()
    class Meta:
        db_table = u'site_content_headersublink'

class SiteContentHomepageSection(models.Model):
    id = models.IntegerField(primary_key=True)
    sect_type = models.CharField(max_length=20)
    billboard_image = models.CharField(max_length=200, blank=True)
    graph_image = models.CharField(max_length=200, blank=True)
    graph_copy = models.TextField(blank=True)
    class Meta:
        db_table = u'site_content_homepage_section'

class SiteContentInpagelink(models.Model):
    id = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    title_detail = models.CharField(max_length=50, blank=True)
    bubble = models.CharField(max_length=200)
    bubble_active = models.CharField(max_length=200)
    teaser = models.CharField(max_length=150, blank=True)
    web_page = models.ForeignKey(SiteContentWebpage, null=True, blank=True)
    display_order = models.IntegerField()
    is_active = models.BooleanField()
    class Meta:
        db_table = u'site_content_inpagelink'

class CityMetricsEstimatedEnergyEmissionFactor(models.Model):
    year = models.CharField(max_length=4, blank=True)
    co2_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    n2o_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ch4_ef = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_id = models.IntegerField(null=True, blank=True)
    emission_factor = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_estimated_energy_emission_factor'

class CityMetricsBiofuelPercentages(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    gasoline_ethanol = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    biodiesel = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_biofuel_percentages'

class CityMetricsFuelEconomyAssumptions(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    avg_car_mpg = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    avg_ligth_truck_mpg = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    avg_heavy_duty_truck_mpg = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_fuel_economy_assumptions'

class CityMetricsVehicleCo2EmissionsFactor(models.Model):
    id = models.IntegerField(primary_key=True)
    unleaded_gasoline = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ethanol = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    diesel_fuel = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    biodiesel = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vehicle_co2_emissions_factor'

class CityMetricsCost(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField()
    year = models.CharField(max_length=4)
    energy_associated_costs = models.DecimalField(max_digits=16, decimal_places=4)
    water_associated_costs = models.DecimalField(max_digits=16, decimal_places=4)
    travel_associated_costs = models.DecimalField(max_digits=16, decimal_places=4)
    waste_associated_costs = models.DecimalField(max_digits=16, decimal_places=4)
    wn_energy_associated_costs = models.DecimalField(max_digits=16, decimal_places=4)
    energy_type_electricity = models.DecimalField(max_digits=16, decimal_places=4)
    energy_type_natural_gas = models.DecimalField(max_digits=16, decimal_places=4)
    energy_type_other = models.DecimalField(max_digits=16, decimal_places=4)
    wn_energy_type_electricity = models.DecimalField(max_digits=16, decimal_places=4)
    wn_energy_type_natural_gas = models.DecimalField(max_digits=16, decimal_places=4)
    wn_energy_type_other = models.DecimalField(max_digits=16, decimal_places=4)
    energy_use_residential = models.DecimalField(max_digits=16, decimal_places=4)
    energy_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4)
    wn_energy_use_residential = models.DecimalField(max_digits=16, decimal_places=4)
    wn_energy_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4)
    water_use_residential = models.DecimalField(max_digits=16, decimal_places=4)
    water_use_com_ind = models.DecimalField(max_digits=16, decimal_places=4)
    waste_method_recycled = models.DecimalField(max_digits=16, decimal_places=4)
    waste_method_landfilled = models.DecimalField(max_digits=16, decimal_places=4)
    waste_method_incinerated = models.DecimalField(max_digits=16, decimal_places=4)
    class Meta:
        db_table = u'city_metrics_cost'

class CityMetricsDemographicdata(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField()
    year = models.CharField(max_length=4)
    population = models.DecimalField(max_digits=16, decimal_places=4)
    jobs = models.DecimalField(max_digits=16, decimal_places=4)
    households = models.DecimalField(max_digits=16, decimal_places=4)
    class Meta:
        db_table = u'city_metrics_demographicdata'

class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)
    class Meta:
        db_table = u'django_content_type'

class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_group_permissions'

class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    content_type = models.ForeignKey(DjangoContentType)
    codename = models.CharField(max_length=100)
    class Meta:
        db_table = u'auth_permission'

class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=80)
    class Meta:
        db_table = u'auth_group'

class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField()
    is_superuser = models.BooleanField()
    username = models.CharField(max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=75)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    class Meta:
        db_table = u'auth_user'

class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)
    class Meta:
        db_table = u'auth_user_groups'

class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey(DjangoContentType, null=True, blank=True)
    user = models.ForeignKey(AuthUser)
    class Meta:
        db_table = u'django_admin_log'

class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_user_user_permissions'

class DjangoRedirect(models.Model):
    id = models.IntegerField(primary_key=True)
    site = models.ForeignKey(DjangoSite)
    old_path = models.CharField(max_length=200)
    new_path = models.CharField(max_length=200)
    class Meta:
        db_table = u'django_redirect'

class ReversionVersion(models.Model):
    id = models.IntegerField(primary_key=True)
    revision = models.ForeignKey(ReversionRevision)
    object_id = models.TextField()
    object_id_int = models.IntegerField(null=True, blank=True)
    content_type_id = models.IntegerField()
    format = models.CharField(max_length=255)
    serialized_data = models.TextField()
    object_repr = models.TextField()
    type = models.SmallIntegerField()
    class Meta:
        db_table = u'reversion_version'

class CityMetricsDistAnnVehDistTrav(models.Model):
    id = models.IntegerField(primary_key=True)
    arterials_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    arterials_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    arterials_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    local_streets_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    local_streets_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    local_streets_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_dist_ann_veh_dist_trav'

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

class CityMetricsCounty(models.Model):
    id = models.IntegerField(primary_key=True)
    county = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'city_metrics_county'

class CityMetricsNatGasInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField()
    year = models.CharField(max_length=4)
    utility_ida = models.ForeignKey(CityMetricsEnergyUtilities, db_column='utility_ida')
    residential_nat_gasa = models.DecimalField(max_digits=16, decimal_places=4)
    com_and_ind_nat_gasa = models.DecimalField(max_digits=16, decimal_places=4)
    utility_idb = models.ForeignKey(CityMetricsEnergyUtilities, null=True, db_column='utility_idb', blank=True)
    residential_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_idc = models.ForeignKey(CityMetricsEnergyUtilities, null=True, db_column='utility_idc', blank=True)
    residential_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_nat_gas_input'

class CityMetricsCddHdd(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4)
    cdd = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    hdd = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_cdd_hdd'

class CityMetricsDemographicdataCounty(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.ForeignKey(CityMetricsCounty, null=True, blank=True)
    population = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_demographicdata_county'

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

class CityMetricsWastewaterFacility(models.Model):
    id = models.IntegerField(primary_key=True)
    wastewater_facility = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'city_metrics_wastewater_facility'

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

class CityMetricsCddHddAverage(models.Model):
    cdd_average = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    hdd_average = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_cdd_hdd_average'

class CityMetricsDistFuelVehType(models.Model):
    id = models.IntegerField(primary_key=True)
    diesel_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=16, decimal_places=8, blank=True)
    diesel_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=8, blank=True)
    diesel_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=8, blank=True)
    gasoline_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=16, decimal_places=8, blank=True)
    gasoline_light_trucks = models.DecimalField(null=True, max_digits=16, decimal_places=8, blank=True)
    gasoline_passenger_cars = models.DecimalField(null=True, max_digits=16, decimal_places=8, blank=True)
    class Meta:
        db_table = u'city_metrics_dist_fuel_veh_type'

class CityMetricsVmtAuto10(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto10'

class CityMetricsVmtAuto12(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto12'

class CityMetricsVmtAuto13(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto13'

class CityMetricsVmtAuto14(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto14'

class CityMetricsVmtAuto11(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto11'

class CityMetricsVmtAuto09(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto09'

class CityMetricsVmtAuto08(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto08'

class CityMetricsVmtAuto07(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto07'

class CityMetricsVmtAuto06(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto06'

class CityMetricsVmtAuto05(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto05'

class CityMetricsVmtAuto04(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto04'

class CityMetricsVmtAuto03(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto03'

class CityMetricsVmtAuto02(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto02'

class CityMetricsVmtAuto01(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto01'

class CityMetricsVmtAuto(models.Model):
    id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    type = models.CharField(max_length=50, blank=True)
    vmt = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto'

class CityMetricsVmtAutoStep2(models.Model):
    city = models.CharField(max_length=50, blank=True)
    year = models.CharField(max_length=4, blank=True)
    county = models.CharField(max_length=50, blank=True)
    interstate_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    us_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    minnesota_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    county_state_aid_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    municipal_state_aid_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    county_road = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    municipal_streets = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_auto_step2'

class CityMetricsOtherEnergyType(models.Model):
    id = models.IntegerField(primary_key=True)
    other_fuel_name = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'city_metrics_other_energy_type'

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

class CityMetricsWaterInput(models.Model):
    id = models.IntegerField(primary_key=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    residential_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    commercial_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    industrial_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    other_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_water_input'

class CityMetricsWasteProcessingFacility(models.Model):
    id = models.IntegerField(primary_key=True)
    facility_name = models.CharField(max_length=50, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_processing_facility'

class CityMetricsCity(models.Model):
    id = models.IntegerField(primary_key=True)
    city = models.CharField(max_length=100)
    county = models.ForeignKey(CityMetricsCounty, null=True, blank=True)
    state = models.CharField(max_length=100)
    type = models.CharField(max_length=100, blank=True)
    sort_order = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'city_metrics_city'

class CityMetricsWater(models.Model):
    id = models.IntegerField(null=True, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    total_res_water = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_com_ind_water = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_water'

class CityMetricsElectricityUtility1(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    utility_id1 = models.IntegerField(null=True, blank=True)
    residential_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_id1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_electricity_utility1'

class CityMetricsWasteProcessingFacilityEmissionFactors(models.Model):
    id = models.IntegerField(primary_key=True)
    year = models.CharField(max_length=4, blank=True)
    facility = models.ForeignKey(CityMetricsWasteProcessingFacility, null=True, blank=True)
    fossil_emission_rate = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    biogenic_emission_rate = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_biogenic_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    exported_electricity = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_waste = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_processing_facility_emission_factors'

class CityMetricsWasteFacility1(models.Model):
    year = models.CharField(max_length=4, blank=True)
    county_id = models.IntegerField(null=True, blank=True)
    facility_id1 = models.IntegerField(null=True, blank=True)
    processed_facility1 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id = models.IntegerField(null=True, blank=True)
    total_biogenic_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    exported_electricity = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_waste_at_facility = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_emissions_at_facility = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_facility1'

class CityMetricsWasteFacility2(models.Model):
    year = models.CharField(max_length=4, blank=True)
    county_id = models.IntegerField(null=True, blank=True)
    facility_id2 = models.IntegerField(null=True, blank=True)
    processed_facility2 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id = models.IntegerField(null=True, blank=True)
    total_biogenic_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    exported_electricity = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_waste_at_facility = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_emissions_at_facility = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_facility2'

class CityMetricsWasteFacility3(models.Model):
    year = models.CharField(max_length=4, blank=True)
    county_id = models.IntegerField(null=True, blank=True)
    facility_id3 = models.IntegerField(null=True, blank=True)
    processed_facility3 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id = models.IntegerField(null=True, blank=True)
    total_biogenic_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    exported_electricity = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_waste_at_facility = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_emissions_at_facility = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_facility3'

class CityMetricsWasteFacility4(models.Model):
    year = models.CharField(max_length=4, blank=True)
    county_id = models.IntegerField(null=True, blank=True)
    facility_id4 = models.IntegerField(null=True, blank=True)
    processed_facility4 = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    facility_id = models.IntegerField(null=True, blank=True)
    total_biogenic_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_fossil_emissions = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    exported_electricity = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_waste_at_facility = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    total_emissions_at_facility = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emission_rate = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    fossil_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    biogenic_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_facility4'

class CityMetricsWasteJoined(models.Model):
    year = models.CharField(max_length=4, blank=True)
    county_id = models.IntegerField(null=True, blank=True)
    recycled = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    land_dispossed = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    land_dispossed_without_ch4_recovery = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    methane_recovery_factor = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    processed_all_facilities = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_fossil_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_biogenic_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_joined'

class CityMetricsElectricityUtility2(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    utility_id2 = models.IntegerField(null=True, blank=True)
    residential_electricity2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_electricity2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_wind_electricity2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_wind_electricity2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_id2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_electricity_utility2'

class CityMetricsVmtRoadwayInput(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city = models.CharField(max_length=100, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    interstate_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    us_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    minnesota_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    county_state_aid_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    municipal_state_aid_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    county_road = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    municipal_streets = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_vmt_roadway_input'

class CityMetricsElectricityUtility3(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    utility_id3 = models.IntegerField(null=True, blank=True)
    residential_electricity3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_electricity3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_wind_electricity3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_wind_electricity3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_id3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_electricity_utility3'

class CityMetricsElectricityJoined(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    ef_utility_id1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utility1 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_id2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_electricity2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_electricity2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utility2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_id3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_electricity3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    com_and_ind_electricity3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utility3 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_electricity_joined'

class CityMetricsWasteCity(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    county_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    total_fossil_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_biogenic_emissions_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    recycled = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    land_dispossed = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    processed_all_facilities = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    methane_recovery_factor = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_waste_county = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    per_capita_msw = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    population_county = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    estimated_msw_processed = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    estimated_msw_recycled = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    estimated_msw_land_dispossed = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    estimated_emissions_processed = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    estimated_emissions_land_dispossed = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_msw = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste_city'

class CityMetricsWaste(models.Model):
    id = models.IntegerField(null=True, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    recycled = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    landfilled = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    incinerated = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_waste'

class CityMetricsNatGasUtilitya(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=100, blank=True)
    type = models.CharField(max_length=100, blank=True)
    population = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    jobs = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    households = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_ida = models.IntegerField(null=True, blank=True)
    residential_nat_gasa = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasa = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ef_utility_ida = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_nat_gas_utilitya'

class CityMetricsNatGasUtilityb(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=100, blank=True)
    type = models.CharField(max_length=100, blank=True)
    population = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    jobs = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    households = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_idb = models.IntegerField(null=True, blank=True)
    residential_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ef_utility_idb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_nat_gas_utilityb'

class CityMetricsNatGasUtilityc(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    city = models.CharField(max_length=100, blank=True)
    state = models.CharField(max_length=100, blank=True)
    type = models.CharField(max_length=100, blank=True)
    population = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    jobs = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    households = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    utility_idc = models.IntegerField(null=True, blank=True)
    residential_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    ef_utility_idc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_nat_gas_utilityc'

class CityMetricsNatGasJoined(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    ef_utility_ida = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_nat_gasa = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasa = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    emissions_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utilitya = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_idb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasb = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    emissions_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utilityb = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ef_utility_idc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    residential_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    com_and_ind_nat_gasc = models.DecimalField(null=True, max_digits=16, decimal_places=4, blank=True)
    emissions_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_residential_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    emissions_com_and_ind_utilityc = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_nat_gas_joined'

class CityMetricsEnergyIntermediary1(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    total_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_wind_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_energy_intermediary1'

class CityMetricsEnergyWnIntermediary1(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    wn_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_energy_wn_intermediary1'

class CityMetricsEnergyWnIntermediary2(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    wn_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_emissions_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_residential_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_and_ind_emissions_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_electricity_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_nat_gas_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_residential_electricity_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_com_and_ind_electricity_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_residential_nat_gas_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_com_and_ind_nat_gas_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_energy_wn_intermediary2'

class CityMetricsEnergyWnIntermediary3(models.Model):
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    wn_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_nat_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_wind_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_energy_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_residential_nat_gas_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_and_ind_electricity_mmbtu = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_electricity_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_nat_gas_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_residential_electricity_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_com_and_ind_electricity_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_residential_nat_gas_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_com_and_ind_nat_gas_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    energy_associated_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_energy_wn_intermediary3'

class CityMetricsTravelIntermediary1(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    interstate_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    us_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    minnesota_trunk_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    county_state_aid_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    municipal_state_aid_highway = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    county_road = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    municipal_streets = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_vmt = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    arterials = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    local_streets = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel_intermediary1'

class CityMetricsTravelIntermediary2(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    gasoline_passenger_car = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gasoline_light_truck = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gasoline_vmt = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    diesel_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    diesel_passenger_car = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    diesel_light_truck = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_diesel_vmt = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel_intermediary2'

class CityMetricsTravelIntermediary3(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    gallons_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel_heavy_duty_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel_light_truck = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_gasoline = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_ethanol = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_biodiesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_gasoline = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_diesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel_intermediary3'

class CityMetricsTravelIntermediary4(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    gallons_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel_heavy_duty_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel_light_truck = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_gasoline = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    gallons_diesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_ethanol = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_biodiesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_gasoline = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gallons_diesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_gasoline_passenger_car = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gasoline_co2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_diesel_passenger_car = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_diesel_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_diesel_heavy_duty_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_diesel_co2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel_intermediary4'

class CityMetricsTravelIntermediary5(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    co2_emission_gasoline_passenger_car = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gasoline_co2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_diesel_passenger_car = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_diesel_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2_emission_diesel_heavy_duty_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_diesel_co2 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ch4_emissions_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ch4_emissions_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ch4_emissions_diesel_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ch4_emissions_diesel_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    ch4_emissions_diesel_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    n2o_emissions_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    n2o_emissions_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    n2o_emissions_diesel_heavy_duty_vehicles = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    n2o_emissions_diesel_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    n2o_emissions_diesel_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gasoline_ch4 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_diesel_ch4 = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_gasoline_n2o = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_diesel_n2o = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel_intermediary5'

class CityMetricsTravelIntermediary6(models.Model):
    year = models.CharField(max_length=4, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    co2e_emissions_gasoline_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2e_emissions_gasoline_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2e_emissions_diesel_passenger_cars = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2e_emissions_diesel_light_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    co2e_emissions_diesel_heavy_duty_trucks = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_co2e_gasoline = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_co2e_diesel = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_fossil_co2e = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_fossil_co2e_per_million_vmt = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel_intermediary6'

class CityMetricsEnergy(models.Model):
    id = models.IntegerField(null=True, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    natural_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    other = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_electricity = models.IntegerField(null=True, blank=True)
    wn_natural_gas = models.IntegerField(null=True, blank=True)
    wn_other = models.IntegerField(null=True, blank=True)
    total_res_energy = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    total_com_ind_energy = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_res_energy = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_total_com_ind_energy = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_energy'

class CityMetricsTravel(models.Model):
    id = models.BigIntegerField(null=True, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    total_vmt = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_travel'

class CityMetricsEmissions(models.Model):
    id = models.IntegerField(null=True, blank=True)
    city_id = models.IntegerField(null=True, blank=True)
    year = models.CharField(max_length=4, blank=True)
    energy_associated_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    water_associated_emissions = models.IntegerField(null=True, blank=True)
    travel_associated_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    waste_associated_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_energy_associated_emissions = models.IntegerField(null=True, blank=True)
    wn_water_associated_emissions = models.IntegerField(null=True, blank=True)
    wn_travel_associated_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_waste_associated_emissions = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    energy_type_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_energy_type_electricity = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    energy_type_natural_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_energy_type_natural_gas = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    energy_type_other = models.IntegerField(null=True, blank=True)
    wn_energy_type_other = models.IntegerField(null=True, blank=True)
    energy_use_residential = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_energy_use_residential = models.IntegerField(null=True, blank=True)
    energy_use_com_ind = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    wn_energy_use_com_ind = models.IntegerField(null=True, blank=True)
    waste_method_recycled = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    waste_method_landfilled = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    waste_method_incinerated = models.DecimalField(null=True, max_digits=65535, decimal_places=65535, blank=True)
    class Meta:
        db_table = u'city_metrics_emissions'

