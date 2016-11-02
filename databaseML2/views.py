# Create your views here.
from django.views import generic
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from city_metrics.models import *

class IndexView(generic.ListView):
    template_name = 'databaseML2/index.html'
    context_object_name = 'all_objects'
    def get_queryset(self):
        return CityMetricsWaterInput.objects.all()

class DetailView(generic.DetailView):
    model = CityMetricsWaterInput
    template_name = 'databaseML2/index.html'

class AlbumCreate(CreateView):
    model = CityMetricsWaterInput
    fields = ["city_id", "year", "residential_water", "commercial_water", "industrial_water", "other_water"]

class AlbumUpdate(UpdateView):
    model = CityMetricsWaterInput
    fields = ["city_id", "year", "residential_water", "commercial_water", "industrial_water", "other_water"]

class AlbumDelete(DeleteView):
    model = CityMetricsWaterInput
    sucess_url = reverse_lazy('databaseML2:index')
