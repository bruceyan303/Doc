在执行git clone命令时报错：fatal: early EOF。解决办法如下：

1.关闭压缩

git config --global core.compression 0



error: RPC failed; curl 18 transfer closed with outstanding read data remaining
 
fatal: The remote end hung up unexpectedly
 
fatal: early EOF

 git config --global http.postBuffer 524288000

   这样已经配置好了，如果你不确定，可以根据以下命令查看postBuffer。

   git config --list