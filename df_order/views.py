#coding:utf-8
from django.shortcuts import render,redirect
from  models import *
from df_user import user_auth
from df_user.models import UserInfo
from df_cart.models import *


def order(request):
    user = UserInfo.objects.get(id = request.session['user_id'])
    get = request.GET
    cart_ids = get.getlist("cart_id")
    cart_ids_list = []
    context = {
        'title':'提交订单',
        'page_name':1,
    }
    return render(request,'df_order/place_order.html',context)
