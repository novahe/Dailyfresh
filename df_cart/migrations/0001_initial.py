# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('df_user', '0004_auto_20171008_1341'),
        ('df_goods', '0002_auto_20171025_1202'),
    ]

    operations = [
        migrations.CreateModel(
            name='CartInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('count', models.IntegerField(max_length=3)),
                ('goods', models.ForeignKey(to='df_goods.GoodsInfo')),
                ('user', models.ForeignKey(to='df_user.UserInfo')),
            ],
        ),
    ]
