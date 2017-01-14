# -*- coding: utf-8 -*-

from django.db import models
from django.contrib import admin
from django.forms import ModelForm
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.generic import GenericRelation
from django.contrib.contenttypes.models import ContentType
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from annoying.fields import JSONField  # django-annoying
from django.db.models import Q
from datetime import datetime as dt
from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from django.utils.timezone import now


class MyBaseModel (models.Model):
    # basic value fields
    name = models.CharField(
        default=None,
        max_length=128,
        verbose_name=u'名称'
    )
    abbrev = models.CharField(
        max_length=128,
        verbose_name=u'Abbrev'
    )
    eng_name = models.CharField(
        max_length=256,
        null=True,
        blank=True,
        verbose_name=u'Name (eng)'
    )
    description = models.TextField(
        null=True,
        blank=True,
        verbose_name=u'描述'
    )

    # help text
    help_text = models.CharField(
        max_length=64,
        null=True,
        blank=True,
        verbose_name=u'帮助提示'
    )

    # Optional reference URL where this record's
    # information is obtained.
    ref = models.URLField(
        null=True,
        blank=True
    )

    # attachments
    attachments = GenericRelation('Attachment')

    # this is an Abstract model
    class Meta:
        abstract = True

    def __unicode__(self):
        return self.name

######################################################
#
#	Tags
#
#####################################################


class MyTaggedItem (models.Model):
    # basic value fields
    tag = models.SlugField(
        default='',
        max_length=16,
        verbose_name=u'Tag'
    )

    def __unicode__(self):
        return self.tag

######################################################
#
#	Attachments
#
#####################################################


class Attachment (models.Model):
    # generic foreign key to base model
    # so we can link attachment to any model defined below
    content_type = models.ForeignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    # instance fields
    created_by = models.ForeignKey(
        User,
        blank=True,
        null=True,
        default=None,
        verbose_name=u'创建用户',
        help_text=''
    )

    # basic value fields
    name = models.CharField(
        default='default name',
        max_length=64,
        verbose_name=u'附件名称'
    )
    description = models.CharField(
        max_length=64,
        default='default description',
        verbose_name=u'附件描述'
    )
    file = models.FileField(
        upload_to='%Y/%m/%d',
        verbose_name=u'附件',
        help_text=u'附件'
    )

    def __unicode__(self):
        return self.file.name


class AttachmentForm(ModelForm):

    class Meta:
        model = Attachment
        fields = ['description', 'file']

######################################################
#
#	App specific models
#
#####################################################


class AdminDivision(MyBaseModel):
    '''
    '''
    ADMIN_DIVISION_LEVEL_CHOICES = (
        ('0', 'central gov level'),
        ('1', 'provincial level'),
        ('2', 'prefecture level'),
        ('3', 'country level'),
        ('4', 'township level'),
        ('5', 'village level')
    )
    level = models.CharField(
        max_length=8,
        choices=ADMIN_DIVISION_LEVEL_CHOICES
    )
    code = models.CharField(
        max_length=12,
        null=True,
        blank=True
    )
    ISO_3166_2_CN = models.CharField(
        max_length=8,
        null=True,
        blank=True
    )

    def __unicode__(self):
        return self.name


class Grade(models.Model):
    '''
    See reference:

    http://baike.baidu.com/view/1672894.htm#1_5
    '''
    name = models.CharField(
        max_length=16
    )

    def __unicode__(self):
        return self.name


class Org(MyBaseModel):
    '''
    Org is an entity that a position is attached to and a person is working for.
    '''
    BRANCH_CHOICES = (
        ('party', 'party'),
        ('legislative', 'legislative'),
        ('executive', 'executive'),
        ('judicial', 'judicial'),
        ('military', 'military'),
        ('ideology', 'ideology'),
        ('united front', 'united front'),
        ('publicity', 'publicity'),
        ('foreign relations', 'foriengn relations')
    )
    branch = models.CharField(
        max_length=32,
        choices=BRANCH_CHOICES,
        null=True,
        blank=True
    )
    official_url = models.URLField(
        null=True,
        blank=True
    )
    # Reporting hierarchy
    report_to = models.ForeignKey(
        'self',
        null=True,
        blank=True,
    )

    def __unicode__(self):
        return self.name


class Title(MyBaseModel):
    '''
    Title is the name of a position, eg. deputy, director.
    '''
    # Title's grade can be different from org's
    grade = models.ForeignKey(
        'Grade',
        null=True,
        blank=True
    )

    # Reporting hierarchy
    # Beside the org reporting structure,
    # title's can be different
    report_to = models.ForeignKey(
        'self',
        null=True,
        blank=True,
    )

    def __unicode__(self):
        return self.name


class Post(models.Model):
    '''
    Post is a position within an Org, or job, that the person holds.
    '''
    org = models.ForeignKey('Org', null=True, blank=True)
    title = models.ForeignKey('Title')
    admin = models.ForeignKey('AdminDivision')

    def __unicode__(self):
        return '%s (%s)' % (self.title.name, self.admin.name)


class Person(models.Model):
    SEX_CHOICES = (
        ('M', 'male'),
        ('F', 'female')
    )

    name = models.CharField(
        default=None,
        max_length=128,
        verbose_name=u'名称'
    )
    eng_name = models.CharField(
        max_length=128,
        default=''
    )
    sex = models.CharField(
        max_length=1,
        choices=SEX_CHOICES
    )
    birthday = models.DateField(
        null=True,
        blank=True
    )
    photo = models.URLField(null=True, blank=True)

    def __unicode__(self):
        return self.name


class Career(models.Model):
    person = models.ForeignKey(
        'Person'
    )
    post = models.ForeignKey(
        'Post'
    )
    start = models.CharField(
        max_length=8,
        default='1999'
    )
    end = models.CharField(  # null if present
        max_length=8,
        null=True,
        blank=True
    )

    # Reference wiki URL
    ref = models.URLField(
        null=True,
        blank=True
    )


class Connection(models.Model):
    RELATIONSHIP_CHOICES = (
        ('spouse', 'spouse'),
        ('ex spouse', 'ex spouse'),
        ('parent', 'parent'),
        ('grand parent', 'grand parent'),
        ('great aunt', 'great aunt'),
        ('great uncle', 'great uncle'),
        ('sibling', 'sibling'),
        ('aunt', 'aunt'),
        ('uncle', 'uncle'),
        ('1st cousin', '1st cousin'),
        ('niece', 'niece'),
        ('nephew', 'nephew'),
        ('child', 'child'),
        ('grand child', 'grand child'),
        ('grand niece', 'grand niece'),
        ('grand nephew', 'grand nephew'),
        ('step parent', 'step parent'),
        ('step children', 'step childre'),
        ('friend', 'friend'),
        ('classmate', 'classmate'),
        ('ex colleague', 'ex colleague'),
        ('military buddy', 'military buddy')
    )
    nature = models.CharField(
        max_length=16,
        choices=RELATIONSHIP_CHOICES
    )
    person_a = models.ForeignKey('Person', related_name='me')
    person_b = models.ForeignKey('Person', related_name='them')
    by_blood = models.BooleanField(default=False)
    ref = models.URLField(
        null=True,
        blank=True
    )
