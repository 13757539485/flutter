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

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        MyButton("斗罗大陆"),
        MyButton("天龙八部"),
        MyButton("斗鱼"),
        MyButton("大主宰"),
        MyButton("逆仙"),
        MyButton("最好的我们"),
        MyButton("酒神")
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  const MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
      onPressed: (){},
    );
  }
}
