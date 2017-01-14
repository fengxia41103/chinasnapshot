# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0002_person_photro_url'),
    ]

    operations = [
        migrations.RenameField(
            model_name='person',
            old_name='photro_url',
            new_name='photo',
        ),
    ]
