/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-22 18:59:55
 * @LastEditors: bruceyan
 * @Description: 
 * @FilePath: \flutter_application_1\lib\main.dart
 * 
 */
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scroll list Demo  '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          title: GestureDetector(
              onTap: () {
                //  _scrollcontroller.jumpTo(0.0); //跳转到指定位置
                _scrollcontroller.animateTo(-20,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear); //动画到指定位置
              },
              child: Text(widget.title)),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2));
          },
          strokeWidth: 4.0,
          color: Colors.white,
          backgroundColor: Colors.blue,
          child: Scrollbar(
            controller: _scrollcontroller,
            child: NotificationListener(
              onNotification: (ScrollNotification _event) {
                print(_event);
                return false; //继续冒泡事件
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                physics: BouncingScrollPhysics(),
                controller: _scrollcontroller,
                itemBuilder: (context, index) {
                  print("builder = $index");
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text("name$index"),
                    subtitle: Text("subtile$index"),
                    trailing: IconButton(
                        onPressed: () {}, icon: Icon(Icons.next_week)),
                  );
                },
                itemCount: 200,
                itemExtent: 60 /* 强制 主轴方向尺寸 */,
              ),
            ),
          ),
        )
        // RefreshIndicator(
        //   onRefresh: () {
        //     return Future.delayed(Duration(seconds: 2));
        //   },
        //   strokeWidth: 4.0,
        //   color: Colors.white,
        //   backgroundColor: Colors.blue,
        //   child: ListView.builder(
        //     padding: const EdgeInsets.only(bottom: 10),
        //     physics: BouncingScrollPhysics(),
        //     controller: _scrollcontroller,
        //     itemBuilder: (context, index) {
        //       print("builder = $index");
        //       return ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text("name$index"),
        //         subtitle: Text("subtile$index"),
        //         trailing:
        //             IconButton(onPressed: () {}, icon: Icon(Icons.next_week)),
        //       );
        //     },
        //     itemCount: 200,
        //     itemExtent: 60 /* 强制 主轴方向尺寸 */,
        //   ),
        // ),
        // Scrollbar(
        //   // isAlwaysShown: true,
        //   // controller: _scrollcontroller,
        //   child: ListView.builder(
        //     padding: const EdgeInsets.only(bottom: 10),
        //     physics: BouncingScrollPhysics(),
        //     controller: _scrollcontroller,
        //     itemBuilder: (context, index) {
        //       print("builder = $index");
        //       // return Container(r
        //       //     color: index % 2 == 0 ? Colors.blue : Colors.white,
        //       //     height: index % 2 == 0 ? 150 : 50,
        //       //     alignment: Alignment.center,
        //       //     child: Text("$index"));
        //       return ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text("name$index"),
        //         subtitle: Text("subtile$index"),
        //         trailing:
        //             IconButton(onPressed: () {}, icon: Icon(Icons.next_week)),
        //       );
        //     },
        //     // separatorBuilder: (context, index) {
        //     //   return Divider(
        //     //     thickness: 4,
        //     //     color: Colors.blue[100],
        //     //   );
        //     // },
        //     itemCount: 200,
        //     itemExtent: 60 /* 强制 主轴方向尺寸 */,
        //   ),
        // ),
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
