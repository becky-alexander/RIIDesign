from django.conf.urls  import url
from . import views

app_name = "databaseML2"

urlpatterns = [

    url(r'database2/', views.database2, name='database2'),
#Water
    url(r'waterinput/$', views.IndexView.as_view(), name='index'),
    url(r'^waterinput/(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='water_input-detail'),
    #/databaseML2/waterinput/add/
    url(r'waterinput/add/$', views.WaterInputCreate.as_view(), name='water_input-add'),
    #/databaseML2/waterinput/update/2/
    url(r'waterinput/update/(?P<pk>[0-9]+)/$', views.WaterInputUpdate.as_view(), name='water_input-update'),
    #/databaseML2/waterinput/delete/
    url(r'waterinput/delete/$', views.WaterInputDelete.as_view(), name='water_input-delete'),

#Electric
    url(r'electricinput/$', views.ElectricInputIndexView.as_view(), name='electric-index'),

    url(r'^electricinput/(?P<pk>[0-9]+)/$', views.ElectricInputDetailView.as_view(), name='electric_input-detail'),
    #/databaseML2/electricinput/add/
    url(r'electricinput/add/$', views.ElectricInputCreate.as_view(), name='electric_input-add'),
    #/databaseML2/electricinput/update/2/
    url(r'electricinput/update/(?P<pk>[0-9]+)/$', views.ElectricInputUpdate.as_view(), name='electric_input-update'),
    #/databaseML2/electricinput/delete/
    url(r'electricinput/delete/$', views.ElectricInputDelete.as_view(), name='electric_input-delete'),

#Natural Gas
    url(r'nat_gasinput/$', views.NatGasInputIndexView.as_view(), name='nat_gas-index'),
    url(r'^nat_gasinput/(?P<pk>[0-9]+)/$', views.NatGasInputDetailView.as_view(), name='nat_gas_input-detail'),
    #/databaseML2/nat_gasinput/add/
    url(r'nat_gasinput/add/$', views.NatGasInputCreate.as_view(), name='nat_gas_input-add'),
    #/databaseML2/nat_gasinput/update/2/
    url(r'nat_gasinput/update/(?P<pk>[0-9]+)/$', views.NatGasInputUpdate.as_view(), name='nat_gas_input-update'),
    #/databaseML2/nat_gasinput/delete/
    url(r'nat_gasinput/delete/$', views.NatGasInputDelete.as_view(), name='nat_gas_input-delete'),

#Solid Waste
    url(r'solid_wasteinput/$', views.SolidWasteInputIndexView.as_view(), name='solid_waste-index'),
    url(r'^solid_wasteinput/(?P<pk>[0-9]+)/$', views.SolidWasteInputDetailView.as_view(), name='solid_waste_input-detail'),
    #/databaseML2/nat_gasinput/add/
    url(r'solid_wasteinput/add/$', views.SolidWasteInputCreate.as_view(), name='solid_waste_input-add'),
    #/databaseML2/nat_gasinput/update/2/
    url(r'solid_wasteinput/update/(?P<pk>[0-9]+)/$', views.SolidWasteInputUpdate.as_view(), name='solid_waste_input-update'),
    #/databaseML2/nat_gasinput/delete/
    url(r'solid_wasteinput/delete/$', views.SolidWasteInputDelete.as_view(), name='solid_waste_input-delete'),
]
