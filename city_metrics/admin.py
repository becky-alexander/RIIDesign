from django.contrib import admin
from models import *


class CityAdmin(admin.ModelAdmin):
	list_display = ('city', 'state', 'type', 'sort_order',)
	list_filter = ('city', 'state', 'type', 'sort_order',)


class DemographicDataAdmin(admin.ModelAdmin):
	list_display = ('city', 'population', 'jobs', 'households', 'year',)
	list_filter = ('city', 'year',)


class EnergyAdmin(admin.ModelAdmin):
	list_display = ('city', 'year',)
	list_filter = ('city', 'year',)

	fieldsets = (
		('General Info', {
			'fields': ('city', 'year')
		}),
		('By Type', {
			'fields': ('electricity', 'natural_gas', 'other')
		}),
		('WN By Type (WN = Weather Normalized)', {
			'fields': ('wn_electricity', 'wn_natural_gas', 'wn_other')
		}),
		('Totals By Use', {
			'fields': ('total_res_energy', 'total_com_ind_energy',)
		}),
		('WN Totals By Use', {
			'fields': ('wn_total_res_energy', 'wn_total_com_ind_energy',)
		}),
	)


class WaterAdmin(admin.ModelAdmin):
	list_display = ('city', 'year',)
	list_filter = ('city', 'year',)

	fieldsets = (
		('General Info', {
			'fields': ('city', 'year')
		}),
		('Totals By Use', {
			'fields': ('total_res_water', 'total_com_ind_water',)
		}),
	)


class TravelAdmin(admin.ModelAdmin):
	list_display = ('city', 'year',)
	list_filter = ('city', 'year',)

	fieldsets = (
		('General Info', {
			'fields': ('city', 'year')
		}),
		('Totals By Use', {
			'fields': ('total_vmt',)
		}),
	)


#class WasteAdmin(admin.ModelAdmin):
#	list_display = ('city', 'year',)
#	list_filter = ('city', 'year',)
#
#	fieldsets = (
#		('General Info', {
#			'fields': ('city', 'year')
#		}),
#		('Totals By Use', {
#			'fields': ('recycled', 'landfilled', 'incinerated')
#		}),
#	)


#class EmissionsAdmin(admin.ModelAdmin):
#	list_display = ('city', 'year',)
#	list_filter = ('city', 'year',)
#
#	fieldsets = (
#		('General Info', {
#			'fields': ('city', 'year')
#		}),
#		('Totals', {
#			'fields': ('energy_associated_emissions', 'water_associated_emissions', 'travel_associated_emissions', 'waste_associated_emissions')
#		}),
#		('WN Totals', {
#			'fields': ('wn_energy_associated_emissions', 'wn_water_associated_emissions', 'wn_travel_associated_emissions', 'wn_waste_associated_emissions')
#		}),
#		('Energy Numbers', {
#			'fields': ('energy_type_electricity', 'energy_type_natural_gas', 'energy_type_other', 'energy_use_residential', 'energy_use_com_ind',
#			'wn_energy_type_electricity', 'wn_energy_type_natural_gas', 'wn_energy_type_other', 'wn_energy_use_residential', 'wn_energy_use_com_ind')
#		}),
#		('Waste Numbers', {
#			'fields': ('waste_method_recycled', 'waste_method_landfilled', 'waste_method_incinerated')
#		})
#	)


class CostAdmin(admin.ModelAdmin):
	list_display = ('city', 'year',)
	list_filter = ('city', 'year',)

	fieldsets = (
		('General Info', {
			'fields': ('city', 'year')
		}),
		('Totals By Source', {
			'fields': ('water_associated_costs', 'travel_associated_costs', 'waste_associated_costs')
		}),
		('Energy Numbers', {
			'fields': ('energy_associated_costs', 'energy_type_electricity', 'energy_type_natural_gas', 'energy_type_other',
			'energy_use_residential', 'energy_use_com_ind')
		}),
		('WN Energy Numbers', {
			'fields': ('wn_energy_associated_costs', 'wn_energy_type_electricity', 'wn_energy_type_natural_gas', 'wn_energy_type_other',
			'wn_energy_use_residential', 'wn_energy_use_com_ind')
		}),
		('Water Numbers', {
			'fields': ('water_use_residential', 'water_use_com_ind')
		}),
		('Waste Numbers', {
			'fields': ('waste_method_recycled', 'waste_method_landfilled', 'waste_method_incinerated')
		})
	)

class SpecialTrendLineAdmin(admin.ModelAdmin):
	list_display = ('type', 'year',)
	list_filter = ('type', 'year',)


class CityMetricsWaterInputAdmin(admin.ModelAdmin):
	list_display = ('city_id', 'year',)
	list_filter = ('city_id', 'year',)
	fieldsets = (
		('General Info', {
			'fields': ('city_id', 'year')
		}),
		('Totals By Source', {
			'fields': ('residential_water', 'commercial_water', 'other_water')
		})
	)

