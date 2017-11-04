# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0002_auto_20171025_1202'),
        ('user', '0004_auto_20171008_1341'),
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
            ],
        ),
        migrations.CreateModel(
            name='OrderInfo',
            fields=[
                ('oid', models.CharField(max_length=20, serialize=False, primary_key=True)),
                ('odate', models.DateTimeField(auto_now_add=True)),
                ('oIspay', models.BooleanField(default=True)),
                ('ototal', models.DecimalField(max_digits=6, decimal_places=2)),
                ('oaddress', models.CharField(max_length=150)),
                ('user', models.ForeignKey(to='user.UserInfo')),
            ],
        ),
        migrations.AddField(
            model_name='orderdtailinfo',
            name='order',
            field=models.ForeignKey(to='order.OrderInfo'),
        ),
    ]
