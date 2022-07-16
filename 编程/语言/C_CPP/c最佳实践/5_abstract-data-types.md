#接口设计模块

- ## 两个接口设置原则
  > 1.完备(completeness):完整，不缺东西 2.自洽(self-consistency):无逻辑漏洞，自圆其说。
- ## 完备性的保证：对称设计
  > 1.  有 new，必然有 delete
  > 2.  有 init，必然有 deinit、terminate 或 cleanup
  > 3.  有 create，必然有 destroy
  > 4.  有 open，必然有 close
  > 5.  有 connect，必然有 disconnect
  > 6.  有 read，必然有 write
  > 7.  有 alloc，必然有 free
  > 8.  有 ref，必然有 unref
  > 9.  有 get，必然有 set
- ## 完备性的保证：跟随数据结构
  > 1.  链表，必然有 append、prepend、insertBefore、insertAfter、remove
  > 2.  树，必然有 next、prev、parent、firstChild、lastChild
  > 3.  有序数组，必然有 add，remove、find、getCount、getMemberByIndex
  > 4.  哈希表，必然有 add，remove、find、iterator
  > 5.  AVL/红黑树，必然有 add、remove、find、iterator
- ## 模式一：抽象数据类型
  > 1.  隐藏实现细节，为增强、优化和可扩展性打下基础
  > 2.  围绕抽象数据结构设计接口
  >     > 范例一：STDIO 接口
  >     > 范例二：抽象读取流接口
- ## 模式二：抽象算法

  > 1. 围绕抽象算法设计接口
  > 2. 算法不依赖于具体的数据类型
  > 3. 算法不依赖于具体的数据存储方式
  >    > 范例一：STDC 的 qsort 函数
  >    > 范例二：MINIGUI 的曲线生成器函数

- ## 模式三：隐式上下文
- ### 显式上下文
  > 接口初始化，一直用句柄调用 除非通过接口修改
- ### 隐式上下文
  > ### 实例 1 opengl 中的隐式上下文
  >
  > > 1. 使用线程本地存储（TLS）保存上下文信息。应用无需关注默认上下文的创建和销毁
  > > 2. 在同一个线程内，使用 eglCreateContext 创建多个上下文，使用 eglMakeCurrent 函数切换上下文。
  >
  > ### 实例 2 标准 C 库的错误吗:errno
  >
  > > 文档中是 errno 是一个全局变量
  > >
  > > ```C
  > > extern int errno
  > > ```
  > >
  > > 但实际却被定义为：
  > >
  > > ```C
  > > extern int __error(void);
  > > #define errno (__error())
  > > ```
- ## 模式四：事件/消息驱动
  > 1.  事件/消息驱动最早出现在 GUI 编程中，如 Win32 和各种 GUI 库，用于处理人机交互事件、窗口时间等。
  > 2.  在 Glib、WTF、MiniGUI 当中，被进一步抽象，可用来监听文件描述符（包括套接字和管道）、定时器以及用户定制的事件。
  > 3.  还可用作线程间通讯机制使用。
- ### 事件/消息驱动接口的基本概念

  > 1. 事件/消息生产者
  > 2. 事件/消息消费者
  > 3. 事件/消息处理器（回调函数）

  > MINIGUI 消息驱动
  > 消息驱动接口围绕窗口设计，每个窗口有一个自己的消息处理回调函数。
  > 在 MiniGUI 多线程模式下，每个线程可以创建一个自己的消息队列。
  > 一个消息由一个整数标识符和两个参数组成。
  > 消息的产生者，可通过 PostMessage、SendNotifyMessage 和 SendMessage 三个接口产生消息：
  > 邮寄消息，使用循环队列存储，可能会溢出（丢失）。
  > 通知消息，使用链表存储，不会丢失。
  > 发送消息，同步等待消息的处理并获得处理返回值。
  > 消息的消费者，通过窗口消息处理回调函数接收消息并进行处理。
  > 模式五：通用数据结构
  > 在算法数据结构中保留用户数据字段
  > 以树形结构为例：

  相关术语
  event（事件）
  message（消息）
  event/message-driven（事件/消息驱动）
  callback（回调函数）
  handler（处理器）
  event/message loop（事件/消息循环）
  signal（信号）
  sync.（同步；同步的）
  async.（异步；异步的）

- ## 模式五：通用数据结构
- ## 模式六：抽象聚类
- ## 模式七：面向对象
  > > - 面向对象最本质的特征：派生、重载和多态。
  > > - 早期的 C++ 编译器是将 C++ 代码翻译为 C 代码然后再编译成二进制代码的。
  > > - C++ 的 class 会被翻译为两个 C 的数据结构：
  > >   > 1.  一个数据结构定义该对象的属性（普通结构成员）.
  > >   > 2.  另一个定义这个类的内部数据、类方法（函数指针）以及可重载的虚函数；这个数据结构对所有这个类的对象公用。
  > > - namespace、class 等，在生成的 C 函数名称之前增加前缀。
- ## 模式八：接口的扩展和兼容性
