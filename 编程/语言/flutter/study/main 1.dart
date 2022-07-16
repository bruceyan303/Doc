/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-22 17:14:05
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              print("builder = $index");
              return Container(
                  // color: Colors.blue[100 * (index % 9)],
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("$index"));
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 4,
                color: Colors.blue[100],
              );
            },
            itemCount: 100),
        // child: ListView.builder(
        //     itemCount: 100,
        //     cacheExtent: 1,
        //     itemBuilder: (context, index) {
        //       print("builder = $index");
        //       return index % 2 == 0
        //           ? Divider(
        //               thickness: 4,
        //               color: Colors.red,
        //             )
        //           : Container(
        //               // color: Colors.blue[100 * (index % 9)],
        //               height: 100,
        //               alignment: Alignment.center,
        //               child: Text("$index"));
        //     }) //(children: <Widget>[
        //   FlutterLogo(
        //     size: 500,
        //   ),
        //   Text(
        //     "颜色排序",
        //     style: TextStyle(fontSize: 32),
        //   ),
        //   FlutterLogo(
        //     size: 500,
        //   ),
        //   Text(
        //     "颜色排序",
        //     style: TextStyle(fontSize: 32),
        //   ),
        //   FlutterLogo(
        //     size: 500,
        //   ),
        // ])
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
