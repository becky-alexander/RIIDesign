from django import forms
from city_metrics.models import City, Energy


#class CityMetricsCityForm(forms.ModelForm):
#    city = forms.CharField(max_length=100)
#    state = forms.CharField(max_length=100)
#    type = forms.CharField(max_length=100)





class CityForm(forms.ModelForm):
    class Meta:
        model = City
        fields = ["city", "state", "type", "sort_order"]

class EnergyForm(forms.ModelForm):
    class Meta:
        model = Energy
        fields = ["city", "id", "year", "electricity","natural_gas", "other"]
