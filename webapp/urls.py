from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin

admin.autodiscover()







urlpatterns = patterns(
    'webapp.views',
    (r'^$', 'viewHome'),
    (r'^participation-form$', 'viewParticipationForm'),
    (r'^home_api/select_section', 'selectHomePageSect')
)


urlpatterns += patterns(
    'databaseML.views',
    url(r'^database/', include ('databaseML.urls'),
    url(r'^', include ('databaseML.urls')),
)

urlpatterns += patterns(
    'databaseML2.views',
    url(r'^database2/$', include ('databaseML2.urls', namespace="databaseML2")),
    url(r'^', include ('databaseML2.urls')),
)


# 9/10/2016 - Mauricio Leon - The one bellows simply makes the urls in
# city_metrics/ajax_urls.py available
urlpatterns += patterns(
    '',
    (r'^chart_api/', include('city_metrics.ajax_urls')),
)

urlpatterns += patterns(
    '',
    (r'^admin/imports/', include('admin_imports.urls')),
)

urlpatterns += patterns(
    '',
    url(r'^admin/filebrowser/', include('filebrowser.urls')),
    url(r'^admin/', include(admin.site.urls)),
)

if settings.DEVELOPMENT:
    urlpatterns += patterns(
        '',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
        url(r'^customer_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.PROJECT_ROOT + '/customer_media'}),
    )

urlpatterns += patterns(
    'site_content.views',
    url(r'^(?P<aSlug>.*)$', 'viewDetail'),
)
