## 宝塔 
```
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
```
## 添加 用户 
```
adduser bruceyan
passwd  bruceyan

```
### 增加 sudoers 文件的写的权限，默认为只读

```
chmod -v u+w /etc/sudoers   
vi /etc/sudoers 

```
####  添加这一行
```
bruceyan    ALL=(ALL)       ALL 
```
### 删除 sudoers 的写的权限
```
chmod -v u-w /etc/sudoers 
```
## nvim

```
yum -y install epel-release
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
yum -y install neovim --enablerepo=epel



```
### vim-plug
Neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
## 上传 zr
```
yum -y install lrzsz 
```
## mysql
```
wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
 yum -y install mysql57-community-release-el7-10.noarch.rpm
yum update

yum -y install mysql-community-server
 grep "password" /var/log/mysqld.log

 mysql -uroot -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Long;1qaz';
```
### 打开远程访问
```
grant all privileges on *.* to 'root'@'%' identified by 'Long;1qaz' with grant option;
```
## openresty
```
yum install pcre-devel openssl-devel gcc curl

wget wget https://openresty.org/download/openresty-1.19.3.1.tar.gz
tar -xzvf openresty-1.19.3.1.tar.gz 

cd openresty-1.19.3.1
```
### 默认安装, --prefix=/usr/local/openresty
```
./configure
make
make install
```
### 目录 
```
/usr/local/openresty/site/lualib /usr/local/openresty/site/pod /usr/local/openresty/site/manifest
ln -sf /usr/local/openresty/nginx/sbin/nginx /usr/local/openresty/bin/openresty
```
### vim nginx配置
进入ngnix 根目录
```
cp -r contrib/vim/* ~/.vim/
```
## go
```
 yum install go
 go env -w GOPROXY=https://goproxy.cn,direct
 ```


## node
### 官网

```
https://nodejs.org/en/download/
```

### 下载安装
```
wget https://nodejs.org/dist/v14.16.1/node-v14.16.1-linux-x64.tar.xz
tar -xvf node-v14.16.1-linux-x64.tar.xz
cd node-v14.16.1-linux-x64
pwd   //记住当前目录/root/node-v14.16.1-linux-x64
cd /usr/local/
mv /root/node-v14.16.1-linux-x64 .
```
### 配置 环境
```
vim /etc/profile
export PATH=$PATH:/usr/local/nodejs/bin
source /etc/profile
```
### 查看nodejs是否安装成功
```
node -v
npm -v
```
### 安装cnpm 
```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
