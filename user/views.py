# coding:utf-8
from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponseRedirect
from models import *
from goods.models import *
from order.models import *
from hashlib import sha1
from . import user_auth
from django.core.paginator import Paginator,Page

def register(request):
    """用户注册"""
    context = {'title': '用户注册'}
    return render(request, 'user/register.html', context)


def register_handle(request):
    """注册请求"""
    # 接受用户请求
    post = request.POST
    uname = post.get('user_name')
    upwd = post.get('pwd')
    upwd2 = post.get('cpwd')
    uemail = post.get('email')

    # print upwd, upwd2
    # 判断两次密码
    if upwd != upwd2:
        return redirect('/user/register/')

    # 密码加密
    s1 = sha1()
    s1.update(upwd)
    upwd3 = s1.hexdigest()

    # 创建对象
    user = UserInfo()
    user.uname = uname
    user.upwd = upwd3
    user.umail = uemail
    user.save()

    return redirect('/user/login/')


def register_exit(request):
    """判断用户是否存在"""
    uname = request.GET.get('uname')
    count = UserInfo.objects.filter(uname=uname).count()
    return JsonResponse({'count': count})


def login(request):
    """用户登录"""
    uname = request.COOKIES.get('uname', '')
    name = UserInfo.objects.filter(uname = uname)
    context = {
        'title': '用户登录',
        'error_name': 0,
        'error_pwd': 0,
        'name': name
    }
    return render(request, 'user/login.html', context)


def login_handle(request):
    """处理登录请求"""
    post = request.POST
    uname = post.get('username')
    upwd = post.get('pwd')
    re_pwd = post.get('remember_pwd', 0)

    # 数据表查询
    users = UserInfo.objects.filter(uname=uname)  # []
    if len(users) == 1:
        s1 = sha1()
        s1.update(upwd)
        if s1.hexdigest() == users[0].upwd:
            res = HttpResponseRedirect('/user/info/')

            # 记住用户名密码
            if re_pwd != 0:
                res.set_cookie('uname', uname)
            else:
                res.set_cookie('uname', '', max_age=-1)
            request.session['user_id'] = users[0].id  # 可以直接通过id号查信息
            request.session['user_name'] = uname  # 很多页面用到姓名
            return res
        else:
            context = {
                'title': '用户登录',
                'error_name': 0,
                'error_pwd': 1,
                'uname': uname,
                'upwd': upwd
            }
            return render(request, 'user/login.html', context)
    else:
        context = {
            'title': '用户登录',
            'error_name': 1,
            'error_pwd': 0,
            'uname': uname,
            'upwd': upwd
        }
        return render(request, 'user/login.html', context)



# info = login_auth(info)
@user_auth.login
def info(request):
    """个人信息"""
    user_info = UserInfo.objects.get(id=request.session['user_id'])
    goods_list = []
    goods_ids = request.COOKIES.get('goods_ids','') # 避免取不到值，下面的split报错
    if goods_ids != '':
        goods_ids = goods_ids.split(',')
        for goods_id in goods_ids:
            goods_list.append(GoodsInfo.objects.get(id=int(goods_id)))

    context = {
        'title': '用户中心',
        'uname': request.session['user_name'],
        'uphone': user_info.uphone,
        'uaddr': user_info.uaddr,
        'page_name': 1,
        'goods_list':goods_list,

    }
    return render(request, 'user/user_center_info.html', context)

@user_auth.login
def order(request,pindex):
    """全部订单"""
    order_list = OrderInfo.objects.filter(user_id = request.session['user_id']).order_by('-oid')
    paginator = Paginator(order_list, 4)
    if pindex == '':
        pindex = '1'
    page = paginator.page(int(pindex))
    context = {
        'title': '用户中心',
        'page_name': 1,
        'paginator':paginator,
        'page':page,
    }
    return render(request, 'user/user_center_order.html', context)

@user_auth.login
def site(request):
    """收货地址"""
    user_info = UserInfo.objects.get(id=request.session['user_id'])
    if request.method == "POST":
        post = request.POST
        user_info.name = post.get('name')
        user_info.uaddr = post.get('uaddr')
        user_info.uzip_code = post.get('uzip_code')
        user_info.uphone = post.get('uphone')
        user_info.save()
    context = {'title': '用户中心',
               'user_info': user_info,
               'page_name': 1,
               }
    return render(request, 'user/user_center_site.html', context)

@user_auth.login
def logout(request):
    request.session.flush()
    return HttpResponseRedirect('/')