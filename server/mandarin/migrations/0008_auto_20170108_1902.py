# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mandarin', '0007_auto_20170108_1826'),
    ]

    operations = [
        migrations.CreateModel(
            name='AdminDivision',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Org abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('level', models.CharField(max_length=8, choices=[(b'1', b'provincial level'), (b'2', b'prefecture level'), (b'3', b'country level'), (b'4', b'township level'), (b'5', b'village level')])),
                ('code', models.CharField(max_length=12, null=True, blank=True)),
                ('ISO_3166_2_CN', models.CharField(max_length=8, null=True, blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Career',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('start', models.DateField()),
                ('end', models.DateField()),
                ('ref', models.URLField(null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Connection',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nature', models.CharField(max_length=16, choices=[(b'spouse', b'spouse'), (b'ex spouse', b'ex spouse'), (b'parent', b'parent'), (b'grand parent', b'grand parent'), (b'great aunt', b'great aunt'), (b'great uncle', b'great uncle'), (b'sibling', b'sibling'), (b'aunt', b'aunt'), (b'uncle', b'uncle'), (b'1st cousin', b'1st cousin'), (b'niece', b'niece'), (b'nephew', b'nephew'), (b'child', b'child'), (b'grand child', b'grand child'), (b'grand niece', b'grand niece'), (b'grand nephew', b'grand nephew'), (b'step parent', b'step parent'), (b'step children', b'step childre'), (b'friend', b'friend'), (b'classmate', b'classmate'), (b'ex colleague', b'ex colleague'), (b'military buddy', b'military buddy')])),
                ('by_blood', models.BooleanField(default=False)),
                ('ref', models.URLField(null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Org',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Org abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('official_url', models.URLField(null=True, blank=True)),
                ('admin', models.ForeignKey(blank=True, to='mandarin.AdminDivision', null=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=16)),
                ('sex', models.CharField(max_length=1, choices=[(b'M', b'male'), (b'F', b'female')])),
                ('birthday', models.DateField(null=True, blank=True)),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Person name (eng)', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Title',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=None, max_length=128, verbose_name='\u540d\u79f0')),
                ('abbrev', models.CharField(max_length=128, verbose_name='Org abbrev')),
                ('eng_name', models.CharField(max_length=256, null=True, verbose_name='Name (eng)', blank=True)),
                ('description', models.TextField(null=True, verbose_name='\u63cf\u8ff0', blank=True)),
                ('help_text', models.CharField(max_length=64, null=True, verbose_name='\u5e2e\u52a9\u63d0\u793a', blank=True)),
                ('ref', models.URLField(null=True, blank=True)),
                ('grade', models.IntegerField(default=0, verbose_name='pay grade')),
                ('org', models.ForeignKey(to='mandarin.Org')),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='mycareer',
            name='person',
        ),
        migrations.RemoveField(
            model_name='mycareer',
            name='title',
        ),
        migrations.DeleteModel(
            name='MyCareer',
        ),
        migrations.RemoveField(
            model_name='myorg',
            name='state',
        ),
        migrations.RemoveField(
            model_name='myrelationship',
            name='person_a',
        ),
        migrations.RemoveField(
            model_name='myrelationship',
            name='person_b',
        ),
        migrations.DeleteModel(
            name='MyPerson',
        ),
        migrations.DeleteModel(
            name='MyRelationship',
        ),
        migrations.DeleteModel(
            name='MyState',
        ),
        migrations.RemoveField(
            model_name='mytitle',
            name='org',
        ),
        migrations.DeleteModel(
            name='MyOrg',
        ),
        migrations.DeleteModel(
            name='MyTitle',
        ),
        migrations.AddField(
            model_name='connection',
            name='person_a',
            field=models.ForeignKey(related_name='me', to='mandarin.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='connection',
            name='person_b',
            field=models.ForeignKey(related_name='them', to='mandarin.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='career',
            name='person',
            field=models.ForeignKey(to='mandarin.Person'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='career',
            name='title',
            field=models.ForeignKey(to='mandarin.Title'),
            preserve_default=True,
        ),
    ]
