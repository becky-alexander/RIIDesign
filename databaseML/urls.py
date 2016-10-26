from django.conf.urls import url
from . import views



urlpatterns = [
    url(r'database/', views.database, name='database'),
    url(r'^contact/', views.contact, name='contact'),
    url(r'^new_city/', views.new_city, name = 'new_city'),
    url(r'^view_data/', views.view_data, name = 'view_data'),
    url(r'^query_data/', views.query_data, name = 'query_data'),
    url(r'^new_city2/', views.MainView, name = 'MainView'),
    url(r'^waterform/', views.wform_add, name = 'wform_add'),
    url(r'^electricityform/', views.electricityform_add, name = 'electricityform_add'),
    url(r'^natgasform/', views.natgasform_add, name = 'natgasform_add'),
    url(r'^solidwasteform/', views.solidwasteform_add, name = 'solidwasteform_add'),
    url(r'^wastewaterform/', views.wastewaterform_add, name = 'wastewaterform_add'),
    url(r'^otherfuelform/', views.otherenergyform_add, name = 'otherenergyform_add'),    
    url(r'^new_city3/', views.electricityform_add, name = 'electricityform_add'),
]
