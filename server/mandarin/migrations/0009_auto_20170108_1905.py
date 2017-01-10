# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0008_auto_20170108_1902'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admindivision',
            name='level',
            field=models.CharField(max_length=8, choices=[(b'0', b'central gov level'), (b'1', b'provincial level'), (b'2', b'prefecture level'), (b'3', b'country level'), (b'4', b'township level'), (b'5', b'village level')]),
            preserve_default=True,
        ),
    ]
