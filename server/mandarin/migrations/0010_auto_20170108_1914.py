# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0009_auto_20170108_1905'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admindivision',
            name='abbrev',
            field=models.CharField(max_length=128, verbose_name='Abbrev'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='career',
            name='end',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='org',
            name='abbrev',
            field=models.CharField(max_length=128, verbose_name='Abbrev'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='title',
            name='abbrev',
            field=models.CharField(max_length=128, verbose_name='Abbrev'),
            preserve_default=True,
        ),
    ]
