# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0002_auto_20170108_1749'),
    ]

    operations = [
        migrations.CreateModel(
            name='MyRelationship',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nature', models.CharField(max_length=16, choices=[(b'spouse', b'spouse'), (b'parent', b'parent'), (b'grand parent', b'grand parent'), (b'great aunt', b'great aunt'), (b'great uncle', b'great uncle'), (b'sibling', b'sibling'), (b'aunt', b'aunt'), (b'uncle', b'uncle'), (b'1st cousin', b'1st cousin'), (b'niece', b'niece'), (b'nephew', b'nephew'), (b'child', b'child'), (b'grand child', b'grand child'), (b'grand niece', b'grand niece'), (b'grand nephew', b'grand nephew')])),
                ('person_a', models.ForeignKey(related_name='me', to='mandarin.MyPerson')),
                ('person_b', models.ForeignKey(related_name='them', to='mandarin.MyPerson')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='myperson',
            name='birthday',
            field=models.DateField(null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='myperson',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Person name (eng)', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='myperson',
            name='sex',
            field=models.CharField(default='M', max_length=1, choices=[(b'M', b'male'), (b'F', b'female')]),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='myorg',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Org name (eng)', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='mytitle',
            name='eng_name',
            field=models.CharField(max_length=256, null=True, verbose_name='Title name (eng)', blank=True),
            preserve_default=True,
        ),
    ]
