from django.conf.urls  import url
from . import views

app_name = "databaseML2"

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),

    #/databaseML2/waterinput/add/
    url(r'waterinput/add/$', views.AlbumCreate.as_view(), name='album-add'),

    #/databaseML2/waterinput/2/
    url(r'waterinput/(?P<pk>[0-9]+)/$', views.AlbumUpdate.as_view(), name='album-update'),

    #/databaseML2/waterinput/delete/
    url(r'waterinput/add/$', views.AlbumDelete.as_view(), name='album-delete'),
]
