from django.db import models

# Create your models here.

class UserInfo(models.Model):
    uname=models.CharField(max_length=20)
    name=models.CharField(max_length=10,default='')
    upwd=models.CharField(max_length=40)
    umail=models.CharField(max_length=30)
    uaddr=models.CharField(max_length=20,default='')
    uzip_code=models.CharField(max_length=6,default='')
    uphone=models.CharField(max_length=11,default='')


