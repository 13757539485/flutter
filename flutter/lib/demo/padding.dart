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
    return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.network(
                    'https://www.itying.com/images/flutter/1.png',
                    fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.network(
                    'https://www.itying.com/images/flutter/2.png',
                    fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.network(
                    'https://www.itying.com/images/flutter/3.png',
                    fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.network(
                    'https://www.itying.com/images/flutter/4.png',
                    fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.network(
                    'https://www.itying.com/images/flutter/5.png',
                    fit: BoxFit.cover)),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.network(
                    'https://www.itying.com/images/flutter/6.png',
                    fit: BoxFit.cover))
          ],
        );
  }

}
