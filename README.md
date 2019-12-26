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

# <a  href="http://ganquanzhong.top/shop" target="_blank" style="text-align:center;color:red;font-size:50px;">ForFuture Shop</a>
#### 项目介绍
> 一个简单的商城Web项目后台主要使用Spring、Spring MVC、MyBatis。前台页面使用Vue框架项目中仍存在许多bug，读者可以进行修改调试

### 软件架构
项目使用Spring、Spring MVC、MyBatis、Vue等框架技术！


### 安装及使用教程

``` xml
1.将项目导入，配置好项目的依赖
   	
2修改数据库连接信息
jdbc.username=##
jdbc.password=##

3.为了避免项目中的图片文件在服务器容器中，将文件上传到磁盘的其他位置   
  E:\\ShopFile\\upload\\  访问路径为/pic
  <Context docBase="E:\ShopFile\upload" path="/pic" reloadable="false"/>
  添加项目图片的访问路径 、更新服务器配置信息【在项目在服务器的host标签里】\重启服务器

4.更具自己图片路劲不同，
  在CommonUtils类中修改
  public static String path="E:\\ShopFile\\upload";//根据自己的路径设定
```

### 项目开发需求
![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153141_db323bba_1134592.png "屏幕截图.png")

### <a  href="http://ganquanzhong.top/shop" target="_blank">项目效果演示</a> 
![shop_index-1](https://gitee.com/uploads/images/2018/0601/115724_87fe5c54_1134592.png "屏幕截图.png")
![shop_index-2](https://gitee.com/uploads/images/2018/0601/115759_671eb7c1_1134592.png "屏幕截图.png")

![login](https://gitee.com/uploads/images/2018/0601/115559_f89c3492_1134592.png "屏幕截图.png")
![shop_info](https://gitee.com/uploads/images/2018/0601/115833_e1287f8c_1134592.png "屏幕截图.png")
![shop_search](https://gitee.com/uploads/images/2018/0601/115908_48117bba_1134592.png "屏幕截图.png")

![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153447_55dcf2de_1134592.png "屏幕截图.png")
![
![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153456_9367a664_1134592.png "屏幕截图.png")](https://images.gitee.com/uploads/images/2019/1226/153448_61de5c7e_1134592.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153450_0522d37d_1134592.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153509_f7ed1710_1134592.png "屏幕截图.png")

### 移动端
![](https://images.gitee.com/uploads/images/2019/1226/153515_638652f3_1134592.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153539_94c53249_1134592.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/1226/153539_1dc2c6f8_1134592.png "屏幕截图.png")

###  💘 info
[more](https://www.cnblogs.com/gqzdev/p/shop.html)
