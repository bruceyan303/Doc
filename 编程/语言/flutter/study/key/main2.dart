/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-22 11:17:11
 * @LastEditors: bruceyan
 * @Description: 
 * @FilePath: \flutter_application_1\lib\main.dart
 * 
 */
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
  int _counter = 0;
  int _slot = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void onDragfun(Color color) {
    print("onDrage");
    print(color);
    final index = _colors.indexOf(color);

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

  var _colors = [
    Colors.blue.shade50,
    Colors.blue.shade100,
    Colors.blue.shade200,
    Colors.blue.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.blue.shade600,
    Colors.blue.shade700,
    Colors.blue.shade900,
  ];
  _shuffle() {
    setState(() {
      _colors.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Listener(
          onPointerMove: (evnet) {
            // print(evnet);
            final x = evnet.position.dx;
            print(x);
            if (x > (_slot + 1) * Box.width) {
              if (_slot == (_colors.length - 1)) return;
              setState(() {
                final c = _colors[_slot];
                _colors[_slot] = _colors[_slot + 1];
                _colors[_slot + 1] = c;
                _slot++;
              });
            } else if (x < _slot * Box.width) {
              if (_slot == 0) return;
              setState(() {
                final c = _colors[_slot];
                _colors[_slot] = _colors[_slot - 1];
                _colors[_slot - 1] = c;
                _slot--;
              });
            }
          },
          child: Stack(
            // scrollDirection: Axis.horizontal,
            children: List.generate(_colors.length, (index) {
              return Box(
                  onDrag: onDragfun,
                  x: index * Box.width,
                  color: _colors[index],
                  y: 200,
                  key: ValueKey(_colors[index]));
            }),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Box extends StatelessWidget {
  static double width = 25.0;
  static double hight = 50.0;
  final Color color;
  final double x;
  final double y;

  final void Function(Color) onDrag;
  const Box(
      {Key? key,
      this.x = 50.0,
      this.y = 50.0,
      this.color = Colors.blue,
      required this.onDrag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var container = Container(
      // margin: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
      width: width - 4,
      height: hight,
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
          feedback: container,
          childWhenDragging: Visibility(visible: false, child: container),
        ));
  }
}
