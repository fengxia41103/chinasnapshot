# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0006_auto_20170108_1822'),
    ]

    operations = [
        migrations.AddField(
            model_name='myorg',
            name='help_text',
            field=models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='mytitle',
            name='abbrev',
            field=models.CharField(default='', max_length=128, verbose_name='Org abbrev'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='mytitle',
            name='help_text',
            field=models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='myorg',
            name='description',
            field=models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='myorg',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='myorg',
            name='name',
            field=models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='mytitle',
            name='description',
            field=models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='mytitle',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='mytitle',
            name='name',
            field=models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0'),
            preserve_default=True,
        ),
    ]
