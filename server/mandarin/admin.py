from django.contrib import admin
from mandarin.models import *


def admin_register(namespace):
    for name, model_admin in namespace.copy().iteritems():
        if name.endswith("Admin"):
            model = namespace[name[:-5]]
            try:
                admin.site.register(model, model_admin)
            except:
                raise

# Register your models here.


class AdminDivisionAdmin(admin.ModelAdmin):
    list_display = ['name', 'abbrev', 'level', 'code']


class OrgAdmin(admin.ModelAdmin):
    list_display = ['name', 'abbrev', 'eng_name', 'admin']


class TitleAdmin(admin.ModelAdmin):
    list_display = ['name', 'org', 'grade']


class PersonAdmin(admin.ModelAdmin):
    list_display = ['name', 'sex', 'birthday', 'eng_name']


class CareerAdmin(admin.ModelAdmin):
    list_display = ['person', 'title', 'start', 'end']
    empty_value_display = '-empty-'
    date_hierarchy = 'start'


class ConnectionAdmin(admin.ModelAdmin):
    list_display = ['person_a', 'person_b', 'nature']

admin_register(namespace=globals())
