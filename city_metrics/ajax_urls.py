# 9/10/2016 - Mauricio Leon - The city_metrics folder is an application of the
# webapp Django Project. In this ajax_urls we are simply giving access to the
# ajax_views. If you see the urls.py in the "webapp" folder, it should mention
# the ajax_urls


from django.conf.urls import *

urlpatterns = patterns('city_metrics.ajax_views',
                       (r'^update-chart', 'update_chart'),
)
