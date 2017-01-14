# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0003_auto_20170114_0152'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='person',
            name='abbrev',
        ),
        migrations.RemoveField(
            model_name='person',
            name='description',
        ),
        migrations.RemoveField(
            model_name='person',
            name='eng_name',
        ),
        migrations.RemoveField(
            model_name='person',
            name='help_text',
        ),
        migrations.RemoveField(
            model_name='person',
            name='ref',
        ),
    ]
