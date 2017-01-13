# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('contenttypes', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AdminDivision',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('level', models.CharField(max_length=8, choices=[(b'0', b'central gov level'), (b'1', b'provincial level'), (b'2', b'prefecture level'), (b'3', b'country level'), (b'4', b'township level'), (b'5', b'village level')])),
                ('code', models.CharField(max_length=12, null=True, blank=True)),
                ('ISO_3166_2_CN', models.CharField(max_length=8, null=True, blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Attachment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('object_id', models.PositiveIntegerField()),
                ('name', models.CharField(default=b'default name', max_length=64, verbose_name='\u9644\u4ef6\u540d\u79f0')),
                ('description', models.CharField(default=b'default description', max_length=64, verbose_name='\u9644\u4ef6\u63cf\u8ff0')),
                ('file', models.FileField(help_text='\u9644\u4ef6', upload_to=b'%Y/%m/%d', verbose_name='\u9644\u4ef6')),
                ('content_type', models.ForeignKey(to='contenttypes.ContentType')),
                ('created_by', models.ForeignKey(default=None, to=settings.AUTH_USER_MODEL, blank=True, help_text=b'', null=True, verbose_name='\u521b\u5efa\u7528\u6237')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Career',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('start', models.CharField(default=b'1999', max_length=8)),
                ('end', models.CharField(max_length=8, null=True, blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Connection',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nature', models.CharField(max_length=16, choices=[(b'spouse', b'spouse'), (b'ex spouse', b'ex spouse'), (b'parent', b'parent'), (b'grand parent', b'grand parent'), (b'great aunt', b'great aunt'), (b'great uncle', b'great uncle'), (b'sibling', b'sibling'), (b'aunt', b'aunt'), (b'uncle', b'uncle'), (b'1st cousin', b'1st cousin'), (b'niece', b'niece'), (b'nephew', b'nephew'), (b'child', b'child'), (b'grand child', b'grand child'), (b'grand niece', b'grand niece'), (b'grand nephew', b'grand nephew'), (b'step parent', b'step parent'), (b'step children', b'step childre'), (b'friend', b'friend'), (b'classmate', b'classmate'), (b'ex colleague', b'ex colleague'), (b'military buddy', b'military buddy')])),
                ('by_blood', models.BooleanField(default=False)),
                ('ref', models.URLField(null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Grade',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=16)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='MyTaggedItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tag', models.SlugField(default=b'', max_length=16, verbose_name='Tag')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Org',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('branch', models.IntegerField(blank=True, null=True, choices=[(0, b'party'), (1, b'legislative'), (2, b'executive'), (3, b'judicial'), (4, b'military'), (5, b'ideology'), (6, b'united front'), (7, b'publicity'), (8, b'foriengn relations')])),
                ('official_url', models.URLField(null=True, blank=True)),
                ('report_to', models.ForeignKey(blank=True, to='mandarin.Org', null=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('sex', models.CharField(max_length=1, choices=[(b'M', b'male'), (b'F', b'female')])),
                ('birthday', models.DateField(null=True, blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('admin', models.ForeignKey(to='mandarin.AdminDivision')),
                ('org', models.ForeignKey(blank=True, to='mandarin.Org', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Title',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('grade', models.ForeignKey(blank=True, to='mandarin.Grade', null=True)),
                ('report_to', models.ForeignKey(blank=True, to='mandarin.Title', null=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='post',
            name='title',
            field=models.ForeignKey(to='mandarin.Title'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='connection',
            name='person_a',
            field=models.ForeignKey(related_name='me', to='mandarin.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='connection',
            name='person_b',
            field=models.ForeignKey(related_name='them', to='mandarin.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='career',
            name='person',
            field=models.ForeignKey(to='mandarin.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='career',
            name='post',
            field=models.ForeignKey(to='mandarin.Post'),
            preserve_default=True,
        ),
    ]
