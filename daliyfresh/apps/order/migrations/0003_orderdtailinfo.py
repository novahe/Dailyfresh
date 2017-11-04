# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0002_auto_20171025_1202'),
        ('order', '0002_auto_20171104_2045'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderDtailInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('price', models.DecimalField(max_digits=6, decimal_places=2)),
                ('subtotal', models.DecimalField(max_digits=6, decimal_places=2)),
                ('count', models.IntegerField()),
                ('goods', models.ForeignKey(to='goods.GoodsInfo')),
                ('order', models.ForeignKey(to='order.OrderInfo')),
            ],
        ),
    ]
