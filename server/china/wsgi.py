import os,os.path

os.environ['DJANGO_SETTINGS_MODULE'] = 'china.settings'

# Fix django closing connection to MemCachier after every request (#11331)
# http://blog.memcachier.com/2014/12/12/django-persistent-memcached-connections/
from django.core.cache.backends.memcached import BaseMemcachedCache
BaseMemcachedCache.close = lambda self, **kwargs: None

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()



