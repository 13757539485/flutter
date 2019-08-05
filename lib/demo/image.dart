import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 300,
      // child: ClipOval(
      //     child: Image.asset('images/12.jpg',
      //         height: 200, width: 200, fit: BoxFit.cover)),
      child: ClipOval(
        child: Image.network(
          'url',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: Colors.blue,
          border: Border.all(color: Colors.yellow, width: 6.0)),
    ));
  }
}
