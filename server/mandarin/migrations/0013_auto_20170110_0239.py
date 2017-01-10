# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0012_auto_20170110_0209'),
    ]

    operations = [
        migrations.AlterField(
            model_name='career',
            name='end',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
