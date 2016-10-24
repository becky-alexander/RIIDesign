from django import forms
from city_metrics.models import  City, Energy, CityMetricsWaterInput, CityMetricsEnergyUtilities, CityMetricsCounty, CityMetricsElectricInput, CityMetricsNatGasInput, CityMetricsEnergyUtilitiesEmissionFactors, CityMetricsWasteProcessingFacility, CityMetricsSolidWasteInput, CityMetricsOtherEnergyInput, CityMetricsWastewaterInput
from django.utils.translation import ugettext as _

#class CityMetricsCityForm(forms.ModelForm):
#    city = forms.CharField(max_length=100)
#    state = forms.CharField(max_length=100)
#    type = forms.CharField(max_length=100)




class CityForm(forms.ModelForm):
    class Meta:
        model = City
        fields = ["city", "county_id", "state", "type", "sort_order"]

class EnergyForm(forms.ModelForm):
    class Meta:
        model = Energy
        fields = ["city", "id", "year", "electricity","natural_gas", "other"]

class CityMetricsWaterInputForm(forms.ModelForm):
    class Meta:
        model = CityMetricsWaterInput
        fields = ["city_id", "year", "residential_water", "commercial_water", "industrial_water", "other_water"]
        labels = {
            "city_id": _('City'),
        }

class CityMetricsEnergyUtilitiesForm(forms.ModelForm):
    class Meta:
        model = CityMetricsEnergyUtilities
        fields = ["id", "name"]


class CityMetricsCountyForm(forms.ModelForm):
    class Meta:
        model = CityMetricsCounty
        fields = ["id", "county"]

class CityMetricsElectricInputForm(forms.ModelForm):
    class Meta:
        model = CityMetricsElectricInput
        fields = ["city_id", "year", "utility_id1", "residential_electricity",
        "com_and_ind_electricity", "residential_wind_electricity", "com_and_ind_wind_electricity", "utility_id2",
        "residential_electricity2", "com_and_ind_electricity2", "residential_wind_electricity2", "com_and_ind_wind_electricity2",
        "utility_id3", "residential_electricity3",
        "com_and_ind_electricity3", "residential_wind_electricity3", "com_and_ind_wind_electricity3"]

class CityMetricsNatGasInputForm(forms.ModelForm):
    class Meta:
        model = CityMetricsNatGasInput
        fields = ["city_id", "year", "utility_ida", "residential_nat_gasa", "com_and_ind_nat_gasa",
        "utility_idb", "residential_nat_gasb", "com_and_ind_nat_gasb", "utility_idc", "residential_nat_gasc",
        "com_and_ind_nat_gasc"]

class CityMetricsEnergyUtilitiesEmissionFactorsForm(forms.ModelForm):
    class Meta:
        model = CityMetricsEnergyUtilitiesEmissionFactors
        fields = ["year", "utility", "type", "co2_ef", "n2o_ef", "ch4_ef"]

class CityMetricsWasteProcessingFacilityForm(forms.ModelForm):
    class Meta:
        model = CityMetricsWasteProcessingFacility
        fields = ["id", "facility_name"]

class CityMetricsSolidWasteInputForm(forms.ModelForm):
    class Meta:
        model = CityMetricsSolidWasteInput
        fields = ["id", "year", "county_id", "recycled", "land_dispossed",
                  "land_dispossed_without_ch4_recovery", "facility_id1",
                 "processed_facility1", "facility_id2", "processed_facility2",
                 "facility_id3", "processed_facility3"]

class CityMetricsWastewaterInputForm(forms.ModelForm):
    class Meta:
        model = CityMetricsWastewaterInput
        fields = ["id", "city_id", "year", "wastewater_facility1_id", "wastewater_treated_facility1",
                  "wastewater_facility2_id", "wastewater_treated_facility2",
                 "wastewater_facility3_id", "wastewater_treated_facility3"]

class CityMetricsOtherEnergyInputForm(forms.ModelForm):
    class Meta:
        model = CityMetricsOtherEnergyInput
        fields = ["id", "city_id", "year",  "other_fuel_type1", "other_fuel_amount1_residential",
                  "other_fuel_amount1_com_and_ind", "other_fuel_type2", "other_fuel_amount2_residential",
                  "other_fuel_amount2_com_and_ind","other_fuel_type3", "other_fuel_amount3_residential",
                  "other_fuel_amount3_com_and_ind","other_fuel_type4", "other_fuel_amount4_residential",
                  "other_fuel_amount4_com_and_ind","other_fuel_type5", "other_fuel_amount5_residential",
                  "other_fuel_amount5_com_and_ind"]
        
  
