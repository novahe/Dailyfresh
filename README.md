# Dailyfresh
基于Django的生鲜电商网站

示例：http://59.110.231.224:8000

天天生鲜主页

![天天生鲜主页][2]

用户登录

![用户登录][3]

用户注册

![用户注册][4]

## 主要模块实现
### 模板代码继承及重用
 - 模板继承可以减少页面内容的重复定义，实现页面内容的重用
典型应用：网站的头部、尾部是一样的，这些内容可以定义在父模板中，子模板不需要重复定义
 - 上面的方式解决了大范围html代码重用的问题，在某些只有一小块不一样时，就需要if语句来进行选择显示

`block`标签：在父模板中预留区域，在子模板中填充
`extends`标签：继承，写在模板文件的第一行
在`base.html`中写入以下内容：

```html
<!DOCTYPE html>
<html>
<head>
    <title>天天生鲜 {%block title%}{%endblock%} </title>
</head>
<body>
{% if request.session.user_name|default:'' != '' %}  # 如果user_name空，则不显示

<div class="login_btn fl">
	欢迎您：<em>{{ request.session.user_name }}</em>
	<span>|</span>
	<a href="/user/logout/">退出</a>
</div>

{% else  %}
<div class="login_btn fl">
	<a href="/user/login/">登录</a>
	<span>|</span>
	<a href="/user/register/">注册</a>
</div>
{% endif %}
</body>
```
继承`base.html`的子实例只需要书写很少的代码:

```html
{% extend 'base.html' %}                    # 指明继承模板
{% block title %}用户中心 {% endblock %}    # 子模板填充
```


### 装饰器（登录验证）
`python`装饰器：在不改变原函数调用方法的基础上给函数增加新的功能。
应用场景：在通过url直接访问用户的个人中心时，需要验证用户是否登录，一样的场景为：用户提交订单，用户把商品加入购物车...

项目采用装饰器的方式：
用户验证模块 装饰器 `user_auth.py`:
```python
from django.http import HttpResponseRedirect

def login(func):
    """用户登录认证装饰器"""
    def login_func(request, *args, **kwargs):
        if request.session.has_key('user_id'):      # 检查session是否有user_id
            return func(request, *args, **kwargs)
        else:
            response = HttpResponseRedirect("/user/login/")
            response.set_cookie('uri',request.get_full_path())
            return response
    return login_func
```
在需要验证的函数前加`@user_auth.login`即可:
```
@user_auth.login
def order(request,pindex):  # 用户查看订单信息
    """全部订单"""
    order_list = OrderInfo.objects.filter(user_id = request.session['user_id']).order_by('-oid')
    paginator = Paginator(order_list, 4)
    ...

@user_auth.login
def logout(request):        # 用户退出
    request.session.flush()
    return HttpResponseRedirect('/')
```
这样在每次调用函数时，都会调用装饰器的函数做登录验证，而函数的调用方式并没有改变。

### 分页下标
Django提供了`Paginator`类来管理分页的数据。

在使用`Paginator`时需要给他传递要`分页的对象`和`每一页的个数`。

`Paginator`属性：
> Paginator.count
所有页面的对象总
Paginator.num_pages
页面总数。
Paginator.page_range
页码的范围，从1开始，例如[1, 2, 3,]

`view.py`代码
```python
from django.core.paginator import Paginator,Page

def list(request,pindex):
    goods_list = GoodsInfo.objects.filter(gtype_id = int(tid)).order_by('-gclick')
    pageinator = Paginator(goods_list,10) # 返回列表分页后（对象，每页个数）
    page = pageinator.page(int(pindex))   # 传递页数，返回当前页对象
       context = {
            'page':page,
            }
    return render(request,'df_goods/list.html',context) #通过context传递paginator
```

在`list.html`页面：
```html
<!--分页显示-->
<div class="pagenation">
    <!--当页码为1号时前面的页码不显示-->
	{% if page.has_previous %}
	<a href="/list{{ typeinfo.id }}_{{ page.previous_page_number }}_{{ sort }}/"><上一页</a>
	{% endif %}

    <!--当页码在中间时-->
	{% for pindex in paginator.page_range %}
		{% if pindex == page.number %}
		<a href="#" class="active">{{ pindex }}</a>
		{% else %}
		<a href="/list{{typeinfo.id}}_{{pindex}}_{{sort}}/">{{pindex}}</a>
		{% endif %}
	{% endfor %}

    # 当页为最后一页时，后面的页码不显示
	{% if page.has_next %}
	<a href="/list{{ typeinfo.id }}_{{ page.next_page_number }}_{{ sort }}/">下一页></a>
	{% endif %}

</div>
```
效果如下:


![分页效果][1]

### `Django`提供`ORM`对数据库的操作
在`ORM`中封装了数据库的相关操作，方便我们通过熟悉的方式：`调用类`来简化数据库的操作，但是书写`ORM`类却是又是一个问题，`Django`在`ORM类`上在次封装，使用更加简单。

在`Django`的`model.py`中书写model类
```
from django.db import models

class OrderInfo(models.Model):
    """订单信息"""
    oid = models.CharField(max_length=20,primary_key=True)
    user = models.ForeignKey('df_user.UserInfo')
    odate = models.DateTimeField(auto_now_add=True)  # 订单时间
    oIspay = models.BooleanField(default=True)
    ototal = models.DecimalField(max_digits=6,decimal_places=2)
    oaddress = models.CharField(max_length=150)
```
在数据库中可生成以下表
```
mysql> desc df_order_orderinfo;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| oid      | varchar(20)  | NO   | PRI | NULL    |       |
| odate    | datetime(6)  | NO   |     | NULL    |       |
| oIspay   | tinyint(1)   | NO   |     | NULL    |       |
| ototal   | decimal(6,2) | NO   |     | NULL    |       |
| oaddress | varchar(150) | NO   |     | NULL    |       |
| user_id  | int(11)      | NO   | MUL | NULL    |       |
+----------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

```

ORM类和数据库的对应关系如下（同时还可以生成外键）：

![python中model类与数据库的对应关系][6]

在查询数据时只需对model类操作即可，实例：
```python
from  models import *

order_list = Order.objects.all()    # 获取orderinfo表中的所有信息，返回一个查询集
orders_list = Order.objects.filter(title__contains="%") # 获取orderinfo表中标题中含有%
orders_list = Order.objects.order_by('-oid')      # 以oid号降序排序

```
这种方式简化了数据库操作流程，让我们更专注于业务流程，体现了`Django`高效的开发特点。

### 用户订单提交
主要是步骤较为繁琐，流程图如下：

![订单提交][7]

代码如下：
```python
@transaction.atomic  # 导入事务
@user_auth.login     # 验证登录状态
def order_handle(request):
    tran_id = transaction.savepoint()  # 创建事务还原点
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
```
[1]: http://image.dearecho.me/1509271764304.jpg
[2]: http://image.dearecho.me/1509249000816.jpg
[3]: http://image.dearecho.me/1509254427549.jpg
[4]: http://image.dearecho.me/1509254463324.jpg
[5]: http://image.dearecho.me/1509254538187.jpg
[6]: http://image.dearecho.me/1509265988896.jpg
[7]: http://image.dearecho.me/1509284357312.jpg