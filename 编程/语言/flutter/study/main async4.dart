/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-23 20:55:29
 * @LastEditors: bruceyan
 * @Description: 
 * @FilePath: \flutter_application_1\lib\main async4.dart
 * 
 */

import 'dart:async';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scroll list Demo  '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final future = Future.delayed(Duration(seconds: 2), () => 33);
  // final stream = Stream.periodic(Duration(seconds: 2), (_) => 66);
  final controller = StreamController();
  //final controller = StreamController.broadcast(); //无缓存
  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  void initState() {
    //controller.sink.add(60);
    // controller.stream.listen((event) {
    //   print("${event.toString()}");
    // }, onError: (err) => print("Error:$err"), onDone: () => print("onDone"));
    // future.then((value) => print("future completed:  $value"));
    // stream.listen((event) {
    //   print("stream $event");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 50), // Theme.of(context).textTheme.headline4,
            child: Column(
              children: [
                ElevatedButton(
                    // style: TextStyle(color: Colors.blue),
                    onPressed: () {
                      controller.sink.add(99);
                    },
                    child: Text(
                      "99",
                      // style: TextStyle(color: Colors.blue),r
                    )),
                ElevatedButton(
                    // style: TextStyle(color: Colors.blue),
                    onPressed: () {
                      controller.sink.add(10);
                    },
                    child: Text(
                      "10",
                      // style: TextStyle(color: Colors.blue),
                    )),
                ElevatedButton(
                    // style: TextStyle(color: Colors.blue),
                    onPressed: () {
                      controller.sink.addError("error");
                    },
                    child: Text(
                      "error",
                      // style: TextStyle(color: Colors.blue),
                    )),
                ElevatedButton(
                    // style: TextStyle(color: Colors.blue),
                    onPressed: () {
                      controller.sink.add("text");
                    },
                    child: Text(
                      "text",
                      // style: TextStyle(color: Colors.blue),
                    )),
                ElevatedButton(
                    // style: TextStyle(color: Colors.blue),
                    onPressed: () {
                      controller.close();
                    },
                    child: Text(
                      "close",
                      // style: TextStyle(color: Colors.blue),
                    )),
                StreamBuilder(
                  // stream: stream,r
                  // stream: controller.stream,
                  stream: controller.stream
                      .where((event) => event is int)
                      .map((event) => event * 2)
                      .distinct(), //数据相同不重构建ui
                  // initialData: initialData,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    print("builder");
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text("none :没有数据流");
                        break;
                      case ConnectionState.waiting:
                        return Text("waiting: 等地数据流");
                        break;
                      case ConnectionState.active:
                        if (snapshot.hasError) {
                          return Text("Active:错误 ${snapshot.error}");
                        } else {
                          return Text("Active:正常数据 ${snapshot.data}");
                        }
                        break;
                      case ConnectionState.done:
                        return Text("done: 数据流已经关闭");
                        break;
                    }
                    return Text("done: 数据流已经关闭");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: Icon(Icons.refresh),
      ),
    );
  }

  _refresh() async {}
}
