# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0004_auto_20170114_0153'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='eng_name',
            field=models.CharField(default=b'', max_length=128),
            preserve_default=True,
        ),
    ]
