# Create your views here.
from django.views import generic
from django.http import HttpResponse
from django.views.generic import TemplateView,ListView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from city_metrics.models import *
from django.shortcuts import render, get_object_or_404


def database2(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/home.html', {
                'citys': citys,
        })

#Water
class IndexView(generic.ListView):
    template_name = 'databaseML2/water_index.html'
    def get_queryset(self):
        return CityMetricsWaterInput.objects.all()

class DetailView(generic.DetailView):
    model = CityMetricsWaterInput
    template_name = 'databaseML2/water_detail.html'

class WaterInputCreate(CreateView):
    model = CityMetricsWaterInput
    fields = ["city_id", "year", "residential_water", "commercial_water", "industrial_water", "other_water"]
    sucess_url = reverse_lazy('databaseML2:index')

class WaterInputUpdate(UpdateView):
    model = CityMetricsWaterInput
    fields = ["city_id", "year", "residential_water", "commercial_water", "industrial_water", "other_water"]

class WaterInputDelete(DeleteView):
    model = CityMetricsWaterInput
    sucess_url = reverse_lazy('databaseML2:index')


#Electric

class ElectricInputIndexView(generic.ListView):
    model = CityMetricsElectricInput
    template_name = 'databaseML2/electric_index.html'
    def get_queryset(self):
        return CityMetricsElectricInput.objects.all()


class ElectricInputDetailView(generic.DetailView):
    model = CityMetricsElectricInput
    template_name = 'databaseML2/electric_detail.html'

class ElectricInputCreate(CreateView):
    model = CityMetricsElectricInput
    fields = ["city_id", "year"]
    sucess_url = reverse_lazy('databaseML2:electric-index')
    def get_absolute_url(self):
            return u'/electricinput/%d/' % self.id

class ElectricInputUpdate(UpdateView):
    model = CityMetricsElectricInput
    fields = ["city_id", "year"]

class ElectricInputDelete(DeleteView):
    model = CityMetricsElectricInput
    sucess_url = reverse_lazy('databaseML2:electric_index')


#Natural Gas

class NatGasInputIndexView(generic.ListView):
    template_name = 'databaseML2/nat_gas_index.html'
    def get_queryset(self):
        return CityMetricsNatGasInput.objects.all()

class NatGasInputDetailView(generic.DetailView):
    model = CityMetricsNatGasInput
    template_name = 'databaseML2/nat_gas_detail.html'

class NatGasInputCreate(CreateView):
    model = CityMetricsNatGasInput
    fields = ["city_id", "year"]

class NatGasInputUpdate(UpdateView):
    model = CityMetricsNatGasInput
    fields = ["city_id", "year"]

class NatGasInputDelete(DeleteView):
    model = CityMetricsNatGasInput
    sucess_url = reverse_lazy('databaseML2:nat_gas_index')

#Solid Waste

class SolidWasteInputIndexView(generic.ListView):
    template_name = 'databaseML2/solid_waste_index.html'
    def get_queryset(self):
        return CityMetricsSolidWasteInput.objects.all()

class SolidWasteInputDetailView(generic.DetailView):
    model = CityMetricsSolidWasteInput
    template_name = 'databaseML2/solid_waste_detail.html'

class SolidWasteInputCreate(CreateView):
    model = CityMetricsSolidWasteInput
    fields = ["city_id", "year"]

class SolidWasteInputUpdate(UpdateView):
    model = CityMetricsSolidWasteInput
    fields = ["city_id", "year"]

class SolidWasteInputDelete(DeleteView):
    model = CityMetricsSolidWasteInput
    sucess_url = reverse_lazy('databaseML2:solid_waste_index')
