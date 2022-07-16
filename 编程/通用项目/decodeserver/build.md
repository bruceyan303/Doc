windows vs2019 
WIN32 //
_WINDOWS
由于高版本的visual studio默认不让使用scanf等函数，认为这些函数不够安全，而其相对应的代替函数为scanf_s等。如果在visual studio中使用scanf等那些visual studio认为不安全的函数，就会报错。以下几种方法可以解决该问题：
_CRT_SECURE_NO_WARNINGS
不加载MFC所需的模块。如果你的工程不使用MFC，就加上这句，这样一来在编译链接时，包括最后生成的一些供调试用的模块时，速度更快，容量更小。
WIN32_LEAN_AND_MEAN

https://gitee.com/bruceyan83/jansson.git
HAVE_CONFIG_H  
后台运行

nohup bin/DecodeServer &

ps -ef |grep DecodeServer


1 make 提示 -bash: make: command not found的解决办法

安装：

yum -y install gcc automake autoconf libtool make

安装g++:

yum install gcc gcc-c++


2  g++: error: unrecognized command line option ‘-std=c++17’

安装最新的GCC


yum install centos-release-scl


yum install devtoolset-9-gcc*

scl enable devtoolset-9 bash