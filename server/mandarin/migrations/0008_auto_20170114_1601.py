# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0007_auto_20170114_1559'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admindivision',
            name='level',
            field=models.CharField(max_length=8, choices=[('\u4e2d\u592e', '\u4e2d\u592e'), ('\u7701', '\u7701'), ('\u5e02', '\u5e02'), ('\u76f4\u8f96\u5e02', '\u76f4\u8f96\u5e02'), ('\u81ea\u6cbb\u533a', '\u81ea\u6cbb\u533a'), ('\u53bf', '\u53bf')]),
            preserve_default=True,
        ),
    ]
