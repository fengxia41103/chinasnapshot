# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0010_auto_20170108_1914'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='abbrev',
            field=models.CharField(default='', max_length=128, verbose_name='Abbrev'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='person',
            name='description',
            field=models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='person',
            name='help_text',
            field=models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='person',
            name='ref',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='person',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='person',
            name='name',
            field=models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0'),
            preserve_default=True,
        ),
    ]
