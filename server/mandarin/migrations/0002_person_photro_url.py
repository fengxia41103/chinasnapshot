# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='photro_url',
            field=models.URLField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
