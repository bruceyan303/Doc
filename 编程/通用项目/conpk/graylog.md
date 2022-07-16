yum install -y java-1.8.0-openjdk-headless.x86_64


sudo yum install -y epel-release

sudo yum install -y pwgen


## mongodb

vim /etc/yum.repos.d/mongodb-org.repo
写入

```
[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc

```


sudo yum install -y mongodb-org
sudo systemctl daemon-reload
sudo systemctl enable mongod.service
sudo systemctl start mongod.service
sudo systemctl --type=service --state=active | grep mongod


## GPG-KEY-elasticsearch

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
vim /etc/yum.repos.d/elasticsearch.repo
写入

```
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/oss-7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
```


sudo yum install -y elasticsearch-oss


### 分步执行

<!-- sudo tee -a /etc/elasticsearch/elasticsearch.yml > /dev/null <<EOT
cluster.name: graylog
action.auto_create_index: false

vim /etc/elasticsearch/elasticsearch.yml
cluster.name: graylog
在尾部加
action.auto_create_index: false
=======
EOT
内网 ip
>>>>>>> 7f759d8ce750359962eb1123b692cd7ab11a0cdc:编程/语言/go/log/graylog.md

### 启动

sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl restart elasticsearch.service
sudo systemctl --type=service --state=active | grep elasticsearch

## graylog

sudo rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-4.2-repository_latest.rpm

sudo yum -y install graylog-server graylog-enterprise-plugins graylog-integrations-plugins graylog-enterprise-integrations-plugins


sudo yum -y install graylog-server

### 准备密码

pwgen -N 1 -s 96 --->>password_secret

echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1
输入密码 拷贝 生产的 sha256sum 添加 root_password_sha2
admin 对应
8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918

long123
f5eaf16c8ba5cfa0c97a11e73f2ae375eb8c97653794d9911cffbed1124371e1

2:echo -n admin | sha256sum

```
vim /etc/graylog/server/server.conf
password_secret
root_password_sha2

add :
root_timezone = Asia/Shanghai
allow_highlighting = true
elasticsearch_cluster_name = graylog
elasticsearch_shards = 1
elasticsearch_replicas = 0
mongodb_useauth = false
```

为 java 执行目录建立软连接

ln -s /usr/local/jdk1.8.0_191/bin/java /usr/bin/java

日志目录

tail -50f /var/log/graylog-server/server.log

tail -50f /var/log/message

sudo systemctl daemon-reload
sudo systemctl enable graylog-server.service
sudo systemctl restart graylog-server.service
sudo systemctl --type=service --state=active | grep graylog




/usr/share/graylog-server/bin