class CityMetricsElectricInputAdmin(admin.ModelAdmin):
	list_display = ('city_id', 'year',)
	list_filter = ('city_id', 'year',)
	fieldsets = (
		('General Info', {
			'fields': ('city_id', 'year')
		}),
		('Totals By Source Utility 1', {
			'fields': ('utility_id1', 'residential_electricity', 'com_and_ind_electricity', 'residential_wind_electricity', 'com_and_ind_wind_electricity')
		}),
		('Totals By Source Utility 2', {
			'fields': ('utility_id2', 'residential_electricity2', 'com_and_ind_electricity2', 'residential_wind_electricity2', 'com_and_ind_wind_electricity2')
		}),
		('Totals By Source Utility 3', {
			'fields': ('utility_id3', 'residential_electricity3', 'com_and_ind_electricity3', 'residential_wind_electricity3', 'com_and_ind_wind_electricity3')
		})
	)

class CityMetricsNatGasInputAdmin(admin.ModelAdmin):
	list_display = ('city_id', 'year',)
	list_filter = ('city_id', 'year',)
	fieldsets = (
		('General Info', {
			'fields': ('city_id', 'year')
		}),
		('Totals By Source Utility A', {
			'fields': ('utility_ida', 'residential_nat_gasa', 'com_and_ind_nat_gasa')
		}),
		('Totals By Source Utility B', {
			'fields': ('utility_idb', 'residential_nat_gasb', 'com_and_ind_nat_gasb')
		}),
		('Totals By Source Utility C', {
			'fields': ('utility_idc', 'residential_nat_gasc', 'com_and_ind_nat_gasc')
		})
	)

class CityMetricsSolidWasteInputAdmin(admin.ModelAdmin):
	list_display = ('county_id', 'year',)
	list_filter = ('county_id', 'year',)
	fieldsets = (
		('General Info', {
			'fields': ('county_id', 'year')
		}),
		('Recycled & Land Dissposed', {
			'fields': ('recycled', 'land_dispossed', 'land_dispossed_without_ch4_recovery')
		}),
		('Total Processed at Facility 1', {
			'fields': ('facility_id1', 'processed_facility1')
		}),
		('Total Processed at Facility 2', {
			'fields': ('facility_id2', 'processed_facility2'),
		}),
		('Total Processed at Facility 3', {
			'fields': ('facility_id3', 'processed_facility3'),
		})
	)

class CityMetricsOtherEnergyInputAdmin(admin.ModelAdmin):
	list_display = ('city_id', 'year',)
	list_filter = ('city_id', 'year',)
	fieldsets = (
		('General Info', {
			'fields': ('city_id', 'year')
		}),
		('Fuel Type 1', {
			'fields': ('other_fuel_type1', 'other_fuel_amount1_residential', 'other_fuel_amount1_com_and_ind')
		}),
		('Fuel Type 2', {
			'fields': ('other_fuel_type2', 'other_fuel_amount2_residential', 'other_fuel_amount2_com_and_ind')
		}),
		('Fuel Type 3', {
			'fields': ('other_fuel_type3', 'other_fuel_amount3_residential', 'other_fuel_amount3_com_and_ind')
		}),
		('Fuel Type 4', {
			'fields': ('other_fuel_type4', 'other_fuel_amount4_residential', 'other_fuel_amount4_com_and_ind')
		}),
		('Fuel Type 5', {
			'fields': ('other_fuel_type5', 'other_fuel_amount5_residential', 'other_fuel_amount5_com_and_ind')
		})
	)

class CityMetricsEnergyUtilitiesAdmin(admin.ModelAdmin):
	list_display = ('name',)
	fields = ('name',)
	
admin.site.register(City, CityAdmin)
#admin.site.register(DemographicData, DemographicDataAdmin)
#admin.site.register(Energy, EnergyAdmin)
#admin.site.register(Water, WaterAdmin)
#admin.site.register(Travel, TravelAdmin)
#admin.site.register(Waste, WasteAdmin)
#admin.site.register(Emissions, EmissionsAdmin)
#admin.site.register(Cost, CostAdmin)
#admin.site.register(SpecialTrendLine, SpecialTrendLineAdmin)
admin.site.register(CityMetricsWaterInput, CityMetricsWaterInputAdmin)
admin.site.register(CityMetricsElectricInput, CityMetricsElectricInputAdmin)
admin.site.register(CityMetricsNatGasInput, CityMetricsNatGasInputAdmin)
admin.site.register(CityMetricsSolidWasteInput, CityMetricsSolidWasteInputAdmin)
admin.site.register(CityMetricsOtherEnergyInput, CityMetricsOtherEnergyInputAdmin)
admin.site.register(CityMetricsEnergyUtilities, CityMetricsEnergyUtilitiesAdmin)
