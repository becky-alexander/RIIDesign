from django.shortcuts import render
from django.http import HttpResponse
from city_metrics.models import CityMetricsWastewaterInput, City, Energy, Water, Travel, Waste, Emissions, Cost, CityMetricsWaterInput, CityMetricsEnergyUtilities, CityMetricsCounty, CityMetricsElectricInput, CityMetricsNatGasInput, CityMetricsEnergyUtilitiesEmissionFactors, CityMetricsWasteProcessingFacility, CityMetricsSolidWasteInput
from utility import setDetailContext
from django.http import HttpResponseRedirect
from django.core.context_processors import csrf
from django.contrib.auth.decorators import login_required
from databaseML.forms import CityMetricsWastewaterInputForm, CityForm, EnergyForm, CityMetricsWaterInputForm, CityMetricsEnergyUtilitiesForm, CityMetricsCountyForm, CityMetricsElectricInputForm, CityMetricsNatGasInputForm, CityMetricsEnergyUtilitiesEmissionFactorsForm, CityMetricsWasteProcessingFacilityForm, CityMetricsSolidWasteInputForm


def database(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/home.html', {
                'citys': citys,
        })

def city_detail(request, id):
	return HttpResponse('<p>In city_detail view with id {0}</p>'.format(id))






def new_city(request):
	return render(request, 'database_manager/new_city.html')


@login_required
def new_city2(request):
    	form = CityForm(request.POST)
    	wform = CityMetricsWaterInputForm(request.POST)
    	utilitiesform = CityMetricsEnergyUtilitiesForm(request.POST)
        countyform = CityMetricsCountyForm(request.POST)
        electricityform = CityMetricsElectricInputForm(request.POST)
        natgasform = CityMetricsNatGasInputForm(request.POST)
        energyutilitiesEFform = CityMetricsEnergyUtilitiesForm(request.POST)
	wastefacilityform = CityMetricsWasteProcessingFacilityForm(request.POST)
        solidwasteform = CityMetricsSolidWasteInputForm(request.POST)
	wastewaterform = CityMetricsWastewaterInputForm(request.POST)
	context = {
          	"form": form,
	  	"wform": wform,
          	"utilitiesform": utilitiesform,
	  	"countyform": countyform,
            	"electricityform" : electricityform,
            	"natgasform" : natgasform,
            	"energyutilitiesEFform" : energyutilitiesEFform,
		"wastefacilityform" : wastefacilityform,
		"solidwasteform" : solidwasteform,
		"wastewaterform" : wastewaterform,
        }

        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/new_city3/')

        if wform.is_valid():
            wform.save()
            return HttpResponseRedirect('/new_city3/')

        if utilitiesform.is_valid():
            utilitiesform.save()
            return HttpResponseRedirect('/new_city3/')

        if countyform.is_valid():
            countyform.save()
            return HttpResponseRedirect('/new_city3/')

        if electricityform.is_valid():
            electricityform.save()
            return HttpResponseRedirect('/new_city3/')

        if natgasform.is_valid():
            natgasform.save()
            return HttpResponseRedirect('/new_city3/')

        if energyutilitiesEFform.is_valid():
            energyutilitiesEFform.save()
            return HttpResponseRedirect('/new_city3/')

        if wastefacilityform.is_valid():
            wastefacilityform.save()
            return HttpResponseRedirect('/new_city3/')

        if solidwasteform.is_valid():
            solidwasteform.save()
            return HttpResponseRedirect('/new_city3/')

	if wastewaterform.is_valid():
            wastewaterform.save()
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
                }

#comment
