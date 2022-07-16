在安装 RabbitMQ 中需要注意：
1、RabbitMQ 依赖于 Erlang，需要先安装 Erlang
2、Erlang 和 RabbitMQ 版本有对应关系
https://www.rabbitmq.com/which-erlang.html
后台启动 rabbitmq 服务

./rabbitmq-server -detached
win rabbitmq-server -detached
添加其他用户
因为 guest 用户只能在本机访问，添加一个 admin 用户，密码也是 admin

./rabbitmqctl add_user admin admin
./rabbitmqctl set_user_tags admin administrator
./rabbitmqctl set_permissions -p / admin ".\*" "._" ".\*"
win
rabbitmqctl add_user admin admin
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions -p / admin "._" ".\_" ".\*"

启用管理插件

./rabbitmq-plugins enable rabbitmq_management
