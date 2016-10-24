from django.conf.urls import url
from . import views



urlpatterns = [
    url(r'database/', views.database, name='database'),
    url(r'^contact/', views.contact, name='contact'),
    url(r'^new_city/', views.new_city, name = 'new_city'),
    url(r'^view_data/', views.view_data, name = 'view_data'),
    url(r'^query_data/', views.query_data, name = 'query_data'),
    url(r'^new_city2/', views.new_city2, name = 'wform_add'),
    url(r'^new_city2/', views.new_city3, name = 'electricityform_add'),
    url(r'^new_city2/', views.new_city2, name = 'natgasform_add'),
    url(r'^new_city2/', views.new_city2, name = 'wastefacilityform_add'),
    url(r'^new_city2/', views.new_city3, name = 'wastefacilityform_add'),
    url(r'^new_city2/', views.new_city2, name = 'otherenergyform_add'),    
    url(r'^new_city3/', views.new_city3, name = 'new_city3'),
]
