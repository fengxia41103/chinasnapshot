# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0003_auto_20170108_1805'),
    ]

    operations = [
        migrations.AddField(
            model_name='myorg',
            name='abbrev',
            field=models.CharField(default='', max_length=128, verbose_name='Org abbrev'),
            preserve_default=False,
        ),
    ]
