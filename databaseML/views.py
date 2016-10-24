from django.shortcuts import render
from django.http import HttpResponse
from city_metrics.models import City, Energy, Water, Travel, Waste, Emissions, Cost, CityMetricsWaterInput, CityMetricsEnergyUtilities, CityMetricsCounty, CityMetricsElectricInput, CityMetricsNatGasInput, CityMetricsEnergyUtilitiesEmissionFactors, CityMetricsWasteProcessingFacility, CityMetricsSolidWasteInput, CityMetricsOtherEnergyInput, CityMetricsWastewaterInput 
from utility import setDetailContext
from django.http import HttpResponseRedirect
from django.core.context_processors import csrf
from django.contrib.auth.decorators import login_required
from databaseML.forms import CityForm, EnergyForm, CityMetricsWaterInputForm, CityMetricsEnergyUtilitiesForm, CityMetricsCountyForm, CityMetricsElectricInputForm, CityMetricsNatGasInputForm, CityMetricsEnergyUtilitiesEmissionFactorsForm, CityMetricsWasteProcessingFacilityForm, CityMetricsSolidWasteInputForm, CityMetricsOtherEnergyInputForm, CityMetricsWastewaterInputForm 


def database(request):
        citys = City.objects.exclude
	return render(request, 'database_manager/home.html', {
                'citys': citys,
        })

def city_detail(request, id):
	return HttpResponse('<p>In city_detail view with id {0}</p>'.format(id))






def new_city(request):
	return render(request, 'database_manager/new_city.html')


def MainView(self, request, *args, **kwargs):
        electricityform = CityMetricsElectricInputForm(self.request.GET or None)
        wform = CityMetricsWaterInputForm(request.POST)
        context = self.get_context_data(**kwargs)
        context['electricityform'] = electricityform
        context['wform'] = wform
        return self.render_to_response(context)


		
@login_required
def electricityform_add(request):        
	electricityform = CityMetricsElectricInputForm(request.POST)
	context = {
	    "electricityform" : electricityform,}
	if electricityform.is_valid():
            electricityform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)

@login_required
def wform_add(request):
	wform = CityMetricsWaterInputForm(request.POST)
	context = {
	    "wform": wform,}
	if wform.is_valid():
            wform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)	

	
		
@login_required		
def natgasform_add(request):	
        natgasform = CityMetricsNatGasInputForm(request.POST)
	context = {
	    "natgasform" : natgasform,}
	if natgasform.is_valid():
            natgasform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)

@login_required	
def wastefacilityform_add(request):	
	wastefacilityform = CityMetricsWasteProcessingFacilityForm(request.POST)
	context = {
	    "wastefacilityform" : wastefacilityform,}
	if wastefacilityform.is_valid():
            wastefacilityform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)

@login_required	
def solidwasteform_add(request):	
        solidwasteform = CityMetricsSolidWasteInputForm(request.POST)
	context = {
	    "solidwasteform" : solidwasteform,}
	if solidwasteform.is_valid():
            solidwasteform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)	      

@login_required	
def wastewaterform_add(request):	
	wastewaterform = CityMetricsWastewaterInputForm(request.POST)
	context = {
	    "wastewaterform" : wastewaterform,}
	if wastewaterform.is_valid():
            wastewaterform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)		      

@login_required		      
def otherenergyform_add(request):	
	otherenergyform = CityMetricsOtherEnergyInputForm(request.POST)
	context = {
	    "otherenergyform" : otherenergyform,}
	if otherenergyform.is_valid():
            otherenergyform.save()
            return HttpResponseRedirect('/new_city3/')	
	return render(request, 'database_manager/new_city2.html', context)

#  




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

#comment
