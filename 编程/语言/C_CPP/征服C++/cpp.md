> ## 函数
>
> > ## 编译时生产常量的函数
> >
> > `constexpr `
> >
> > - 函数有 constexpr 关键值得函数不能定义函数原型
> > - constexpr 函数内部语句必须可以可以转换为常量
> >
> > ## 引用类型的变量
> >
> > 声明 变量 expression 结果为类型
> > decltype(expression) var
> >
> > - espression 是一个未用括号括起来的标识符，var 的类型何标识符的类型相同，包括 const 等限定符
> > - expression 是函数调用，var 的类型何函数的返回值得类型相同, 包括 const 等限定符
> > - expression 是一个带括号的标识符，var 的类型是标识符对应类型的引用类型 decltype((int)) var
> > - expression 上述三种情况都不满足，var 的类型是 expression 结果的类型的类型
> >
> > ```cpp
> > template<typename T1, typename T2>
> > auto fun(T1 x,T2  y) ->decltype(x+y)
> > {
> >     return x+y;
> > }
> >
> > ```

> ## 编译、链接何命名空间
>
> > - 语音链接性 函数符号名
> >   C 语言：
> >   一个函数对应一个名称 process(int) \_process
> >   c++ 语言：
> >   一个函数对应一个名称 process(int) \_process_int
> >   process(float,double) \_process_float_double
> >   解决 C++编译器 用的 C 语言的函数名称 extern "C" void process(int) ;//C 必须大写 会 C 规则生成\_process 函数符号名
> > - 命名空间 `namespace`
> >   命令空间可以是全局的（外部链接性），也可以存在于另一个命名空间内部（嵌套命名空间）
> >
> > ```cpp
> > int value =50;
> > namespace namespace1{
> >     int value =10;
> >     void process(int x);
> > }
> > namespace namespace2{
> >     int value=20;
> > }
> >  int main(int argc, char* argv[])
> > {
> >     using namespace1::value;//后面直接用value
> >     using namespace1::process;//process
> >     return 0;
> > }
> > namespace namespace1{
> >  void process(int x)
> > {
> >     cout<<x<<endl;
> > }
> > }
> >
> > ```
> >
> > ```cpp
> >
> > namespace person{
> > int id =0;
> > namespace teacher{
> > int id =20;
> > int age=30;
> > }
> > namespace student{
> > int id =10;
> > int age=20;
> > }
> > }
> > namespace namespace2{
> > int value=20;
> > }
> > using namespace person;
> > int main(int argc, char* argv[])
> > {
> > cout<<id<<endl;//0
> > cout<<person::teacher::id<<endl;//20
> > using person::student:id;
> > cout<<id<<endl;//10
> >
> > }
> > ```
> >
> > 匿名命名空间
> > 1 不能在其他 文件中使用匿名命名空间的任何资源
> > 2 匿名命名空间可以代替 static，拥有内部链接性

> ## 类和对象
>
> > - 类的构造函数定义时产生歧义不引用不会报错，只有在调用是才会出错
> > - 常量方法 不能修改成员变量 const 加在方法后面
> > - 操作重载
> >   只能通过成员重载（inline ）：=、（）、 []、-> 其他可以通过函数实现
> >
> >   > - 重载 用友元函数
> >   >
> >   > ```cpp
> >   > #include <iostream>
> >   > using namespace std;
> >   > class MyClass{
> >   > private:
> >   >     int m_value;
> >   > public:
> >   >     MyClass(int value)
> >   >     {
> >   >         m_value=value;
> >   >     }
> >   >     friend ostream& operator <<(ostream &os,Myclass *myClass);
> >   > }
> >   > ostream& operator<<(ostream &os,Myclass *myClass){
> >   >   return  os<<myClass.m_value;
> >   > }
> >   > int main(int argc void* argv[]){
> >   >     MyClass myClass(20);
> >   >     cout<<myClass<<"test 123" <<endl;
> >   >     return 0;
> >   > }
> >   >
> >   > ```
> >
> > - 类型转换 数值和对象间
> >
> > ```cpp
> > #include <iostream>
> > using namespace std;
> > class MyClass{
> > private:
> >     int m_value;
> > public:
> >     MyClass(int value)
> >     {
> >         m_value=value;
> >     }
> >    operator int();
> >    operator double();
> > }
> > MyClass::operator int(){
> >   return  m_value;
> > }
> >  MyClass::operator double(){
> >   return  m_value*1.0;
> > }
> > int main(int argc void* argv[]){
> >     MyClass myClass(30);
> >     int value =myClass;
> >     cout<<value<<endl;
> >     return 0;
> > }
> >
> > ```
> >
> > - 复制构造方法 值复制
> > - 类的继承
> >   virtual public protected private
> >
> > ## 单例模式
> >
> > 1. 不能使用 new 创建对象，也不能直接定义类变量
> > 2. 至少需要提供一个静态的方法，用返回唯一的对象实例
> >
> > ```cpp
> > class SingletonClass{
> > private:
> >     int m_code;
> >     static SingletonClass * instance;
> >     SingletonClass()
> >     {}
> >     SingletonClass(int code)
> >     {
> >          m_code=code;
> >     }
> > public:
> >     static SingletonClass *getInstance()
> >     {
> >         if(instance==nullptr){
> >             instance= new SingletonClass();
> >         }
> >         return instance;
> >     }
> >     static SingletonClass *getInstance(int code )
> >     {
> >         if(instance==nullptr){
> >             instance= new SingletonClass(code);
> >         }
> >         return instance;
> >     }
> > }
> > SingletonClass * SingletonClass::instance=nullptr;
> > int main(int argc, void * argv[])
> > {
> >     SingletonClass *instance1 SingletonClass::GetInstance();
> >     SingletonClass *instance2= SingletonClass::GetInstance(123);
> >     if(instance1==instance1)
> >     {
> >         count<<"instance1==instance1"<<endl;
> >     }
> > }
> > ```
> >
> > - 单个参数构造方法前 加 explicit 关键字 表示禁止是用隐式 构造
> >
> > ```cpp
> > class Integer{
> > private:
> >    int m_code;
> > public:
> >    Integer(int code)
> >    {
> >         m_code=code;
> >    }
> > }
> >  class Integer1{
> > private:
> >    int m_code;
> > public:
> >   explicit  Integer(int code)
> >    {
> >         m_code=code;
> >    }
> > }
> > int main(int argc, void * argv[])
> > {
> >    Integer n=20;//可以
> >   // Integer1 n1=20;//error 不可以
> >   Integer1 n1=Integer1(20);//只可以
> > }
> >
> > ```
