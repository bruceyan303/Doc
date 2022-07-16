/*
 * @Author: bruceyan
 * @Date: 2021-08-22 09:34:47
 * @LastEditTime: 2021-08-22 22:41:37
 * @LastEditors: bruceyan
 * @Description: 
 * @FilePath: \flutter_application_1\lib\main.dart
 * 
 */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  List<GithubEvent> _evnets = [];
  @override
  Widget build(BuildContext context) {
    print("List ${_evnets.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            await _refresh();
          },
          child: ListView(
            children: _evnets.length > 0
                ? _evnets.map<Widget>((GithubEvent evnet) {
                    return Dismissible(
                      key: ValueKey(evnet.id),
                      confirmDismiss: (_) {
                        return showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("Are you sure?"),
                                content:
                                    Text("Do you want to detele this item?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.of(context).pop(false);
                                      },
                                      child: Text("cancel")),
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.of(context).pop(true);
                                      },
                                      child: Text(
                                        "detele",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              );
                            });
                      },
                      onDismissed: (_) {
                        setState(() {
                          _evnets
                              .removeWhere((element) => element.id == evnet.id);
                        });
                      },
                      //dismissThresholds: ,
                      child: ListTile(
                        leading: Image.network(evnet.avatarUrl),
                        title: Text("${evnet.username}"),
                        subtitle: Text("${evnet.reponame}"),
                      ),
                    );
                  }).toList()
                : [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,
                        child: Text("获取数据失败"))
                  ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: Icon(Icons.refresh),
      ),
    );
  }

  _refresh() async {
    var url = Uri.https('api.github.com', '/events');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      // print(res.body);
      final json = convert.jsonDecode(res.body);
      print("\r\n-------------------------------\r\n");

      print(json);
      print("\r\n------------------------------\r\n");
      _evnets.clear();
      _evnets.addAll(json.forEach((item) {
        GithubEvent event = GithubEvent(item);
        if ((event.id.length > 0) &&
            (event.username.length > 0) &&
            (event.avatarUrl.length > 0) &&
            (event.reponame.length > 0)) return event;
      }));
      setState(() {});
      // print(_evnets);
    } else {
      print(res.statusCode);
    }
  }
}

class GithubEvent {
  String id = "";
  String username = "";
  String avatarUrl = "";
  String reponame = "";
  //GithubEvent(this.id, this.avatarUrl, this.reponame, this.username);
  GithubEvent(json) {
    if ((json["id"] != null) &&
        (json["actor"]["login"] != null) &&
        (json["actor"]["avatar_url"] != null) &&
        (json["repo"]["name"] != null)) {
      print(json["id"]);
      print(json["actor"]["login"]);
      print(json["actor"]["avatar_url"]);
      print(json["repo"]["name"]);

      this.id = json["id"];

      this.username = json["actor"]["login"];

      this.avatarUrl = json["actor"]["avatar_url"];
      this.reponame = json["repo"]["name"];
    }
  }
  @override
  String toString() {
    return 'GithubEvent{id:$id,username:$username,avatarUrl:$avatarUrl,reponame:$reponame}';
    //return super.toString();
  }
}
