# Wnmp by DocTam

> 在 Windows 上运行 NGINX、MySQL 和 PHP

## 使用

① 分别进入 `mysql`、`php`、`nginx` 目录，按照说明进行安装（Windows XP/2003 系统下最高支持版本为 `mysql-5.6.20` `php-5.4.31` `phpmyadmin-4.2.7`）

② 运行 `.\Bin\WebStart.Bat` 启动环境

③ 浏览器访问 `http://localhost/`，出现 `400 Bad Request` 说明 Nignx 配置正常

④ 再次访问 `http://localhost/index.php`，出现 `phpinfo` 信息说明 PHP 配置正常

⑤ 访问 `http://localhost/test.php`，出现 `Connected successfully` 说明数据库配置正常（默认账号：root；默认密码：root;或空密码）

⑥ 访问 `http://localhost/phpmyadmin`，出现 `phpmyadmin` 登录界面说明 phpmyadmin 配置正常

⑦ 运行 `.\Bin\WebStart.Bat` 重启环境或运行 `.\Bin\WebStop.Bat` 停止环境


## 全局变量

如果要在其他地方使用 `mysql`、`php`、`nginx`，可以将其加入环境变量

打开控制面板，在搜索栏输入 `环境变量`，点击 `编辑账户的环境变量`，选中 `path`，点击`编辑`，点击`新建`，加入如下 3 条：

```txt
当前目录\mysql\版本号

当前目录\php\版本号

当前目录\nginx\版本号
```

# 协议

[MIT](https://github.com/DocTam/Wnmp/blob/master/LICENSE)
