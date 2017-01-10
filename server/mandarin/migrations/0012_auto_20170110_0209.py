# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0011_auto_20170110_0135'),
    ]

    operations = [
        migrations.AlterField(
            model_name='career',
            name='end',
            field=models.DateField(default=django.utils.timezone.now, null=True, blank=True),
            preserve_default=True,
        ),
    ]
