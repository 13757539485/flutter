import 'package:flutter/material.dart';
import 'package:startup_namer/res/listData1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<String> list = new List();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Chip(label: Text("Chip效果")),
        Column(
          children: this.list.map((value) {
            return ListTile(
              title: Text(value),
            );
          }).toList(),
        ),
        RaisedButton(
          child: Text('添加数据'),
          onPressed: () {
            setState(() {
              this.list.add('数据内容');
            });
          },
        )
      ],
    );
  }
}

