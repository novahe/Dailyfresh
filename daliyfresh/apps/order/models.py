#coding:utf-8
from django.db import models


class OrderInfo(models.Model):
    """订单信息"""
    oid = models.CharField(max_length=20,primary_key=True)
    user = models.ForeignKey('user.UserInfo')
    odate = models.DateTimeField(auto_now_add=True)
    oIspay = models.BooleanField(default=True)
    ototal = models.DecimalField(max_digits=6,decimal_places=2)
    oaddress = models.CharField(max_length=150)

class OrderDtailInfo(models.Model):
    """订单详细信息"""
    goods = models.ForeignKey('goods.GoodsInfo')
    order = models.ForeignKey(OrderInfo)
    price = models.DecimalField(max_digits=6,decimal_places=2)
    subtotal = models.DecimalField(max_digits=6,decimal_places=2,)
    count = models.IntegerField()

