# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0006_auto_20170114_0258'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admindivision',
            name='level',
            field=models.CharField(max_length=8, choices=[(b'\xe4\xb8\xad\xe5\xa4\xae', b'\xe4\xb8\xad\xe5\xa4\xae'), (b'\xe7\x9c\x81', b'\xe7\x9c\x81'), (b'\xe5\xb8\x82', b'\xe5\xb8\x82'), (b'\xe7\x9b\xb4\xe8\xbe\x96\xe5\xb8\x82', b'\xe7\x9b\xb4\xe8\xbe\x96\xe5\xb8\x82'), (b'\xe8\x87\xaa\xe6\xb2\xbb\xe5\x8c\xba', b'\xe8\x87\xaa\xe6\xb2\xbb\xe5\x8c\xba'), (b'\xe5\x8e\xbf', b'\xe5\x8e\xbf')]),
            preserve_default=True,
        ),
    ]
