# coding:utf-8
from django.shortcuts import render, redirect
from  models import *
from daliyfresh.apps.user import user_auth
from daliyfresh.apps.user.models import UserInfo
from daliyfresh.apps.cart.models import CartInfo
from datetime import datetime
from django.db import transaction


@user_auth.login
def order(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    get = request.GET
    cart_ids = get.getlist("cart_id")
    cart_ids_list = [int(item) for item in cart_ids]
    carts = CartInfo.objects.filter(id__in=cart_ids_list)
    context = {
        'title': '提交订单',
        'page_name': 1,
        'carts': carts,
        'cart_ids': ','.join(cart_ids),
        'user': user,
    }
    return render(request, 'order/place_order.html', context)


'''
事务：一旦操作失败则全部回退
1、创建订单对象
2、判断商品的库存
3、创建详单对象
4、修改商品库存
5、删除购物车
'''


@transaction.atomic
@user_auth.login
def order_handle(request):
    tran_id = transaction.savepoint()  # 创建还原点
    cart_ids = request.POST.get('cart_ids')
    try:
        # 创建订单对象
        order = OrderInfo()
        now = datetime.now()
        uid = request.session['user_id']
        order.oid = '%s%d' % (now.strftime('%Y%m%d%H%M%S'), uid)
        order.user_id = uid
        order.odate = now
        print request.POST.get('address')
        order.oaddress = request.POST.get('address')
        order.ototal = 0
        order.save()

        # 创建详单对象
        cart_ids = [int(item) for item in cart_ids.split(',')]
        print cart_ids
        total = 0
        for id1 in cart_ids:
            detail = OrderDtailInfo()
            detail.order = order
            # 查询购物信息
            cart = CartInfo.objects.get(id=id1)
            # 库存
            goods = cart.goods
            if goods.gstore >= cart.count:
                goods.gstore = cart.goods.gstore - cart.count
                goods.save()
                # 完善详单信息
                detail.goods_id = goods.id  # 做聚合查询

                price = goods.gprice
                detail.price = price
                count = cart.count

                detail.count = count
                detail.subtotal = price * count
                detail.save()
                total = total + price * count
                cart.delete()
            else:  # 如果库存小于购买数量
                transaction.savepoint_rollback(tran_id)  # 失败回滚
                return redirect('/cart/')
                # 保存总价
        if total > 88:
            order.ototal = total
        else:
            order.ototal = total + 10
        order.save()
        transaction.savepoint_commit(tran_id)  # 提交事务
    except Exception as e:
        print '================%s' % e
        transaction.savepoint_rollback(tran_id)
    return redirect('/user/order/')


@user_auth.login
def pay(request, oid):
    order = OrderDtailInfo.objects.get(oid=oid)
    order = oIspay = True
    order.save()
    context = {'order': order}
    return render(request, 'order/pay.html', context)
