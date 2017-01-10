# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0004_myorg_abbrev'),
    ]

    operations = [
        migrations.RenameField(
            model_name='mycareer',
            old_name='postion',
            new_name='title',
        ),
    ]
