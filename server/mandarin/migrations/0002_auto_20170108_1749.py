# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='myorg',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Org name', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='mytitle',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Title name', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='myorg',
            name='name',
            field=models.CharField(max_length=128, verbose_name='Org name'),
            preserve_default=True,
        ),
    ]
