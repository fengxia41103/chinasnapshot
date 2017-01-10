#!/usr/bin/python
# -*- coding: utf-8 -*-

from django import forms
from django.conf import settings
from django.forms.models import modelformset_factory, inlineformset_factory
from django.contrib.contenttypes.generic import generic_inlineformset_factory
from django.contrib.auth.decorators import login_required, permission_required
from django.utils.decorators import method_decorator
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import authenticate, logout, login
from django.template import RequestContext
from django.views.generic import TemplateView, ListView, DetailView
from django.views.generic.edit import FormView, CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy, resolve, reverse
from django.shortcuts import render, render_to_response
from django.http import HttpResponseRedirect, JsonResponse
from django.utils.encoding import smart_text
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Count, Max, Min, Avg

from django.http import HttpResponse
from django.shortcuts import render
from django.views.decorators.vary import vary_on_headers
# protect the view with require_POST decorator
from django.views.decorators.http import require_POST
from django.contrib import messages
from django.db.models import Q
from django.template import loader, Context

# django-crispy-forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit

# django-filters
from django_filters import FilterSet, BooleanFilter
from django_filters.views import FilterView
import django_filters

# django emails
from django.core.mail import send_mail

# so what
import re
import os
import os.path
import shutil
import subprocess
import testtools
import random
import codecs
import unittest
import time
import tempfile
import csv
import hashlib
from datetime import datetime as dt
from multiprocessing import Process, Queue
import simplejson as json
import googlemaps
from itertools import groupby
import urllib
import lxml.html
from utility import MyUtility

from mandarin.models import *

###################################################
#
#	Common utilities
#
###################################################


def class_view_decorator(function_decorator):
    """Convert a function based decorator into a class based decorator usable
    on class based Views.

    Can't subclass the `View` as it breaks inheritance (super in particular),
    so we monkey-patch instead.
    """

    def simple_decorator(View):
        View.dispatch = method_decorator(function_decorator)(View.dispatch)
        return View

    return simple_decorator

###################################################
#
#	Static views
#
###################################################


class HomeView(TemplateView):
    template_name = 'pi/common/home.html'

    def get_context_data(self, **kwargs):
        context = super(TemplateView, self).get_context_data(**kwargs)
        context['contact_form'] = ContactForm()
        context['login_form'] = AuthenticationForm()
        context['registration_form'] = UserCreationForm()
        return context


###################################################
#
#	User views
#
###################################################


class LoginView(FormView):
    success_url = reverse_lazy('')
    form_class = AuthenticationForm
    template_name = 'mandarin/common/home.html'

    def form_valid(self, form):
        username = form.cleaned_data['username']
        password = form.cleaned_data['password']
        user = authenticate(username=username, password=password)

        if user is not None and user.is_active:
            login(self.request, user)
            return HttpResponseRedirect(self.success_url)
        else:
            return self.form_invalid(form)


def form_invalid(self, form):
    messages.error(self.request, 'Login failed! Please check your username and password.')
    return HttpResponseRedirect(reverse_lazy('home'))


class LogoutView(TemplateView):

    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse_lazy('home'))


class UserRegisterView(FormView):
    form_class = UserCreationForm
    success_url = reverse_lazy('')

    def form_valid(self, form):
        username = form.cleaned_data['username']
        password = form.cleaned_data['password2']
        if len(User.objects.filter(username=username)) > 0:
            return self.form_invalid(form)
        else:
            user = User.objects.create_user(username, '', password)
            user.save()

        # login after
        user = authenticate(username=username, password=password)

        if user is not None and user.is_active:
            login(self.request, user)
            return HttpResponseRedirect(self.success_url)
        else:
            return self.form_invalid(form)

    def form_invalid(self, form):
        messages.error(
            self.request, 'User registration failed! Please check your username and password.')
        return HttpResponseRedirect(reverse_lazy('home'))
