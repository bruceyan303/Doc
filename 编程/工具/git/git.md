如何删除GIT远程仓库项目的所有内容，重新提交所有内容
如果我们上传了一个项目到git并已经commit和push了所有内容，但是忘记搞gitignore文件，

导致一些不想加入版本控制的文件，如IDE配置文件，编译文件，部署文件等，

现在不知道怎么办了？

试一试如下命令：

首先配置好你的.gitignore文件，然后

git rm -r --cache .

git add .

git commit -m "gitignore working"




开发过程中，经常会有一些通用的部分希望抽取出来做成一个公共库来提供给别的工程来使用
执行
git submodule update --init --recursive
## 多路服务器
git remote add 名字 网址
git push 名称 分支
git push 名称



创建并切换到latest_branch分支

git checkout --orphan latest_branch
添加所有文件

git add -A
提交更改

git commit -am "删除历史版本记录，初始化仓库"
删除分支

git branch -D master
将当前分支重命名

git branch -m master
强制更新存储库

git push -f origin master
 