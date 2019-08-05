import 'package:flutter/material.dart';
import 'package:startup_namer/res/listData.dart';

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

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 500,
      width: 300,
      color: Colors.orange,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.send, size: 25, color: Colors.white),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.home, size: 25, color: Colors.white),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Icon(Icons.settings, size: 25, color: Colors.white),
          )
        ],
      ),
    ));
  }
}
