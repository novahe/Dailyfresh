#coding:utf-8
from django.db import models
from tinymce.models import HTMLField

class TypeInfo(models.Model):
    """goods categories """
    ttitle = models.CharField(max_length=20)
    isDelete = models.BooleanField(default=False)
    def __str__(self):
        return self.ttitle.encode('utf-8')

class GoodsInfo(models.Model):
    """商品信息"""
    gtitle = models.CharField(max_length=20)
    gpic = models.ImageField(upload_to='goods')
    gprice = models.DecimalField(max_digits=5,decimal_places=2) # float
    isDelete = models.BooleanField(default=False)
    gunit = models.CharField(max_length=20,default='500g')
    gclick = models.IntegerField()
    gintroduction = models.CharField(max_length=200)
    gstore = models.IntegerField()
    gcontent = HTMLField()
    gtype = models.ForeignKey(TypeInfo)
    def __str__(self):
        return self.gtitle.encode('utf-8')
