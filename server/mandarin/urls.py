from django.conf.urls import patterns, url
from django.conf.urls import url
from django.views.generic.edit import CreateView
from django.contrib.auth.forms import UserCreationForm
import django.contrib.auth.views as AuthViews
from django.views.decorators.csrf import ensure_csrf_cookie
from django.conf import settings
from django.conf.urls.static import static
from django.views.decorators.cache import cache_page

from mandarin import views
urlpatterns = patterns(
    '',
    url(r'^$', views.LoginView.as_view(), name='home'),
    url(r'login/$', views.LoginView.as_view(), name='login'),
    url(r'logout/$', views.LogoutView.as_view(), name='logout'),
    url(r'^register/$', views.UserRegisterView.as_view(),
        name='user_register'),
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
