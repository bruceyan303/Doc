## 一、环境准备

yum -y install gmp-devel                                                           // 编译依赖此库  
yum -y install mpfr-devel                                                          // 编译依赖此库  
yum -y install libmpc-devel                                                        // 编译依赖此库   
yum -y install bzip2                                                                   // 编译依赖此库

wget ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.15.tar.bz2   // 编译依赖此库
tar -jxvf isl-0.15.tar.bz2  
cd isl-0.15  
./configure   
make  
make install

编译完成，检查gcc版本：

[root@localhost gcc-7.3.0]# gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/local/libexec/gcc/x86_64-pc-linux-gnu/7.3.0/lto-wrapper
Target: x86_64-pc-linux-gnu
Configured with: ./configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
Thread model: posix
gcc version 7.3.0 (GCC) 
 

## 二、gcc源码下载

http://ftp.gnu.org/gnu/gcc/

C++17要求gcc版本在7.1以上

 

## 三、gcc源码编译

tar xvf gcc-7.3.0.tar.gz

chmod -R 777 gcc-7.3.0
cd gcc-7.3.0

./configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
make -j4 #编译非常耗时间，笔者花了大约50min
make install




yum install centos-release-scl

yum install devtoolset-7-gcc*

scl enable devtoolset-7 bash


### 手动安装


>下载

http://mirror.hust.edu.cn/gnu/gcc/

wget http://mirror.hust.edu.cn/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
>解压
tar -zxvf  gcc-10.2.0.tar.gz

>进入目录
```
cd gcc-10.2.0
```
>下载关联库
```
./contrib/download_prerequisites 
```
>> ##### 异常
    ```
    gmp-6.1.0.tar.bz2: OK
    mpfr-3.1.4.tar.bz2: OK
    mpc-1.0.3.tar.gz: OK
    isl-0.18.tar.bz2: FAILED 
    ```
>>>##### 处理
        ```
        rm -f  isl-0.18.tar.bz2 
        ```
>>>##### 重新执行
    ```
    ./contrib/download_prerequisites 
    ```
>#### 建立目录
```
mkdir gcc-build
```
>#### 进入目录
```
cd gcc-build
```
>#### 配置
```
../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
```
>#### 编译
```
make -j4
```
>>异常 
 error: Building GCC requires GMP 4.2+, MPFR 3.1.0+ and MPC 0.8.0+.
>>> 处理
    gmp 
        https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz

        tar -vxf gmp-6.2.1.tar.xz 
        cd gmp-6.2.1

        ./configure --prefix=/usr/local/gmp-6.2.1
        make -j4
        make install
    mpfr
        https://ftp.gnu.org/gnu/mpfr/

        https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz

        tar -vxf mpfr-4.1.0.tar.xz

        ./configure --prefix=/usr/local/mpfr-4.1.0 --with-gmp=/usr/local/gmp-6.2.1

        make -j4
        make install
    mpc
        http://www.multiprecision.org/mpc/download.html
        wget http://www.multiprecision.org/downloads/mpc-1.2.0.tar.gz

        tar -vxf mpc-1.2.0.tar.gz

        ./configure --prefix=/usr/local/mpc-1.2.0 --with-gmp=/usr/local/gmp-6.2.1 --with-mpfr=/usr/local/mpfr-4.1.0
        make -j4 && make install 

            vim /etc/profile
>>> #文件末尾添加
    export PATH="$PATH:/usr/local/gmp-6.2.1"
    export PATH="$PATH:/usr/local/mpfr-4.1.0"
    export PATH="$PATH:/usr/local/mpc-1.2.0"
    
    export PATH="$PATH:/usr/local/gcc-10.2.0"
    #执行使环境变量生效
source/etc/profile

>>> GCC 配置
   ```
   ../configure --prefix=/usr/local/gcc-10.2.0 --enable-checking=release --enable-languages=c,c++ --disable-multilib --with-gmp=/usr/local/gmp-6.2.1 --with-mpfr=/usr/local/mpfr-4.1.0 --with-mpc=/usr/local/mpc-1.2.0
    ```

#### 安装
make install

检查版本

gcc -v
g++ -v

COLLECT_LTO_WRAPPER=/usr/local/libexec/gcc/x86_64-pc-linux-gnu/10.2.0/lto-wrapper
 
update-alternatives --install /usr/bin/gcc gcc /usr/local/gcc-10.2.0/gcc 

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/local/libexec/gcc/x86_64-pc-linux-gnu/10.2.0/lto-wrapper
Target: x86_64-pc-linux-gnu
Configured with: ../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
Thread model: posix
Supported LTO compression algorithms: zlib
gcc version 10.2.0 (GCC) 