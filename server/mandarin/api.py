# myapp/api.py
from tastypie.authorization import Authorization
from tastypie import fields, resources
from tastypie.resources import ModelResource, ALL, ALL_WITH_RELATIONS
from tastypie.api import Api
from django.http import HttpResponse

from mandarin.models import *


def build_content_type(format, encoding='utf-8'):
    """
    Appends character encoding to the provided format if not already present.
    """
    if 'charset' in format:
        return format

    return "%s; charset=%s" % (format, encoding)


class MyModelResource(ModelResource):

    def create_response(self, request, data, response_class=HttpResponse, **response_kwargs):
        """
        Extracts the common "which-format/serialize/return-response" cycle.

        Mostly a useful shortcut/hook.
        """
        desired_format = self.determine_format(request)
        serialized = self.serialize(request, data, desired_format)
        return response_class(content=serialized, content_type=build_content_type(desired_format), **response_kwargs)

######################################################
#
#	App resources
#
#####################################################


class AdminDivisionResource(MyModelResource):

    class Meta:
        queryset = AdminDivision.objects.all()
        resource_name = 'division'


class OrgResource(MyModelResource):
    admin = fields.ForeignKey(AdminDivisionResource, 'division')

    class Meta:
        queryset = Org.objects.all()
        filtering = {
            'admin': ALL_WITH_RELATIONS
        }


class TitleResource(MyModelResource):
    org = fields.ForeignKey(OrgResource, 'org')

    class Meta:
        queryset = Title.objects.all()
        filtering = {
            'org': ALL_WITH_RELATIONS
        }


class PersonResource(MyModelResource):

    class Meta:
        queryset = Person.objects.all()


class CareerResource(MyModelResource):
    person = fields.ForeignKey(PersonResource, 'person')
    title = fields.ForeignKey(TitleResource, 'title', full=True)

    class Meta:
        queryset = Career.objects.all()
        filtering = {
            'person': ALL_WITH_RELATIONS,
            'title': ALL_WITH_RELATIONS
        }


class ConnectionResource(MyModelResource):
    person_a = fields.ForeignKey(PersonResource, 'me')
    person_b = fields.ForeignKey(PersonResource, 'them')

    class Meta:
        queryset = Connection.objects.all()
        filtering = {
            'person_a': ALL_WITH_RELATIONS,
            'person_b': ALL_WITH_RELATIONS
        }


v1_api = Api(api_name='v1')
v1_api.register(AdminDivisionResource())
v1_api.register(OrgResource())
v1_api.register(TitleResource())
v1_api.register(PersonResource())
v1_api.register(CareerResource())
v1_api.register(ConnectionResource())
