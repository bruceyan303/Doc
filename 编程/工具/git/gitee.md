简易的命令行入门教程:
Git 全局设置:
git config --global user.name "bruceyan"
git config --global user.email "longtou303@gmail.com"
创建 git 仓库:
mkdir c_cpp_to_java
cd c_cpp_to_java
git init
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin https://gitee.com/szxinken/c_cpp_to_java.git
git push -u origin master
已有仓库?
cd existing_git_repo
git remote add origin https://gitee.com/szxinken/c_cpp_to_java.git
git push -u origin master
