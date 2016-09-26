from django.shortcuts import render
from django.http import HttpResponse
from city_metrics.models import City, Energy, Water, Travel, Waste, Emissions, Cost
from utility import setDetailContext
from django.http import HttpResponseRedirect
from django.core.context_processors import csrf
from databaseML.forms import CityForm, EnergyForm

def database(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/home.html', {
                'citys': citys, 
        })

def city_detail(request, id):
	return HttpResponse('<p>In city_detail view with id {0}</p>'.format(id))






def new_city(request):
	return render(request, 'database_manager/new_city.html')

def new_city2(request):
        form = CityForm(request.POST)
        context = {
              "form": form,   
        }
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/new_city3/')
	return render(request, 'database_manager/new_city2.html', context)

def new_city3(request):
        lform = EnergyForm(request.POST)
        context = {
              "lform": lform,   
        }
        
        if lform.is_valid():
            lform.save()
            return HttpResponseRedirect('database_manager/contact/')
	return render(request, 'database_manager/new_city3.html', context)




def contact(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/basic.html', {
                'citys': citys,
                })

def view_data(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/view_data.html', {
                'citys': citys,
                })
def query_data(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/query_data.html', {
                'citys': citys,
                })
