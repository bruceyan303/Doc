/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-24 08:26:37
 * @LastEditors: bruceyan
 * @Description: 
 * @FilePath: \doc\编程\flutter\study\main async6.dart
 * 
 */

import 'dart:async';

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
  //final controller = StreamController();
  final _controller = StreamController();
  //final controller = StreamController.broadcast(); //无缓存
  @override
  void dispose() {
    _controller.close();
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
        title: StreamBuilder(
            stream: _controller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("You entered:${snapshot.data}");
              }
              return Text("watting ..");
            }),
      ),
      body: Stack(
        children: [
          Center(child: Puzzle()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Keypad(controller: _controller),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _refresh,
      //   child: Icon(Icons.refresh),
      // ),
    );
  }

  // _refresh() async {}
}

class Puzzle extends StatefulWidget {
  Puzzle({Key? key}) : super(key: key);

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  int a = 1;
  int b = 1;
  late Color _color;
  @override
  void initState() {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _color, //Colors.blue[200],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(24)),
      child: Text(
        "$a+$b",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Keypad extends StatelessWidget {
  final controller;

  const Keypad({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, //真空包装
      crossAxisCount: 3,
      padding: EdgeInsets.all(0.0),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 2 / 1,
      children: List.generate(9, (index) {
        return ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder()),
            backgroundColor:
                MaterialStateProperty.all(Colors.primaries[index][200]),
          ),
          child: Text("${index + 1}", style: TextStyle(fontSize: 26)),
          onPressed: () {
            controller.add(index + 1);
          },
        );
      }),
    );
  }
}
