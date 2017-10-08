# coding:utf-8
from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponseRedirect
from models import *
from hashlib import sha1


def register(request):
    # context = []
    return render(request, 'df_user/register.html')


def register_handle(request):
    # 接受用户请求
    post = request.POST
    uname = post.get('user_name')
    upwd = post.get('pwd')
    upwd2 = post.get('cpwd')
    uemail = post.get('email')

    print upwd, upwd2
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
    uname = request.GET.get('uname')
    count = UserInfo.objects.filter(uname=uname).count()
    return JsonResponse({'count': count})


def login(request):
    uname = request.COOKIES.get('uname', '')
    context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 0, 'uname': uname}
    return render(request, 'df_user/login.html', context)


def login_handle(request):
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
            context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 1, 'uname': uname, 'upwd': upwd}
            return render(request, 'df_user/login.html', context)
    else:
        context = {'title': '用户登录', 'error_name': 1, 'error_pwd': 0, 'uname': uname, 'upwd': upwd}
        return render(request, 'df_user/login.html', context)


def info(request):
    user_info = UserInfo.objects.get(id=request.session['user_id'])
    context = {'title': '用户中心',
               'uname': request.session['user_name'],
               'uphone': user_info.uphone,
               'uaddr': user_info.uaddr}
    return render(request, 'df_user/user_center_info.html', context)


def order(request):
    context = {'title':'用户中心'}
    return render(request, 'df_user/user_center_order.html',context)


def site(request):
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
               }
    return render(request, 'df_user/user_center_site.html',context)
