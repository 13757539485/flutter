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
    return IconView(Icons.home, boxSize: 28, boxColor: Colors.blue);
  }
}

class IconView extends StatelessWidget {
  double boxSize = 32.0;
  Color boxColor = Colors.red;
  IconData icon;

  IconView(this.icon, {this.boxSize, this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: this.boxColor,
          border: Border.all(color: Colors.yellow, width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Icon(this.icon, color: Colors.white, size: this.boxSize),
      ),
    );
  }
}
