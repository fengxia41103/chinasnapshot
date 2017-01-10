from django.conf.urls import patterns, include, url
from django.contrib import admin
import settings

# tastypie API urls
from mandarin.api import v1_api

urlpatterns = patterns('',
                       url(r'^api/', include(v1_api.urls)),
                       url(r'^admin/', include(admin.site.urls)),
                       url('', include('social.apps.django_app.urls', namespace='social')),
                       url('', include('django.contrib.auth.urls', namespace='auth')),

                       url(r'^mandarin/', include('mandarin.urls')),
                       )

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += patterns('',
                            url(r'^__debug__/', include(debug_toolbar.urls)),
                            )

    urlpatterns += patterns('django.contrib.staticfiles.views',
                            url(r'^static/(?P<path>.*)$', 'serve'),
                            )
