## centos 依赖安装:
```
ubuntu : sudo apt-get install libz-dev libpcre3-dev
yum install gcc openssl  openssl-devel pcre pcre-devel zlib zlib-devel -y
./configure --prefix=/usr/local/webserver/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre=/root/pcre-8.44

make

make install
```
## Nginx 配置
创建 Nginx 运行使用的用户 bruceyan
/usr/local/webserver/nginx/sbin/nginx -c /usr/local/webserver/nginx/conf/nginx.conf
 /usr/sbin/groupadd admin 
 /usr/sbin/useradd -g admin bruceyan
vim  /usr/local/webserver/nginx/conf/nginx.conf
 检查配置文件nginx.conf的正确性命令：

/usr/local/webserver/nginx/sbin/nginx -t


/usr/local/openresty/nginx/sbin/nginx -c /usr/local/openresty/nginx/conf/nginx.conf 

## 启动 Nginx
Nginx 启动命令如下：

/usr/local/webserver/nginx/sbin/nginx

ps -ef|grep nginx


/usr/local/webserver/nginx/sbin/nginx -s reload            # 重新载入配置文件
/usr/local/webserver/nginx/sbin/nginx -s reopen            # 重启 Nginx
/usr/local/webserver/nginx/sbin/nginx -s stop              # 停止 Nginx


## 开启端口

redis等服务启动后，外网默认是无法访问的，因为防火墙不允许，所以要开启防火墙，让其可以访问这些端口号。

### 方法一：使用firewall
1. 运行命令：
```
firewall-cmd --get-active-zones
```



2. 执行如下命令命令：
```
firewall-cmd --zone=public --add-port=6379/tcp --permanent
```
3. 重启防火墙，运行命令：
 ```
firewall-cmd --reload
```



4. 查看端口号是否开启，运行命令：
```
firewall-cmd --query-port=6379/tcp
```


### 方法二：使用iptables
1.先运行如下命令：
```
/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
```
2. 然后运行：
```
/etc/rc.d/init.d/iptables save 
```
或者这个命令：
```
-A INPUT -m state –state NEW -m tcp -p tcp –dport 80 -j ACCEPT 
```
3. 再运行这个命令：
```
-A INPUT -j REJECT –reject-with icmp-host-prohibited
```


测试：在windows下按下win+R键，输入cmd，运行命令(需开启telnet)，如果变成空界面表示成功：
```
         telnet  192.168.xx.xx 80
```