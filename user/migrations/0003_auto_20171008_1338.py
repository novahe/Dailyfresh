# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_auto_20171008_0313'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userinfo',
            name='ushou',
        ),
        migrations.AddField(
            model_name='userinfo',
            name='name',
            field=models.CharField(default=1, max_length=10),
            preserve_default=False,
        ),
    ]
