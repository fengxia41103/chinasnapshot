# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0005_auto_20170108_1817'),
    ]

    operations = [
        migrations.AddField(
            model_name='mycareer',
            name='ref',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='myorg',
            name='official_url',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='myorg',
            name='ref',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='myrelationship',
            name='ref',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='mytitle',
            name='ref',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
