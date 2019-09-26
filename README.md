## SSM+Vue开发网络商城

[![demo](https://badgen.net/badge/demo/演示)](http://ganquanzhong.top/shop)
[![ForFuture](https://badgen.net/badge/ForFuture/gqzdev/cyan)](http://ganquanzhong.top)
[![github](https://badgen.net/badge/github/github?icon)](https://github.com/gqzdev)
[![csdn](https://badgen.net/badge/blog/ganquanzhong/red)](https://blog.csdn.net/ganquanzhong)
[![stars](https://badgen.net/github/stars/gqzdev/shop)](https://github.com/gqzdev/shop)
[![forks](https://badgen.net/github/forks/gqzdev/shop)](https://github.com/gqzdev/shop)
[![last-commit](https://badgen.net/github/last-commit/gqzdev/shop)](https://github.com/gqzdev/shop)
[![prs](https://badgen.net/github/prs/gqzdev/shop)](https://github.com/gqzdev/shop)
[![gitee](https://badgen.net/badge/gitee/zhong96/orange)](https://gitee.com/zhong96)

# <span style="color:red;font-size:20px;"><center>Future Shop</center></span>

#### 项目介绍
  
>&emsp;&emsp;后台主要使用Spring、Spring MVC、MyBatis整合，api返回json数据；前台页面使用Vue框架进行数据渲染。
>项目中仍存在许多bug和不完善的地方，欢迎大家fork，pull request
> **<a href="http://ganquanzhong.top/shop/" target="_blank">演示地址</a>** 
 
| desc | api |
|:--|:--| 
|获取商品分类  | http://ganquanzhong.top/shop/getCategories|
|获取轮播商品图片|http://ganquanzhong.top/shop/getProductPic|
|获取最新商品|http://ganquanzhong.top/shop/getNewProduct|
|获取热门商品|http://ganquanzhong.top/shop/getHotProduct |

 

#### 软件架构
项目使用Spring、Spring MVC、MyBatis、Vue、Bootstrap等框架技术！

#### 安装及使用教程

```java
1.将项目导入

2修改数据库连接信息
jdbc.username=##
jdbc.password=##

3.为了避免项目中的图片文件在服务器容器中，将文件上传到磁盘的其他位置
         设置  E:\\ShopFile\\upload\\  访问路径为/pic
	 <Context docBase="E:\ShopFile\upload" path="/pic" reloadable="false"/>
  添加项目图片的访问路径 、更新服务器配置信息【在项目在服务器的host标签里】\重启服务器

4.更具自己图片路劲不同，
  在CommonUtils类中修改
  public static String path="E:\\ShopFile\\upload";//根据自己的路径设定
```

#### 参与贡献

1. Fork 本项目
2. 新建 Future_shop 分支
3. 提交代码
4. 新建 Pull Request

### 项目演示
 
 
![shop_index-1](https://gitee.com/uploads/images/2018/0601/115724_87fe5c54_1134592.png "屏幕截图.png")
![shop_index-2](https://gitee.com/uploads/images/2018/0601/115759_671eb7c1_1134592.png "屏幕截图.png")

![login](https://gitee.com/uploads/images/2018/0601/115559_f89c3492_1134592.png "屏幕截图.png")
![shop_info](https://gitee.com/uploads/images/2018/0601/115833_e1287f8c_1134592.png "屏幕截图.png")
![shop_search](https://gitee.com/uploads/images/2018/0601/115908_48117bba_1134592.png "屏幕截图.png")
