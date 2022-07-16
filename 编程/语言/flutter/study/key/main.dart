/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-22 15:54:51
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
  var _color = Colors.blue;
  int _slot = 0;
  double _topoffset = 0.0;
  // List<Color> _colors =
  //     List.generate(8, (index) => Colors.blue[(index + 1) * 100]);
  var _colors = List.generate(8, (index) => Colors.blue[(index + 1) * 100]);
  //final _colors = List.generate(8, (index) => Colors.blue[(index + 1) * 100]);

  // var _colors = [
  //   Colors.blue.shade50,
  //   Colors.blue.shade100,
  //   Colors.blue.shade200,
  //   Colors.blue.shade300,
  //   Colors.blue.shade400,
  //   Colors.blue.shade500,
  //   Colors.blue.shade600,
  //   Colors.blue.shade700,
  //   Colors.blue.shade900,
  // ];

  _shuffle() {
    setState(() {
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _colors = List.generate(8, (index) => _color[(index + 1) * 100]);
      _colors.shuffle();
    });
  }

  _checkWinCondtion() {
    // print(_colors.map((e) => e!.computeLuminance()).toList());
    List<double> lum = _colors.map((e) => e!.computeLuminance()).toList();
    bool sueccess = true;
    for (int i = 0; i < lum.length - 1; i++) {
      if (lum[i] > lum[i + 1]) {
        sueccess = false;
        break;
      }
    }
    print(sueccess ? "win" : "");
    //_colors[0]!.computeLuminance();
  }

  final _globalkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    void onDragfun(Color color) {
      print("onDrage");
      print(color);
      final index = _colors.indexOf(color);
      final readerBox =
          (_globalkey.currentContext!.findRenderObject() as RenderBox);
      // final appBarHeight = readerBox.size.height;
      // print("on drag $index, app bar height=$appBarHeight");
      _topoffset = readerBox.localToGlobal(Offset.zero).dy;

      _slot = index;
      // Future.delayed(
      //     Duration(
      //       seconds: 2,
      //     ), () {
      //   setState(() {
      //     final c = _colors[2];
      //     _colors[2] = _colors[3];
      //     _colors[3] = c;
      //   });
      // });
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(widget.title),
        actions: [IconButton(onPressed: _shuffle, icon: Icon(Icons.refresh))],
      ),
      body: Center(
          child: Column(children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          "颜色排序",
          style: TextStyle(fontSize: 32),
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          width: Box.width - Box.margin,
          height: Box.hight - Box.margin,
          decoration: BoxDecoration(
              color: _color[900], borderRadius: BorderRadius.circular(8.0)),
          child: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: Box.margin,
        ),
        Expanded(
          child: Listener(
              onPointerMove: (evnet) {
                // print(evnet);
                final y = evnet.position.dy - _topoffset;
                // print(y);
                if (y > (_slot + 1) * Box.hight) {
                  if (_slot == (_colors.length - 1)) return;
                  setState(() {
                    final c = _colors[_slot];
                    _colors[_slot] = _colors[_slot + 1];
                    _colors[_slot + 1] = c;
                    _slot++;
                  });
                } else if (y < _slot * Box.hight) {
                  if (_slot == 0) return;
                  setState(() {
                    final c = _colors[_slot];
                    _colors[_slot] = _colors[_slot - 1];
                    _colors[_slot - 1] = c;
                    _slot--;
                  });
                }
              },
              child: SizedBox(
                  width: Box.width,
                  child: Stack(
                    key: _globalkey,
                    // scrollDirection: Axis.horizontal,
                    children: List.generate(_colors.length, (index) {
                      return Box(
                          onDrag: onDragfun,
                          x: 0,
                          y: index * Box.hight,
                          color: _colors[index] as Color,
                          onEnd: _checkWinCondtion,
                          key: ValueKey(_colors[index]));
                    }),
                  ))),
        )
      ])),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Box extends StatelessWidget {
  static double width = 200.0;
  static double hight = 50.0;
  static double margin = 4.0;
  final Color color;
  final double x;
  final double y;

  final void Function(Color) onDrag;
  final Function() onEnd;
  const Box(
      {Key? key,
      this.x = 50.0,
      this.y = 50.0,
      this.color = Colors.blue,
      required this.onDrag,
      required this.onEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var container = Container(
      // margin: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
      width: width - Box.margin,
      height: hight - Box.margin,
      //color: color,
    );
    return AnimatedPositioned(
        top: y,
        left: x,
        duration: Duration(milliseconds: 100),
        child: Draggable(
          child: container,
          onDragStarted: () {
            onDrag(color);
          },
          onDragEnd: (detail) {
            onEnd();
          },
          feedback: container,
          childWhenDragging: Visibility(visible: false, child: container),
        ));
  }
}
