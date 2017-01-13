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
    list_display = ['name', 'level']


class OrgAdmin(admin.ModelAdmin):
    list_display = ['name', 'branch', 'report_to']


class TitleAdmin(admin.ModelAdmin):
    list_display = ['name', 'abbrev', 'grade', 'report_to']


class PersonAdmin(admin.ModelAdmin):
    list_display = ['name', 'sex', 'birthday']


class CareerAdmin(admin.ModelAdmin):
    list_display = ['person', 'post', 'start', 'end']


class ConnectionAdmin(admin.ModelAdmin):
    list_display = ['person_a', 'person_b', 'nature']


class GradeAdmin(admin.ModelAdmin):
    pass


class PostAdmin(admin.ModelAdmin):
    pass

admin_register(namespace=globals())
