# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0005_person_eng_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='org',
            name='branch',
            field=models.CharField(blank=True, max_length=32, null=True, choices=[(b'party', b'party'), (b'legislative', b'legislative'), (b'executive', b'executive'), (b'judicial', b'judicial'), (b'military', b'military'), (b'ideology', b'ideology'), (b'united front', b'united front'), (b'publicity', b'publicity'), (b'foreign relations', b'foriengn relations')]),
            preserve_default=True,
        ),
    ]
